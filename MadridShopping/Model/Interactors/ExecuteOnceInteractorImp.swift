import Foundation

class ExecuteOnceInteractorImp: ExecuteOnceInteractor {
    func execute(closure: () -> Void) {
        let defaults = UserDefaults.standard

        if let _ = defaults.string(forKey: "once") {
            // already save
        } else {
            closure()
        }
    }

}
