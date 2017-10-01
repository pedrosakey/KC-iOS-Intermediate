import Foundation
import MapKit
import CoreData

extension ShopsViewController: MKMapViewDelegate {
    
    func mapViewDidFinishLoadingMap(_ mapView: MKMapView) {
        print("Finish loading")
        // MORE anotations
        let shopCds = self.fetchAllShops()
        //Add pin to Maps
        let shopcd : ShopCD = shopCds[0]
        print("name " + shopcd.name!)
        print("latitude: \(shopcd.latitude)")
        print("longitude: \(shopcd.longitude)")
        let mapPin = mapShopIntoMapPin(shop: mapShopCDIntoShop(shopCD: shopcd))
            
             if(mapPin != nil){
             self.map.addAnnotation(mapPin!)
        }
        
    }
    
    func fetchAllShops () -> [ShopCD] {
        var shopCDs : [ShopCD] = []
        
        //Fetch from CD
        // fetch all projects
        let fetchRequest: NSFetchRequest<ShopCD> = ShopCD.fetchRequest()
        
        // Set the batch size to a suitable number.
        fetchRequest.fetchBatchSize = 20
        
        // Set a sort key so results get ordered
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: false)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        do {
            // run the fetch request
            shopCDs = try context.fetch(fetchRequest)
            print("Num records: \( shopCDs.count )")
            
            
        } catch {
            print("Error \(error.localizedDescription)")
        }
        
        return shopCDs
    }
    
}
