import Foundation

class SetExecuteOneInteractorImp : SetExcecuteOneInteractor {
    func execute(id: String) {
        let defaults = UserDefaults.standard
        
        defaults.set("SAVED", forKey:id)
                        
        defaults.synchronize()
    }
    
    
}
