//
//  SceneAssembler.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

/// Сборщик сцен
final class SceneAssembler {
    private let imageLoader: ImageLoaderInput

    init(imageLoader: ImageLoaderInput) {
        self.imageLoader = imageLoader
    }
}

// MARK: - SceneAssembly

extension SceneAssembler: SceneAssembly {
    func makeListScene(coordinator: ListPresenterToCoordinator) -> Presentable {
        let requestSender = RequestSender()
        let service = ListService(requestSender: requestSender)
        let presenter = ListPresenter(service: service, imageLoader: imageLoader)
        let view = ListViewController(presenter: presenter)
        presenter.view = view
        presenter.coordinator = coordinator

        return view
    }

    func makeDetailsScene(for id: String) -> Presentable {
        let requestSender = RequestSender()
        let service = DetailsService(requestSender: requestSender)
        let actionHandler = ActionHandler()
        let presenter = DetailsPresenter(
            id: id,
            service: service,
            actionHandler: actionHandler,
            imageLoader: imageLoader
        )
        let view = DetailsViewController(presenter: presenter)
        presenter.view = view

        return view
    }
}
