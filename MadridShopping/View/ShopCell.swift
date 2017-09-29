//
//  ShopCell.swift
//  MadridShopping
//
//  Created by Pedro Sánchez Castro on 25/9/17.
//  Copyright © 2017 pedrosapro. All rights reserved.
//

import UIKit

class ShopCell: UICollectionViewCell {
    var shop: Shop?
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    
    func refresh(shop: Shop) {
        self.shop = shop
        
        self.label.text = shop.name
        self.shop?.logo.loadImage(into: imageView)
    }
}
