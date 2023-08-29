//
//  CoordinatorFactory.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 28.08.2023.
//

import UIKit

final class CoordinatorFactory {
    func makeApplicationCoordinatorBox() -> (coordinator: Coordinator, scene: Presentable) {
        let navigationController = UINavigationController()
        let router = BaseRouter.makeRouter(navigationController)
        let requestSender = RequestSender()
        let imageLoader = ImageLoader(requestSender: requestSender)
        let sceneAssembler = SceneAssembler(imageLoader: imageLoader)
        let applicationCoordinator = ApplicationCoordinator(router: router, sceneAssembler: sceneAssembler)

        return (applicationCoordinator, navigationController)
    }
}
