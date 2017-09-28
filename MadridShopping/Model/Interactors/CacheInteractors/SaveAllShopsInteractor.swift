//
//  SaveAllShopsInteractor.swift
//  MadridShopping
//
//  Created by Pedro Sánchez Castro on 28/9/17.
//  Copyright © 2017 pedrosapro. All rights reserved.
//

import CoreData

protocol SaveAllShopsInteractor {
    // execute: saves all shops. Return on the main thread
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping (Shops) -> Void, onError: errorClosure)
    func execute(shops: Shops, context: NSManagedObjectContext, onSuccess: @escaping (Shops) -> Void)
}

