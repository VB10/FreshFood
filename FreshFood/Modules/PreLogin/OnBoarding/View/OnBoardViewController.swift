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
    
    let pageUniquekey : String = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageView.delegate = self
        pageView.dataSource = self
        
        
        pageView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: pageUniquekey)
        // Do any additional setup after loading the view.
    }
}

extension OnBoardViewController : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: pageUniquekey, for: indexPath)
        
        cell.backgroundColor = .red
    
        return cell
    }
    

    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
  
}
