//
//  AppDelegate.swift
//  AvitoTestTask
//
//  Created by Andrew Leonov on 27.08.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    private var applicationCoordinator: Coordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let coordinatorFactory = CoordinatorFactory()
        let (coordinator, scene) = coordinatorFactory.makeApplicationCoordinatorBox()

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.overrideUserInterfaceStyle = .unspecified
        window.rootViewController = scene.toPresent()
        window.makeKeyAndVisible()

        self.window = window

        coordinator.start()
        applicationCoordinator = coordinator
        
        return true
    }
}

