import Foundation
import CoreLocation

public class Activity {
    var name: String
    var description: String = ""
    var latitude: Float? = nil
    var longitude: Float? = nil
    var image: String = ""
    var logo: String = ""
    var openingHours: String = ""
    var address: String = ""
    
    public init(name: String) {
        self.name = name
    }
}

extension Activity {
    func getLocation() -> CLLocation {
        
        var shopLocation = CLLocation()
        
        guard let latitude = self.latitude else { return shopLocation }
        guard let longitude = self.longitude else { return shopLocation }
        
        shopLocation = CLLocation(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))
        return shopLocation
        
    }
}

