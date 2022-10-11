//
//  ViewController.swift
//  Zombie
//
//  Created by Alex Masztak on 10/4/22.
//
//file:///Users/amasztak3281/Library/Developer/CoreSimulator/Devices/48459F85-DC26-4F55-A9D5-C59C3B2E58CF/data/Containers/Data/Application/8B3CDE1B-9A84-4E4D-9205-D7259685E430/Library/Application%20Support/Zombie.sqlite

import UIKit
import CoreData

class ViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var boyButton: UIButton!
    @IBOutlet weak var girlButton: UIButton!
    
    @IBOutlet weak var continueButton: UIButton!
        
    
    var context: NSManagedObjectContext!

    var genderN = 0
    var nameS = "name"
    
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var playerArray:[Player] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        context = appDelegate.persistentContainer.viewContext

        continueButton.isEnabled = false

    }

    @IBAction func boyButtonPressed(_ sender: UIButton) {
        
        boyButton.tintColor = .systemGreen
        girlButton.tintColor = .systemGray
            
        continueButton.isEnabled = true
        
        genderN = 0
        
    }
    
    @IBAction func girlButtonPressed(_ sender: UIButton) {
        
        girlButton.tintColor = .systemGreen
        boyButton.tintColor = .systemGray
        
        continueButton.isEnabled = true
        
        genderN = 1
    }
    
    @IBAction func continueButtonPressed(_ sender: UIButton) {
        
        if let text = nameTextField.text, !text.isEmpty
        {
            let name = String(nameTextField.text!)
            let gender =  Int16(genderN)
            let newPlayer =  Player(context: self.context)
            newPlayer.name = name
            newPlayer.gender = (gender)
            self.appDelegate.saveContext()
            
            
            print("correct")
            nameS = nameTextField.text!
            
            performSegue(withIdentifier: "Segue", sender: nil)


            
        }  else {
            
            print("error")
            let myColor = UIColor.red
            nameTextField.layer.borderWidth = 1.0
            nameTextField.layer.borderColor = myColor.cgColor
            
            let alert = UIAlertController(title: "Error", message: "Please Enter a Name", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }

}

