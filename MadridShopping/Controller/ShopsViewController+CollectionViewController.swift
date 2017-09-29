//
//  ShopsViewController+CollectionViewController.swift
//  MadridShopping
//
//  Created by Pedro Sánchez Castro on 25/9/17.
//  Copyright © 2017 pedrosapro. All rights reserved.
//

import UIKit

extension ShopsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return fetchedResultsController.sections?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let sectionInfo = fetchedResultsController.sections![section]
        return sectionInfo.numberOfObjects
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: ShopCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ShopCell", for: indexPath) as! ShopCell
        
        let shopCD: ShopCD = fetchedResultsController.object(at: indexPath)
        
       cell.refresh(shop: mapShopCDIntoShop(shopCD: shopCD))
        
        return cell
    }
    
}
