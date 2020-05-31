//
//  OnBoardCoordinator.swift
//  FreshFood
//
//  Created by Veli on 31.05.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import UIKit


class OnBoardCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []

    private let navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let onBoardController = OnBoardViewController.instance()
        navigationController.setViewControllers([onBoardController], animated: false)
        navigationController.setNavigationBarHidden(true, animated: true)
    }
}
