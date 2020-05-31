//
//  OnBoardViewController.swift
//  FreshFood
//
//  Created by Veli on 27.05.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import UIKit

class OnBoardViewController: UIViewController {
    @IBOutlet weak var pageView: UICollectionView!

    @IBOutlet weak var pageControl: UIPageControl!
    let pageUniquekey: String = "OnBoardIdentifier"
    let cellOnBoardName: String = "OnBoardViewCell"

    static func instance() -> OnBoardViewController {
        let pageIdentifier: String = "OnBoardVC"
        let pageStoryBoard: String = "OnBoard"
        let storyBoard = UIStoryboard(name: pageStoryBoard, bundle: .main)
        if let controller = storyBoard.instantiateViewController(identifier: pageIdentifier) as? OnBoardViewController {
            return controller
        }
        return OnBoardViewController()
    }

    var onBoardList: Array<OnBoardModel> = []
    
//    override func viewDidAppear(_ animated: Bool) {
//        navigationController?.setNavigationBarHidden(true, animated: true)
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        pageView.delegate = self
        pageView.dataSource = self
        
        onBoardList = [OnBoardModel(image: "circle_basket", description: "Quickly search and add healthy foods to your cart"),
            OnBoardModel(image: "circle_apple", description: "With one click you can add every ingredient for a recipe to your cart"),]
        registerNib()
        setupCustomNibView()

    }
    func registerNib() {
        let nibCell = UINib(nibName: cellOnBoardName, bundle: nil)
        pageView.register(nibCell, forCellWithReuseIdentifier: pageUniquekey)
    }
    func setupCustomNibView() {
        pageView.layer.cornerRadius = 20
        pageView.layer.shadowColor = UIColor.black.cgColor
        pageView.layer.shadowRadius = 20.0
        pageView.layer.shadowOpacity = 20
    }
}

extension OnBoardViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onBoardList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let onBoardCell = collectionView.dequeueReusableCell(withReuseIdentifier: pageUniquekey, for: indexPath) as? OnBoardViewCell else { return UICollectionViewCell() }
        onBoardCell.setup(description: onBoardList[indexPath.row].description, image: UIImage(named: onBoardList[indexPath.row].image), frame: view.frame)
        return onBoardCell
    }

    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.pointee.x / view.frame.width
        pageControl.currentPage = Int(index)
    }

}
