//
//  BmiController.swift
//  HealthQuest
//
//  Created by user206114 on 8/3/22.
//

import UIKit

class BmiController: UIViewController {
    @IBOutlet weak var weightTxt: UITextField!
    @IBOutlet weak var heightTxt: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
