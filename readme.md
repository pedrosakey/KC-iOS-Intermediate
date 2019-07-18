# Madrid Shopping

Madrid Shopping is an app for finding shops and activities in Madrid.


## Requeriments
![alt text](https://drive.google.com/uc?id=0BzMreayzz5erZU5CVThrUFV0NlU)

### Launch
### Get Shops
### Get Shop detail
### Get Activities
### Get Activity detail

![alt text](https://drive.google.com/uc?id=0BzMreayzz5erZ2UyVV8ycTBleTA)

## Improve and Pending

### Interface (autolayout)


### Error control

If there is no connection for downloading shops or activities an error will be shown

**Improve:** *Custom error*

### Cache (check more options)

Cache Image with: 

[https://github.com/onevcat/Kingfisher]()

### Generic and reusable code

### Improve Internationalization with Colloc
[https://github.com/mobilejazz/Colloc
]()

# Code review

## Prototype.

Making a prototype just with xcode

## Download Fake Implementation

### Example of arquitecture

![Download Fake](https://drive.google.com/uc?id=1L0jXhGMIgOjGol1C4j0d4E4zaHVfvoTU)


## Interactors. Between layers.

```
import Foundation

protocol DownloadAllShopsInteractor {
    func execute(onSuccess: @escaping (Shops) -> Void, onError: errorClosure)
    func execute(onSuccess: @escaping (Shops) -> Void)
}

```

Example of implementation

```
class DownloadAllShopsInteractorFakeImpl: DownloadAllShopsInteractor {
    func execute(onSuccess: @escaping (Shops) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
    func execute(onSuccess: @escaping (Shops) -> Void, onError: errorClosure = nil) {
        let shops = Shops()
        
        for i in 0...10 {
            let shop = Shop(name: "Shop number \( i )")
            shop.address = "Address \( 1 )"
            
            shops.add(shop: shop)
        }
        
        OperationQueue.main.addOperation {
            onSuccess(shops)
        }
    }
    
    
}
```

Example of use

```
import UIKit

class ShopsViewController: UIViewController {
    
    var shops: Shops?
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let downloadShopsInteractor: DownloadAllShopsInteractor = DownloadAllShopsInteractorFakeImpl()
        
        downloadShopsInteractor.execute { (shops: Shops) in
            // todo OK
            for i in 1...10 {
            print("Name: " + shops.get(index: i).name)
            }
            }
        

    }

}
```

## DowloadAllShopsInteractorNSDataImp

```
import Foundation

class DownloadAllShopsInteractorNSDataImpl : DownloadAllShopsInteractor {
    func execute(onSuccess: @escaping (Shops) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
    func execute(onSuccess: @escaping (Shops) -> Void, onError: errorClosure = nil) {
        
        let urlString = "https://madrid-shops.com/json_new/getShops.php"
        
        let queue = OperationQueue()
        queue.addOperation {
            
            if let url = URL(string: urlString), let data = NSData(contentsOf: url) as Data? {
                do {
                    let jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! Dictionary<String, Any>
                    let result = jsonObject["result"] as! [Dictionary<String, Any>]
                    
                    let shops = Shops()
                    for shopJson in result {
                        let shop = Shop(name: shopJson["name"]! as! String)
                        shop.address = shopJson["address"]! as! String
                        
                        shops.add(shop: shop)
                    }
                    
                    OperationQueue.main.addOperation {
                        onSuccess(shops)
                    }
                } catch {
                    // Error
                }
            }
        }
        
        
    }
    
   
}

```

## DownloadAllShopsInteractorNSURLSession
```
import Foundation

class DownloadAllShopsInteractorNSURLSessionImpl: DownloadAllShopsInteractor {
    func execute(onSuccess: @escaping (Shops) -> Void, onError: errorClosure) {
        let urlString = "https://madrid-shops.com/json_new/getShops.php"
        
        let session = URLSession.shared
        if let url = URL(string: urlString) {
            let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                
                OperationQueue.main.addOperation {
                    assert(Thread.current == Thread.main)
                    
                    if error == nil {
                        let shops = parseShops(data: data!)
                        onSuccess(shops)
                    } else {
                        if let myError = onError {
                            myError(error!)
                        }
                    }
                }
            }
            task.resume()
        }
    }
    
    func execute(onSuccess: @escaping (Shops) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
    
}
```


##  Basic AutoLayout MainVC & ShopsVC
_Autolayout Guide_

## ShopDetail desing + Segue …

## Trigger manual Segue
_Segue Guide_

## Core Data
_Core Data Guide_


##Fix - ShopsViewController. Wrong Interactor :S

##Core Data - Fetch …

##ExecuteOnce & Fix segue

##Pin Shops in MapView - ShopsViewController …

```
import MapKit
import CoreLocation

       //Request Authorizacion
        self.locationManager.requestWhenInUseAuthorization()
        
        //Pin a Map
        self.map.delegate = self
        
        
        //Location latitude & longitude
        let madridLocation = CLLocation(latitude: 40.416775, longitude: -3.703790)
        self.map.setCenter(madridLocation.coordinate, animated: true)
        
        //zoom
        let region = MKCoordinateRegion(center: madridLocation.coordinate, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        let reg = self.map.regionThatFits(region)
        self.map.setRegion(reg, animated: true)
        
        
        //Add anotation
        let mapPin = MapPin(coordinate: madridLocation.coordinate)
        mapPin.title = "titutlo"
        mapPin.subtitle = "subtittitio"
        
        self.map.addAnnotation(mapPin)

⋮

```


