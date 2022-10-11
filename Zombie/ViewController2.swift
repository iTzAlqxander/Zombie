//
//  ViewController2.swift
//  Zombie
//
//  Created by Alex Masztak on 10/7/22.
//

import UIKit
import CoreData

class ViewController2: UIViewController {

    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var i = 0
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var playerArray:[Player] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        nameLabel.text = "Welcome, " + playerArray[i].name!
        var genderNumber = Int(playerArray[i].gender)
        
        if genderNumber == 0  {
            genderLabel.text = "male"
        }else {
            genderLabel.text = "female"
        }

    }
    
    func getData()  {
        if let myPlayers = try? context.fetch(Player.fetchRequest()){
            playerArray = myPlayers
        } else {
            print("error")
        }
    }
    
    @IBAction func deleteName(_ sender: UIButton) {
        
        let Player = playerArray[0]
        context.delete(Player)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        getData()
        nameLabel.text = "nil"
        genderLabel.text = "nil"
    }

}
