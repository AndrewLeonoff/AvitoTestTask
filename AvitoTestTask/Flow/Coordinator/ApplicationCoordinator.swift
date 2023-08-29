//
//  ApplicationCoordinator.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

/// Координатор навигации приложения
final class ApplicationCoordinator: Coordinator {
    private let router: Router
    private let sceneAssembler: SceneAssembly

    /// Инициализирует координатор навигации приложения
    /// - Parameters:
    ///   - router: Роутер
    ///   - sceneAssembler: Сборщик сцен
    init(router: Router, sceneAssembler: SceneAssembly) {
        self.router = router
        self.sceneAssembler = sceneAssembler
    }

    func start() {
        let scene = sceneAssembler.makeListScene(coordinator: self)
        router.setRootModule(scene)
    }
}

// MARK: - ListPresenterToCoordinator

extension ApplicationCoordinator: ListPresenterToCoordinator {
    func presentDetailsScene(for id: String) {
        let scene = sceneAssembler.makeDetailsScene(for: id)
        router.push(scene)
    }
}
