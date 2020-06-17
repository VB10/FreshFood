//
//  OnBoardViewModel.swift
//  FreshFood
//
//  Created by Veli on 2.06.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class OnBoardViewModel {
    let pageUniquekey: String = "OnBoardIdentifier"
    let cellOnBoardName: String = "OnBoardViewCell"
    var onBoardList: Array<OnBoardModel> = []
    var currentPageIndex: Observable<Int> = BehaviorSubject<Int>.init(value: 0)
    let collectionViewFrame = ReplaySubject<CGRect>.create(bufferSize: 1)
    private let disposeBag = DisposeBag()

    func OnBoardViewModel() {
        setupListOnBoardData()
    }

    func setupListOnBoardData() {
        onBoardList = [OnBoardModel(image: "circle_basket", description: "Quickly search and add healthy foods to your cart"),
            OnBoardModel(image: "circle_apple", description: "With one click you can add every ingredient for a recipe to your cart"),]
    }

    func setupCustomNibView(pageView: UICollectionView) {
        pageView.layer.cornerRadius = 20
        pageView.layer.shadowColor = UIColor.black.cgColor
        pageView.layer.shadowRadius = 20.0
        pageView.layer.shadowOpacity = 20

    }

    func setupReactiveBinding(pageView: UICollectionView, pageControl: UIPageControl) {
        currentPage(
            offset: pageView.rx.contentOffset.asObservable(),
            frame: collectionViewFrame.asObservable()
        )

        currentPageIndex
            .bind(to: pageControl.rx.currentPage)
            .disposed(by: disposeBag)
    }

    func setupButtonReactive(button: UIButton) {
        currentPageIndex.map { self.buttonSkipOrNext(val: $0) }.bind(to: button.rx.title()).disposed(by: disposeBag)
    }

    func buttonSkipOrNext(val: Int) -> String {
        return val == onBoardList.count - 1 ? "Skip" : "Next"
    }

    func registerNib(pageView: UICollectionView) {
        let nibCell = UINib(nibName: cellOnBoardName, bundle: nil)
        pageView.register(nibCell, forCellWithReuseIdentifier: pageUniquekey)
    }

    func currentPage(offset: Observable<CGPoint>, frame: Observable<CGRect>) {
        currentPageIndex = Observable.combineLatest(offset, frame)
            .map { Int($0.0.x) / Int($0.1.width) }
    }

}
