//
//  OnBoardViewModel.swift
//  FreshFood
//
//  Created by Veli on 2.06.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation


class OnBoardViewModel {

    func setupListOnBoardData() -> Array<OnBoardModel> {
        return [OnBoardModel(image: "circle_basket", description: "Quickly search and add healthy foods to your cart"),
            OnBoardModel(image: "circle_apple", description: "With one click you can add every ingredient for a recipe to your cart"),]
    }
}
