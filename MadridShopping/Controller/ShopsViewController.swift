import UIKit
import CoreData


class ShopsViewController: UIViewController{
    
    var context: NSManagedObjectContext!
    var shops: Shops?
    
    @IBOutlet weak var shopsCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        let downloadShopsInteractor: DownloadAllShopsInteractor = DownloadAllShopsInteractorNSURLSessionImpl()
        
        ExecuteOnceInteractorImp().execute {
            downloadShopsInteractor.execute(onSuccess: { (shops: Shops) in
                    //Network connection ok
                    self.shops = shops
                    
                    let cacheInteractor = SaveAllShopsInteractorImpl()
                    cacheInteractor.execute(shops: shops, context: self.context, onSuccess: { (shops: Shops) in
                        SetExecuteOneInteractorImp().execute()
                        
                        self._fetchedResultsController = nil
                        self.shopsCollectionView.dataSource = self
                        self.shopsCollectionView.delegate = self
                        self.shopsCollectionView.reloadData()

                    })
                }) { (error) in
                    //Network connection ko
                    print("💩 Error \(error.localizedDescription)")
                    self.shopsCollectionView.dataSource = self
                    self.shopsCollectionView.delegate = self
                }
                
            }
        
            self.shopsCollectionView.delegate = self
            self.shopsCollectionView.dataSource = self
        }
        
        
        
      
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let shopCD = self.fetchedResultsController.object(at: indexPath)
        self.performSegue(withIdentifier: "ShowShopDetailSegue", sender: shopCD)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowShopDetailSegue" {
            let vc = segue.destination as! ShopViewDetailController
            
            let shopCD: ShopCD = sender as! ShopCD
            vc.shop = mapShopCDIntoShop(shopCD: shopCD)
        }
    }
    
    // MARK: - Fetched results controller
    
    var _fetchedResultsController: NSFetchedResultsController<ShopCD>? = nil
    
    var fetchedResultsController: NSFetchedResultsController<ShopCD> {
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }
        
        let fetchRequest: NSFetchRequest<ShopCD> = ShopCD.fetchRequest()
        
        // Set the batch size to a suitable number.
        fetchRequest.fetchBatchSize = 20
        
        // Edit the sort key as appropriate.
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        // Edit the section name key path and cache name if appropriate.
        // nil for section name key path means "no sections".
        _fetchedResultsController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: self.context!, sectionNameKeyPath: nil, cacheName: "ShopsCacheFile")
        //aFetchedResultsController.delegate = self
        
        
        do {
            try _fetchedResultsController!.performFetch()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        
        return _fetchedResultsController!
    }


}


