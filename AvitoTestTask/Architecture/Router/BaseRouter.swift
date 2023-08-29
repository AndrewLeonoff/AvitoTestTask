//
//  BaseRouter.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

import UIKit

/// Базовый роутер для навигации приложения
final class BaseRouter {
    private weak var rootController: UINavigationController?

    /// Инициализирует базовый роутер для навигации приложения
    /// - Parameter rootController: Контроллер для навигации
    init(rootController: UINavigationController) {
        self.rootController = rootController
    }

    /// Создает базовый роутер для навигации приложения
    /// - Parameter navigationController: Контроллер для навигации
    /// - Returns: Роутер
    static func makeRouter(_ navigationController: UINavigationController? = nil) -> Router {
        BaseRouter(rootController: navigationController ?? UINavigationController())
    }
}

extension BaseRouter: Router {
    func setRootModule(_ scene: Presentable?) {
        guard let viewController = scene?.toPresent(), !(viewController is UINavigationController) else {
            assertionFailure("Deprecated push UINavigationController.")
            return
        }

        rootController?.setViewControllers([viewController], animated: false)
    }

    func push(_ scene: Presentable?) {
        guard let viewController = scene?.toPresent(), !(viewController is UINavigationController) else {
            assertionFailure("Deprecated push UINavigationController.")
            return
        }

        rootController?.pushViewController(viewController, animated: true)
    }
}
