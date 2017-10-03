//
//  MainViewController.swift
//  MadridShopping
//
//  Created by Pedro Sánchez Castro on 24/9/17.
//  Copyright © 2017 pedrosapro. All rights reserved.
//

import UIKit
import CoreData

class MainViewController : UIViewController {
  
    var context: NSManagedObjectContext!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowShopsSegue" {
            let vc = segue.destination as! ShopsViewController
            vc.context = self.context
        }
    }
  
    
}
