//
//  LoginViewController.swift
//  HealthQuest
//
//  Created by Brayan Diaz on 8/9/22.
//

import UIKit
import CoreData

class LoginViewController: UIViewController {

    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func loginButtonClic(_ sender: Any) {
        
        print("hola")
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
                //request.predicate = NSPredicate(format: "age = %@", "21")
        request.returnsObjectsAsFaults = false
        do {
                    let result = try context.fetch(request)
                    for data in result as! [NSManagedObject]
        {
            print(data.value(forKey: "userName") as! String)
          }

               } catch {

                   print("Failed")
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
