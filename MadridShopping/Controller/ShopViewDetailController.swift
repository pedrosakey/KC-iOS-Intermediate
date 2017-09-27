//
//  ShopViewDetailController.swift
//  MadridShopping
//
//  Created by Pedro Sánchez Castro on 27/9/17.
//  Copyright © 2017 pedrosapro. All rights reserved.
//

import UIKit

class  ShopViewDetailController: UIViewController {
    
    var shop: Shop!
    
    @IBOutlet weak var shopDetaiName: UILabel!
    @IBOutlet weak var shopDetailDescription: UITextView!
    @IBOutlet weak var shopDetailAddress: UILabel!
    @IBOutlet weak var shopDetailOpeningHours: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.shopDetaiName.text = self.shop.name
       
    }
    
    
}
