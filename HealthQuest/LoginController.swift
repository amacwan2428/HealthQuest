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
    let userDefaults = UserDefaults.standard
    @IBOutlet weak var signInBtn: UIButton!
    var bmi: String?
    var bmr: String?
    var desc: String?
    var bmiNew: String?
  
    var bmrNew: String?
    var descNew: String?
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
        
        if bmi != nil {
            bmiNew = bmi
        }
        if bmr != nil{
            bmrNew = bmr
        }
        if desc != nil {
            descNew = desc
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
        
        if(bmiNew != nil && bmrNew != nil && descNew != nil){
            
            userDefaults.set(bmiNew,forKey: "bmi")
            userDefaults.set(bmrNew,forKey: "bmr")
            userDefaults.set(descNew,forKey: "desc")
            let controller = storyboard?.instantiateViewController(identifier: "HomeStory") as! HomeViewController
            controller.bmis = bmiNew!
            controller.descs = descNew
            controller.bmrs = bmrNew!
            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: true, completion: nil)
            }
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


