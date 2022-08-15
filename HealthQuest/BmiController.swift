//
//  BmiController.swift
//  HealthQuest
//
//  Created by user206114 on 8/3/22.
//

import UIKit
//code by Angel
class BmiController: UIViewController, UITextFieldDelegate {
    var tags = 0
    var bmr: Double = 0
    var years: Double = 0
    var flag = 0
    let datePicker = UIDatePicker()
    @IBOutlet weak var weightTxt: UITextField!
    @IBOutlet weak var heightTxt: UITextField!

    
    @IBOutlet weak var bdayText: UITextField!
    
    @IBOutlet weak var rdiofemale: UIButton!
    
    @IBOutlet weak var subButton: UIButton!
    @IBOutlet weak var rdioMale: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePickerView()
        weightTxt.delegate = self
        heightTxt.delegate = self
        subButton.isEnabled = false
        // Do any additional setup after loading the view.
    }
        
    @IBAction func weightAction(_ sender: Any) {
        flag = flag + 1
        if(flag == 2){
            subButton.isEnabled = true
        }
    }
    @IBAction func heightAction(_ sender: Any) {
        flag = flag + 1
        if(flag == 2){
            subButton.isEnabled = true
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        weightTxt.resignFirstResponder()
        heightTxt.resignFirstResponder()
        return true
    }
    func createDatePickerView(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(pressDone))
        toolbar.setItems([doneButton], animated: true)
        bdayText.inputAccessoryView = toolbar
        bdayText.inputView = datePicker
        datePicker.datePickerMode = .date
    }
    
    @objc func pressDone(){
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        bdayText.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
        calculateAge()
    }
    func calculateAge(){
        let dob = datePicker.date
        let today = Date()
        let cal = NSCalendar(identifier: NSCalendar.Identifier.gregorian)
        let age = cal?.components([.month,.day,.year], from: dob, to:today, options: [])
        print(age?.year)
        years = Double(age?.year ?? 0)
    }
    @IBAction func rdAction2(_ sender: UIButton) {
        if sender.tag == 1{
            rdioMale.isSelected = true
            rdiofemale.isSelected = false
            tags = 1
        } else if sender.tag == 2{
            rdiofemale.isSelected = true
            rdioMale.isSelected = false
            tags = 2
        }
    }
    
    @IBAction func rdAction(_ sender: UIButton) {
        if sender.tag == 1 {
            rdioMale.isSelected = true
            rdiofemale.isSelected = false
            tags = 1
        } else if sender.tag == 2 {
            rdioMale.isSelected = false
            rdiofemale.isSelected = true
            tags = 2
        }
        
    }
    
    @IBAction func onSubmitClick(_ sender: Any) {
        let w = Double(weightTxt.text!)
        let h = Double(heightTxt.text!)
        let hinm = h!/100
        var desc = "";
        let bmi = w!/(hinm * hinm)
        print("the bmi i s ",bmi)
        if bmi < 18.5 {
            desc = "You are underweight"
            print("You are underweight")
        } else if bmi >= 18.5 && bmi <= 24.9 {
            desc = "You have a healthy weight"
            print("You have healthy weight")
        } else if bmi >= 25 && bmi <= 29.9{
            desc = "You are overweight"
            print("You are overweight")
        } else {
            desc = "You are obese"
            print("You are obese")
        }
        if tags == 1{
            print("male")
            let bmr1 = (13.397 * w!)
            let bmr2 = (4.799 * h!)
            let bmr3 = (5.677 * years)
            bmr = 88.362 + bmr1 + bmr2 - bmr3
            print(bmr)
         }
        if tags == 2{
            print("female")
            let bmr1 = (9.247 * w!)
            let bmr2 = (3.098 * h!)
            let bmr3 = (4.330 * years)
            bmr = 447.593 + bmr1 + bmr2 - bmr3
            print(bmr)
        }
        let controller = storyboard?.instantiateViewController(identifier: "HomeStory") as! HomeViewController
        controller.bmi = String(bmi)
        controller.desc = desc
        controller.bmr = String(bmr)
        controller.modalPresentationStyle = .fullScreen
        present(controller, animated: true, completion: nil)
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
