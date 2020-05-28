//
//  OnBoardViewCell.swift
//  FreshFood
//
//  Created by Veli on 28.05.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import UIKit

class OnBoardViewCell: UICollectionViewCell {
    @IBOutlet weak var centerImage: UIImageView!
    @IBOutlet weak var labelDescription: UILabel!
    
    var descriptionText: String?
    var image: UIImage?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
    }
    
    func setup(description text : String , image source : UIImage?, frame rect : CGRect ) {
        labelDescription.text? = text
        centerImage.image = source
        centerImage.frame = frame
    }
}
