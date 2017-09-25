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
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let downloadShopsInteractor: DownloadAllShopsInteractor = DownloadAllShopsInteractorFakeImpl()
        
        downloadShopsInteractor.execute { (shops: Shops) in
            // todo OK
            for i in 1...10 {
            print("Name: " + shops.get(index: i).name)
            }
            }
        

    }

}


