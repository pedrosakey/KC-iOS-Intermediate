import CoreData

protocol SaveAllActivitiesInteractor {
    // execute: saves all activities. Return on the main thread
    func execute(activities: Activities, context: NSManagedObjectContext, onSuccess: @escaping (Activities) -> Void, onError: errorClosure)
    func execute(activities: Activities, context: NSManagedObjectContext, onSuccess: @escaping (Activities) -> Void)
}
