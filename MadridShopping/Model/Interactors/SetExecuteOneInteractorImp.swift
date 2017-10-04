import Foundation

class SetExecuteOneInteractorImp : SetExcecuteOneInteractor {
    func execute() {
        let defaults = UserDefaults.standard
        
        defaults.set("SAVED", forKey:"once")
        
        defaults.synchronize()
    }
    
    
}
