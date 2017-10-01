import CoreData
import CoreLocation

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

func mapShopIntoMapPin(shop: Shop) -> MapPin? {
    guard let latitude = shop.latitude else { return nil }
    guard let longitude = shop.longitude else { return nil }
    
    let shopLocation : CLLocation = CLLocation(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))
    let shopMapPin = MapPin(coordinate: shopLocation.coordinate, title: shop.name, subtitle: shop.openingHours)
   
    return shopMapPin
}
