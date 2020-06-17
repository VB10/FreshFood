//
//  OnBoardViewController.swift
//  FreshFood
//
//  Created by Veli on 27.05.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import UIKit
import RxCocoa

class OnBoardViewController: UIViewController {
    @IBOutlet weak var pageView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var skipOrNextButton: UIButton!


    var viewModel: OnBoardViewModel!
    let pageUniquekey: String = "OnBoardIdentifier"
    let cellOnBoardName: String = "OnBoardViewCell"


    override func viewDidLoad() {
        super.viewDidLoad()
        pageView.delegate = self
        pageView.dataSource = self
        viewModel.setupListOnBoardData()
        viewModel.setupCustomNibView(pageView: pageView)
        viewModel.registerNib(pageView: pageView)
        viewModel.setupReactiveBinding(pageView: pageView, pageControl: pageControl)
        viewModel.setupButtonReactive(button: skipOrNextButton)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        viewModel.collectionViewFrame.onNext(self.pageView.frame)
    }

}

extension OnBoardViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.onBoardList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let onBoardCell = collectionView.dequeueReusableCell(withReuseIdentifier: pageUniquekey, for: indexPath) as? OnBoardViewCell else { return UICollectionViewCell() }
        onBoardCell.setup(description: viewModel.onBoardList [indexPath.row].description, image: UIImage(named: viewModel.onBoardList[indexPath.row].image), frame: view.frame)
        return onBoardCell
    }
}
