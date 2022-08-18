//
//  PlanViewController.swift
//  HealthQuest
//
//  Created by Ruy Guilherme Silva Gomes de Oliveira on 2022-08-03.
//

import UIKit

class PlanViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let destinationVC = segue.destination as! DailyTodoViewController
        destinationVC.selectedDay = segue.identifier
        
        
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
