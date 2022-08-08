//
//  BmiController.swift
//  HealthQuest
//
//  Created by user206114 on 8/3/22.
//

import UIKit

class BmiController: UIViewController {
    let datePicker = UIDatePicker()
    @IBOutlet weak var weightTxt: UITextField!
    @IBOutlet weak var heightTxt: UITextField!

    @IBOutlet weak var bdayText: UITextField!
    @IBOutlet weak var rdiofemale: UIButton!
    @IBOutlet weak var rdioMale: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        createDatePickerView()
        // Do any additional setup after loading the view.
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
    }
    @IBAction func rdioActionTwo(_ sender: UIButton) {
        
        if sender.tag == 1{
            rdioMale.isSelected = true
            rdiofemale.isSelected = false
        } else if sender.tag == 2{
            rdiofemale.isSelected = true
            rdioMale.isSelected = false
        }
    }
    @IBAction func rdioAction(_ sender: UIButton) {
        
        if sender.tag == 1 {
            rdioMale.isSelected = true
            rdiofemale.isSelected = false
        } else if sender.tag == 2 {
            rdioMale.isSelected = false
            rdiofemale.isSelected = true
        }
    }
    @IBAction func onSubmitClick(_ sender: Any) {
        let w = Double(weightTxt.text!)
        let h = Double(heightTxt.text!)
        let hinm = h!/100
        
        let bmi = w!/(hinm * hinm)
        print("the bmi i s ",bmi)
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
