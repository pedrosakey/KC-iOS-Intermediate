//
//  DownloadAllShopsInteractor.swift
//  MadridShopping
//
//  Created by Pedro Sánchez Castro on 23/9/17.
//  Copyright © 2017 pedrosapro. All rights reserved.
//

import Foundation

protocol DownloadAllShopsInteractor {
    func execute(onSuccess: @escaping (Shops) -> Void, onError: errorClosure)
    func execute(onSuccess: @escaping (Shops) -> Void)
}
