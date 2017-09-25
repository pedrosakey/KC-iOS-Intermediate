//
//  Shop.swift
//  MadridShopping
//
//  Created by Pedro Sánchez Castro on 23/9/17.
//  Copyright © 2017 pedrosapro. All rights reserved.
//

import Foundation

public class Shop {
    var name: String
    var description: String = ""
    var latitude: Float? = nil
    var longitude: Float? = nil
    var image: String = ""
    var logo: String = ""
    var openingHours: String = ""
    var address: String = ""
    
    public init(name: String) {
        self.name = name
    }
}
