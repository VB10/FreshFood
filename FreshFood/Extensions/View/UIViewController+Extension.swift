//
//  UIViewController+Extension.swift
//  FreshFood
//
//  Created by Veli on 2.06.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import UIKit


extension UIViewController {

    static func instantiate<T>(storyBoardName: String?) throws -> T {
        let _storyBoard = storyBoardName ?? "Main"
        let storyBoard = UIStoryboard(name: _storyBoard, bundle: .main)
        if let controller = storyBoard.instantiateViewController(identifier: "\(T.self)") as? T {
            return controller
        } else {
            throw UIViewControllerError.notFound

        }
    }
}


enum UIViewControllerError: Error {
    case notFound
}
