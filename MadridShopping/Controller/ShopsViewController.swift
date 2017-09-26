//
//  ViewController.swift
//  MadridShopping
//
//  Created by Pedro Sánchez Castro on 19/9/17.
//  Copyright © 2017 pedrosapro. All rights reserved.
//

import UIKit

class ShopsViewController: UIViewController {
    
    var shops: Shops?
    
    @IBOutlet weak var shopsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let downloadShopsInteractor: DownloadAllShopsInteractor = DownloadAllShopsInteractorNSDataImpl()
        
        downloadShopsInteractor.execute { (shops: Shops) in
            // todo OK
            
            print("Name: " + shops.get(index: 0).name)
            
            self.shops = shops
            
            self.shopsCollectionView.dataSource = self
            self.shopsCollectionView.delegate = self
        }
    }

}


