import CoreData

protocol SaveAllShopsInteractor {
    // execute: saves all shops. Return on the main thread
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping (Shops) -> Void, onError: errorClosure)
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping (Shops) -> Void)
}

