//
//  RegistrationController.swift
//  HealthQuest
//
//  Created by user206114 on 8/3/22.
//

import UIKit

class RegistrationController: UIViewController, UITextFieldDelegate {
    var tags = 0
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
        subButton.isEnabled = false
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
    
    @IBAction func fnameChange(_ sender: Any) {
        tags = tags + 1
        if(tags == 5){
            subButton.isEnabled = true
        }
    }
    
    @IBAction func lnameChange(_ sender: Any) {
        tags = tags + 1
        if(tags == 5){
            subButton.isEnabled = true
        }
    }
    
    @IBAction func emailChange(_ sender: Any) {
        tags = tags + 1
        if(tags == 5){
            subButton.isEnabled = true
        }
    }
    
    @IBAction func passChange(_ sender: Any) {
        tags = tags + 1
        if(tags == 5){
            subButton.isEnabled = true
        }
    }
    
    @IBAction func confirmChange(_ sender: Any) {
        tags = tags + 1
        if(tags == 5){
            subButton.isEnabled = true
        }
    }
    
    @IBAction func registerClick(_ sender: Any) {
            
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
