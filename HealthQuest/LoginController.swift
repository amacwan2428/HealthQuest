//
//  LoginController.swift
//  HealthQuest
//
//  Created by user206114 on 8/2/22.
//

import UIKit
//code by Angel
class LoginController: UIViewController, UITextFieldDelegate {
    var tag = 0
    @IBOutlet weak var emailTxt: UITextField!
    @IBOutlet weak var passwordTxt: UITextField!

    @IBOutlet weak var signInBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tag = 0
        emailTxt.delegate = self
        passwordTxt.delegate = self
        if emailTxt.text == "" || passwordTxt.text == ""{
            signInBtn.isEnabled = false
        } else{
            signInBtn.isEnabled = true
        }
        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTxt.resignFirstResponder()
        passwordTxt.resignFirstResponder()
        return true
    }
    @IBAction func emailAction(_ sender: Any) {
        tag = tag + 1
        if(tag == 2){
            signInBtn.isEnabled = true
        }
    }
    @IBAction func passAction(_ sender: Any) {
        tag = tag + 1
        if(tag == 2){
            signInBtn.isEnabled = true
        }
    }
    @IBAction func signInAction(_ sender: Any) {
        
        
        
        
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
