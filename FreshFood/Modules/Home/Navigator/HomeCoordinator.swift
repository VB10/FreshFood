//
//  OnBoardCoordinator.swift
//  FreshFood
//
//  Created by Veli on 31.05.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import UIKit


class HomeCoordinator: Coordinator {

    var childCoordinators: [Coordinator] = []

    private let navigationController: UINavigationController
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    let pageStoryBoard: String = "OnBoard"


    func start() throws {
        do {
            let onBoardController: OnBoardViewController = try .instantiate(storyBoardName: pageStoryBoard)
            onBoardController.viewModel = OnBoardViewModel()
            navigationController.setViewControllers([onBoardController], animated: false)
            navigationController.setNavigationBarHidden(true, animated: true)

        } catch is UIViewControllerError {
            print("Not Found")
        }
    }
}
