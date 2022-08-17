//
//  HomeViewController.swift
//  HealthQuest
//
//  Created by user206114 on 8/8/22.
//

import UIKit
//code by Angel
class HomeViewController: UIViewController {
    let userDefaults = UserDefaults.standard
    @IBOutlet weak var bmiLabel: UILabel!
    
    @IBOutlet weak var bmrLabel: UILabel!
    
    @IBOutlet weak var bmiExLa: UILabel!
    var bmis: String?
    var bmrs: String?
    var descs: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        bmis = userDefaults.string(forKey: "bmi")
        bmrs = userDefaults.string(forKey: "bmr")
        descs = userDefaults.string(forKey: "desc")
        if bmis != nil {
            bmiLabel.text = bmis
        } else {
            bmiLabel.text = "18.01"
        }
        if descs != nil {
            bmiExLa.text = descs
        } else {
            bmiExLa.text = "You are underweight"
        }
        if bmrs != nil {
            bmrLabel.text = bmrs
        } else {
            bmrLabel.text = "1231.56"
        }
        // Do any additional setup after loading the view.
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
