//
//  ExecuteOnceInteractor.swift
//  MadridShops
//
//  Created by Pedro Sánchez Castro on 20/9/17.
//  Copyright © 2017 Pedro Sánchez Castro. All rights reserved.
//

import Foundation

protocol ExecuteOnceInteractor {
    func execute(closure: () -> Void)
}
