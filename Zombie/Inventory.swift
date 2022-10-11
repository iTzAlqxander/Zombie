//
//  Inventory.swift
//  Zombie
//
//  Created by Alex Masztak on 10/11/22.
//

import UIKit

class Inventory: UIViewController {
    
    var whereToSegue = "toInventoryTutorial"
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func whenExitPressed(_ sender: UIButton) {
        performSegue(withIdentifier: whereToSegue, sender: nil)
    }
    


}
