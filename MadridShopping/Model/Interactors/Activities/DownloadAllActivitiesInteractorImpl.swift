import Foundation

class DownloadAllActivitiesInteractorImpl: DownloadAllActivitiesInteractor {
    func execute(onSuccess: @escaping (Activities) -> Void, onError: errorClosure) {
        let urlString = "https://madrid-shops.com/json_new/getActivities.php"
        
        let session = URLSession.shared
        if let url = URL(string: urlString) {
            let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                
                OperationQueue.main.addOperation {
                    assert(Thread.current == Thread.main)
                    
                    if error == nil {
                        let activities = parseActivities(data: data!)
                        onSuccess(activities)
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
    
    func execute(onSuccess: @escaping (Activities) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
    
    
}

