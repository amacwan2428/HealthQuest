//
//  TrainerListViewController.swift
//  HealthQuest
//
//  Created by Ruy Oliveira on 2022-08-18.
//

import UIKit

class TrainerViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    var tasks = [Workout]()
    let userDefaults = UserDefaults.standard

    @IBOutlet weak var txtWeekday: UITextField!
    //reference to managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
        // Load data
        fetchTasks()
    }
    
    
    
    func SaveTasks()
    {
        // Try saving data
        do {
            try self.context.save()
        }
        catch {
            print(error)
        }
        // Re-fetch data
        self.fetchTasks()
        
    }
    func fetchTasks(){
        
        //Fetch data from coredata
        do{
            // Create array from loaded data
            self.tasks = try context.fetch(Workout.fetchRequest())
            // Async load table
            DispatchQueue.main.async {
                self.table.reloadData()
            }
           
        }
        catch {
            print(error)
        }
    }
    @IBAction func addItem(_ sender: Any) {
        var textField = UITextField()
        
        let alert = UIAlertController (title: "Add workout", message: "Enter the workout description", preferredStyle: .alert)
        
        
        alert.addTextField { (alertTextField) in
            if let text = alertTextField.text {
                print ("alertTextField.text", text)
            }
            textField = alertTextField
            textField.placeholder = "Add new workout"
        }
        
        let actionOk = UIAlertAction(title: "OK", style:.default) { (action) in
            let item = Workout(context: self.context)
            // Get task title from textfield
            item.title = textField.text!
            item.day = self.txtWeekday.text!
            // Add task to array
            self.tasks.append(item)
            // Save data
            self.SaveTasks()
            // Reload table
            self.table.reloadData()
            
        }
        
       
        let actionCancel = UIAlertAction (title: "Cancel", style: .cancel) { (action) in
            print ("Cancel")
            
        }
        
        if let text = textField.text {
            print ("alertTextField.text", text)
        }
    
        alert.addAction(actionOk)
        alert.addAction(actionCancel)
        
        present(alert, animated: true,completion: nil)
        
    }
    @IBAction func UploadWorkout(_ sender: Any) {
        
        var workouts: [String:String] = [:]
        for workout in tasks{
            var day = workout.day!
            if(day == "")
            {
                day = "Monday"
            }

            print(workout)
            if(workouts[day] == nil)
            {
                workouts[day] = workout.title!
            }
            else
            {
                workouts[day]! += "," + workout.title!

            }
        }
        for (day, title) in workouts{
            userDefaults.set(title, forKey: day)
            print(userDefaults.string(forKey: day))
        }
    }
    
}
extension TrainerViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Add rows in section equivalent to the number of tasks
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        // Add task title to the cell
        cell.textLabel?.text = tasks[indexPath.row].day! + ": " + tasks[indexPath.row].title!
        return cell
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            
            // Task to remove
            let itemToRemove = self.tasks[indexPath.row]
            //Delete from data
            self.context.delete(itemToRemove)
            // Delete task from array
            tasks.remove(at: indexPath.row)
            // Save and refetch data
            self.SaveTasks()
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
            

        }
    }
    
}

