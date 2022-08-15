//
//  RunningDetViewController.swift
//  HealthQuest
//
//  Created by Brayan Diaz on 8/14/22.
//

import UIKit
import CoreData

class RunningDetViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
//    var items:[Running]?
    var runnerItems:[Runner]?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            
            return self.runnerItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath)
               //Get person from array and set the label
               
               let item = self.runnerItems![indexPath.row]
//        cell.textLabel?.text = (item.time ?? "") + " - " + String(item.distance ?? 0) ?? "" + " Calories"
        cell.textLabel?.text = item.time
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        
        //get items from Core Data
        fetchItems()
        // Do any additional setup after loading the view.
    }
    
    func fetchItems(){
        
        //fetch the data from the core data to display in the table view
        do{
       
            self.runnerItems = try context.fetch(Runner.fetchRequest())
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
           
        }
        catch {
            
            
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
