//
//  RegistrationViewController.swift
//  HealthQuest
//
//  Created by Brayan Diaz on 8/9/22.
//

import UIKit
import CoreData

class RegistrationViewController: UIViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        

        // Do any additional setup after loading the view.
    }
    
    @IBAction func createButtonClic(_ sender: Any) {
        let context = appDelegate.persistentContainer.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "User", in: context)
        let newUser = NSManagedObject(entity: entity!, insertInto: context)
        
        newUser.setValue("User1", forKey: "userName")
        newUser.setValue("123456", forKey: "password")
        newUser.setValue("dluisbrayan@gmail.com", forKey: "email")
        newUser.setValue(true, forKey: "userType")
        
        do {
          try context.save()
         } catch {
          print("Error saving")
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
