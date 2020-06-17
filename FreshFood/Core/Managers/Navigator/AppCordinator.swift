//
//  AppCordinator.swift
//  FreshFood
//
//  Created by Veli on 31.05.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import UIKit

protocol Coordinator {
    var childCoordinators: [Coordinator] { get }
    func start() throws
}

final class AppCordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []

    private let window: UIWindow
    init(window: UIWindow) {
        self.window = window
    }

    func start() throws{
        let navigationController = UINavigationController()
        let onBoardCoordinator = OnBoardCoordinator(navigationController: navigationController)
        do {
            try onBoardCoordinator.start()
        } catch is UIViewControllerError {
            print("Doesn't start controller")
        }



        childCoordinators.append(onBoardCoordinator)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
