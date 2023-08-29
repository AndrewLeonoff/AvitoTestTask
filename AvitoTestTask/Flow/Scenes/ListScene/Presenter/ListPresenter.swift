//
//  ListPresenter.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

import UIKit

/// Презентер списка объявлений
final class ListPresenter {
    weak var view: ListPresenterToView?
    weak var coordinator: ListPresenterToCoordinator?

    private let service: ListServiceInput
    private let imageLoader: ImageLoaderInput

    private(set) var viewModels: [CardViewModel] = []
    private var loadingIds: Set<String> = []

    private lazy var dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMMM yyyy"

        return dateFormatter
    }()

    /// Инициализирует презентер списка объявлений
    /// - Parameters:
    ///   - service: Сервис получения списка объявлений
    ///   - imageLoader: Сервис для загрузки изображений
    init(service: ListServiceInput, imageLoader: ImageLoaderInput) {
        self.service = service
        self.imageLoader = imageLoader
    }

    private func fetchContent() {
        view?.state = .loading(title: "Загружается список объявлений...")

        callAsyncThrowing { [service] in
            try await service.requestList()
        } completion: { [weak self] result in
            switch result {
            case .success(let schema):
                self?.makeViewModels(with: schema)
                self?.view?.state = .content
            case .failure(let error):
                let errorMessage = (error as? RequestSenderError)?.description ?? error.localizedDescription
                self?.view?.state = .error(title: errorMessage, buttonTitle: "Обновить")
            }
        }
    }

    private func makeViewModels(with schema: ListSchema) {
        viewModels = schema.advertisements.map {
            CardViewModel(
                id: $0.id,
                title: $0.title,
                price: $0.price,
                location: $0.location,
                imageUrl: $0.imageUrl,
                createdDate: dateFormatter.string(from: $0.createdDate)
            )
        }
    }

    private func updateImage(_ image: UIImage?, for index: Int) {
        guard let image else { return }

        viewModels[index].image = image
        view?.setImage(image, for: IndexPath(item: index, section: 0))
    }
}

// MARK: - ListPresenterInput

extension ListPresenter: ListPresenterInput {
    var itemCount: Int { viewModels.count }

    func didLoad() {
        fetchContent()
    }

    func didUpdateButtonTap() {
        fetchContent()
    }

    func didCardTap(indexPath: IndexPath) {
        let id = viewModels[indexPath.item].id
        coordinator?.presentDetailsScene(for: id)
    }

    func loadImage(id: String) {
        guard !loadingIds.contains(id),
              let index = viewModels.firstIndex(where: { $0.id == id }),
              let url = URL(string: viewModels[index].imageUrl)
        else { return }

        loadingIds.insert(id)
        callAsyncThrowing { [imageLoader] in
            try await imageLoader.downloadImage(url: url)
        } completion: { [weak self] result in
            switch result {
            case .success(let image):
                self?.updateImage(image, for: index)
            case .failure:
                break
            }
            self?.loadingIds.remove(id)
        }
    }
}
