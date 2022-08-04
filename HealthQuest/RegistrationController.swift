//
//  RegistrationController.swift
//  HealthQuest
//
//  Created by user206114 on 8/3/22.
//

import UIKit

class RegistrationController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var fName: UITextField!
    
    @IBOutlet weak var uEmail: UITextField!
    
    @IBOutlet weak var lName: UITextField!
    @IBOutlet weak var uPassword: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var subButton: UIButton!
    
    
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fName.delegate = self
        lName.delegate = self
        uEmail.delegate = self
        uPassword.delegate = self
        confirmPassword.delegate = self
        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        fName.resignFirstResponder()
        lName.resignFirstResponder()
        uEmail.resignFirstResponder()
        uPassword.resignFirstResponder()
        confirmPassword.resignFirstResponder()
        return true
    }
    @IBAction func registerClick(_ sender: Any) {
        guard  let first = fName.text, first != "" else {
            print("Name is empty")
            count = 1
            return
        }
        guard let second = lName.text, second != ""
        else {
            print("Last Name is empty")
            count = 1
            return
        }
        if(count == 1){
            
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
