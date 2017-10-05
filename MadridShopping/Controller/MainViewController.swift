import UIKit
import CoreData

class MainViewController : UIViewController {
  
    var context: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowShopsSegue" {
            let vc = segue.destination as! ShopsViewController
            vc.context = self.context
        }
        
        if segue.identifier == "ShowActivitiesSegue" {
            let vc = segue.destination as! ActivitiesViewController
            vc.context = self.context
        }
    }
  
    
}
