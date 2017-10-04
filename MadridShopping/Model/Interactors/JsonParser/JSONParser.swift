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

func parseActivities(data: Data) -> Activities {
    let activities = Activities()
    
    do {
        let jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary<String, Any>
        let result = jsonObject["result"] as! [Dictionary<String, Any>]
        
        for activityJson in result {
            let activity = Activity(name: activityJson["name"]! as! String)
            activity.address = activityJson["address"]! as! String
            activity.logo = activityJson["logo_img"] as! String
            activity.image = activityJson["img"] as! String
            activity.description = activityJson["description_en"] as! String
            activity.openingHours = activityJson["opening_hours_en"] as! String
            activity.latitude = Float((activityJson["gps_lat"] as! String).trimmingCharacters(in:.whitespaces))
            activity.longitude = Float((activityJson["gps_lon"] as! String).trimmingCharacters(in:.whitespaces))
            activities.add(activity: activity)
        }
    } catch {
        print("Error parsing JSON")
    }
    return activities
}

