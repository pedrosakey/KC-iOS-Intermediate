//
//  JSONParser.swift
//  MadridShopping
//
//  Created by Pedro Sánchez Castro on 26/9/17.
//  Copyright © 2017 pedrosapro. All rights reserved.
//

import Foundation

import Foundation

func parseShops(data: Data) -> Shops {
    let shops = Shops()
    do {
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary<String, Any>
        let result = jsonObject["result"] as! [Dictionary<String, Any>]
        
        for shopJson in result {
            let shop = Shop(name: shopJson["name"]! as! String)
            shop.address = shopJson["address"]! as! String
            shop.logo = shopJson["logo_img"] as! String
            shop.image = shopJson["img"] as! String
            shop.description = shopJson["description_en"] as! String
            shop.openingHours = shopJson["opening_hours_en"] as! String
            shop.latitude = Float((shopJson["gps_lat"] as! String).trimmingCharacters(in:.whitespaces))
            shop.longitude = Float((shopJson["gps_lon"] as! String).trimmingCharacters(in:.whitespaces))
            shops.add(shop: shop)
        }
    } catch {
        print("Error parsing JSON")
    }
    return shops
}
