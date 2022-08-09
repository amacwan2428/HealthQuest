//
//  HomeViewController.swift
//  HealthQuest
//
//  Created by user206114 on 8/8/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var bmiLabel: UILabel!
    
    @IBOutlet weak var bmrLabel: UILabel!
    
    @IBOutlet weak var bmiExLa: UILabel!
    var bmi: String?
    var bmr: String?
    var desc: String?
    override func viewDidLoad() {
        super.viewDidLoad()

        if bmi != nil {
            bmiLabel.text = bmi
        }
        if bmiExLa != nil {
            bmiExLa.text = desc
        }
        if bmr != nil {
            bmrLabel.text = bmr
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
