import UIKit
import MapKit
import CoreLocation


class  ShopViewDetailController: UIViewController {
    
    var shop: Shop!
    
    @IBOutlet weak var shopDetaiName: UILabel!
    
   
    @IBOutlet weak var shopDetailDescription: UILabel!
    @IBOutlet weak var shopDetailAddress: UILabel!
    @IBOutlet weak var shopDetailOpeningHours: UILabel!
    @IBOutlet weak var mapViewDetail: MKMapView!
    
    let locationManager = CLLocationManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Request Authorizacion
        self.locationManager.requestWhenInUseAuthorization()
        
        self.shopDetaiName.text = self.shop.name
        self.shopDetailDescription.text = self.shop.description
        self.shopDetailAddress.text = self.shop.address
        self.shopDetailOpeningHours.text = self.shop.openingHours
        
        
        //Location & Center
        let shopLocation : CLLocation = shop.getLocation()
        self.mapViewDetail.setCenter(shopLocation.coordinate, animated: true)
        
        //Zoom
        let region = MKCoordinateRegion(center: shopLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        let reg = self.mapViewDetail.regionThatFits(region)
        self.mapViewDetail.setRegion(reg, animated: true)
        
        //Map pin
       
        let mapPin = mapShopIntoMapPin(shop: self.shop)
        if(mapPin != nil){
            self.mapViewDetail.addAnnotation(mapPin!)
        }
        
    }
    
    
}
