//
//  ViewController.swift
//  MadridShopping
//
//  Created by Pedro Sánchez Castro on 19/9/17.
//  Copyright © 2017 pedrosapro. All rights reserved.
//

import UIKit
import CoreData

class ShopsViewController: UIViewController {
    
    var context: NSManagedObjectContext!
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
            
            let cacheInteractor = SaveAllShopsInteractorImpl()
            cacheInteractor.execute(shops: shops, context: self.context, onSuccess: { (shops: Shops) in
            })
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let shop = self.shops?.get(index: indexPath.row)
        self.performSegue(withIdentifier: "ShowShopDetailSegue", sender: shop)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowShopDetailSegue" {
            let vc = segue.destination as! ShopViewDetailController
            //let indexPath = self.shopsCollectionView.indexPathsForSelectedItems![0]
            //let shop = self.shops?.get(index: indexPath.row)
            vc.shop = sender as! Shop
        }
    }

}


