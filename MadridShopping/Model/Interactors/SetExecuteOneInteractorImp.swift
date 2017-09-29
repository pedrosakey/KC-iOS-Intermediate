//
//  SetExecuteOneInteractorImp.swift
//  MadridShops
//
//  Created by Pedro Sánchez Castro on 21/9/17.
//  Copyright © 2017 Pedro Sánchez Castro. All rights reserved.
//

import Foundation

class SetExecuteOneInteractorImp : SetExcecuteOneInteractor {
    func execute() {
        let defaults = UserDefaults.standard
        
        defaults.set("SAVED", forKey:"once")
        
        defaults.synchronize()
    }
    
    
}
