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

