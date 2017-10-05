import Foundation

class ExecuteOnceInteractorImp: ExecuteOnceInteractor {
    func execute(id: String, closure: () -> Void) {
        let defaults = UserDefaults.standard

        let a = defaults.string(forKey:id)
        if (a == "SAVED"){
            // already save
        } else {
            closure()
        }
    }

}
