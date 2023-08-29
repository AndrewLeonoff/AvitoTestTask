//
//  DetailsPresenter.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

import Foundation

/// Презентер списка объявлений
final class DetailsPresenter {
    weak var view: DetailsPresenterToView?

    private let id: String
    private let service: DetailsServiceInput
    private let actionHandler: ActionHandlerInput
    private let imageLoader: ImageLoaderInput

    private var viewModel: DetailsViewModel = .empty

    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"

        return dateFormatter
    }()

    /// Инициализирует презентер списка объявлений
    /// - Parameters:
    ///   - id: Идентификатор объявления
    ///   - service: Сервис получения подробной информации объявления
    ///   - actionHandler: Обработчик действий
    ///   - imageLoader: Сервис для загрузки изображений
    init(id: String, service: DetailsServiceInput, actionHandler: ActionHandlerInput, imageLoader: ImageLoaderInput) {
        self.id = id
        self.service = service
        self.actionHandler = actionHandler
        self.imageLoader = imageLoader
    }

    private func fetchContent() {
        view?.state = .loading(title: "Загружается объявление...")

        callAsyncThrowing { [self] in
            try await self.service.requestDetails(id: self.id)
        } completion: { [weak self] result in
            guard let self else { return }

            switch result {
            case .success(let schema):
                self.prepareViewModel(with: schema)
                self.view?.updateContent(with: self.viewModel)
                self.view?.state = .content
                self.requestImage(urlString: schema.imageUrl)
            case .failure(let error):
                let errorMessage = (error as? RequestSenderError)?.description ?? error.localizedDescription
                self.view?.state = .error(title: errorMessage, buttonTitle: "Обновить")
            }
        }
    }

    private func prepareViewModel(with schema: DetailsSchema) {
        viewModel = .init(
            title: schema.title,
            price: schema.price,
            location: schema.location,
            createdDate: "Дата публикации: " + dateFormatter.string(from: schema.createdDate),
            description: schema.description,
            email: schema.email,
            phoneNumber: schema.phoneNumber,
            address: schema.address
        )
    }

    private func requestImage(urlString: String) {
        callAsyncThrowing { [imageLoader] in
            guard let url = URL(string: urlString) else {
                throw RequestSenderError.unknown
            }
            return try await imageLoader.downloadImage(url: url)
        } completion: { [weak self] result in
            switch result {
            case .success(let image):
                guard let image else { return }
                self?.view?.setImage(image)
            case .failure:
                break
            }
        }
    }
}

// MARK: - DetailsPresenterInput

extension DetailsPresenter: DetailsPresenterInput {
    func didLoad() {
        fetchContent()
    }

    func didUpdateButtonTap() {
        fetchContent()
    }

    func didCallButtonTap() {
        guard !actionHandler.callTo(viewModel.phoneNumber) else { return }
        view?.presentAlert(title: "Ошибка", message: "Данное устройство не поддерживает звонки.")
    }

    func didEmailButtonTap() {
        guard !actionHandler.emailTo(viewModel.email) else { return }
        view?.presentAlert(title: "Ошибка", message: "Данное устройство не поддерживает отправку писем.")
    }
}
