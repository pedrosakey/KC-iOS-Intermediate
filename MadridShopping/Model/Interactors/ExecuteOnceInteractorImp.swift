//
//  ExecuteOnceInteractorImp.swift
//  MadridShops
//
//  Created by Pedro Sánchez Castro on 20/9/17.
//  Copyright © 2017 Pedro Sánchez Castro. All rights reserved.
//

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
