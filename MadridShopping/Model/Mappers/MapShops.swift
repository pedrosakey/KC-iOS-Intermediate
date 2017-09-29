//
//  MapShops.swift
//  MadridShops
//
//  Created by Pedro Sánchez Castro on 18/9/17.
//  Copyright © 2017 Pedro Sánchez Castro. All rights reserved.
//

import CoreData

 func mapShopCDIntoShop(shopCD: ShopCD) -> Shop {
    
    //mapping shops into shop cd
    let shop = Shop(name: shopCD.name!)
    shop.address = shopCD.address ?? ""
    shop.image = shopCD.image ?? ""
    shop.logo = shopCD.logo ?? ""
    
    shop.latitude = shopCD.latitude
    shop.longitude = shopCD.longitude
    shop.description = shopCD.description_en ?? ""
    shop.openingHours = shopCD.openingHours ?? ""
    
    return shop
    
}

 func mapShopIntoShopCD(context: NSManagedObjectContext, shop: Shop) -> ShopCD {
    //mapping shops into shop cd
    let shopCD = ShopCD(context: context)
    shopCD.name = shop.name
    shopCD.address = shop.address
    shopCD.image = shop.image
    shopCD.latitude = shop.latitude ?? 0
    shopCD.logo = shop.logo
    shopCD.longitude = shop.longitude ?? 0
    shopCD.openingHours = shop.openingHours
    shopCD.description_en = shop.description
    
    return shopCD
}
