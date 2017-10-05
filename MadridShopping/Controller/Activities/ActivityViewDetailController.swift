import UIKit
import MapKit
import CoreLocation


class  ActivityViewDetailController: UIViewController {
    
    var activity: Activity!
    
    @IBOutlet weak var activityDetaiName: UILabel!
    
    
    @IBOutlet weak var activityDetailDescription: UILabel!
    @IBOutlet weak var activityDetailAddress: UILabel!
    @IBOutlet weak var activityDetailOpeningHours: UILabel!
    @IBOutlet weak var mapViewDetail: MKMapView!
    
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Request Authorizacion
        self.locationManager.requestWhenInUseAuthorization()
        
        self.activityDetaiName.text = self.activity.name
        self.activityDetailDescription.text = self.activity.description
        self.activityDetailAddress.text = self.activity.address
        self.activityDetailOpeningHours.text = self.activity.openingHours
        
        
        //Location & Center
        let activityLocation : CLLocation = activity.getLocation()
        self.mapViewDetail.setCenter(activityLocation.coordinate, animated: true)
        
        //Zoom
        let region = MKCoordinateRegion(center: activityLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
        let reg = self.mapViewDetail.regionThatFits(region)
        self.mapViewDetail.setRegion(reg, animated: true)
        
        //Map pin
        
        let mapPin = mapActivityIntoMapPin(activity: self.activity)
        if(mapPin != nil){
            self.mapViewDetail.addAnnotation(mapPin!)
        }
        
    }
    
    
}

