//
//  InventoryTutorial.swift
//  Zombie
//
//  Created by Alex Masztak on 10/11/22.
//

import UIKit

class InventoryTutorial: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func whenInventoryPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "fromInventoryTutorial", sender: nil)
    }
    @IBAction func whenPickupPressed(_ sender: UIButton) {
        
        
    }
    

}
