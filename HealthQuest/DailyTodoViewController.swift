//
//  DailyTodoViewController.swift
//  HealthQuest
//
//  Created by Ruy Oliveira on 2022-08-07.
//

import UIKit
import CoreData

class DailyTodoViewController: UIViewController {
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var lblTitle: UILabel!
    var selectedDay:String?
    var workoutList = [Workout]()
    let userDefaults = UserDefaults.standard

    //reference to managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(selectedDay!)
        // Setup title
        lblTitle.text = selectedDay!
        // Setup table view
        table.delegate = self
        table.dataSource = self
        // Load workouts
        var allWorkouts = [
            "Monday" : ["15 min cardio", "3x10 Pushups", "3x10 Squats","3x10 Dumbbell rows"],
            "Tuesday" : ["30 min Cardio", "3x10 Single-leg deadlifts", "3x10 Burpees", "2x Planks","3x10 Glute bridge"],
            "Wednesday" : ["30 min Cardio", "3x10 Bench Press", "3x10 Push-Ups","3x10 Bent-Over Row"],
            "Thursday" : ["30 min Cardio","3x10 Lunges", "3x10 Pushups", "3x10 Squats","3x10 Dumbbell rows"],
            "Friday" : ["30 min Cardio","3x10 Bench Press", "3x10 Pushups", "3x10 Burpees","3x10 Dumbbell rows"]
            
        ]
        let week = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday"]
        for day in week
        {
            if userDefaults.string(forKey: day) != nil {
                var workouts = userDefaults.string(forKey: day)
                var arr = workouts?.components(separatedBy: ",")
                allWorkouts[day] = arr
                
            }
        }
        
        // Use core data instead
        let dayWorkouts = allWorkouts[selectedDay!]!;
        for activity in dayWorkouts
        {
            let item = Workout(context: self.context)
            // Get task title from textfield
            item.title = String(activity)
            item.day = selectedDay
            // Add task to array
            self.workoutList.append(item)
            print(item)

        }

    }
    
    


}
extension DailyTodoViewController: UITableViewDelegate, UITableViewDataSource{
    private func handleMarkAsDone(indexPath: IndexPath) {
        let key  = workoutList[indexPath.row].day! + workoutList[indexPath.row].title!
        userDefaults.set(true, forKey: key)
        print ("Mark as done " + key + " " + String(userDefaults.bool(forKey: key)))
    }
    private func handleMarkAsUndone(indexPath: IndexPath) {
        let key  = workoutList[indexPath.row].day! + workoutList[indexPath.row].title!
        userDefaults.set(false, forKey: key)
        print ("Mark as undone " + key + " " + String(userDefaults.bool(forKey: key)))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Add rows in section equivalent to the number of tasks
        return workoutList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // Add task title to the cell
        cell.textLabel?.text = workoutList[indexPath.row].title!
        let key  = workoutList[indexPath.row].day! + workoutList[indexPath.row].title!
        print ("Loaded key " + key + " " + String(userDefaults.bool(forKey: key)))

        if userDefaults.bool(forKey: key) == false {
            cell.accessoryType = UITableViewCell.AccessoryType.none
            cell.textLabel?.textColor = UIColor.black
        }
        else
        {
            cell.accessoryType = UITableViewCell.AccessoryType.checkmark
            cell.textLabel?.textColor = UIColor.gray
        }
        return cell
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal,
                                        title: "Undo") { [weak self] (action, view, completionHandler) in
            self?.handleMarkAsUndone(indexPath: indexPath)
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
            tableView.cellForRow(at: indexPath)?.textLabel?.textColor = UIColor.black
                                            completionHandler(true)
        }
        action.backgroundColor = .systemOrange
        
        return UISwipeActionsConfiguration(actions: [action])
        
    }
    func tableView(_ tableView: UITableView,
                       trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let done = UIContextualAction(style: .normal,
                                         title: "Done") { [weak self] (action, view, completionHandler) in
                                            self?.handleMarkAsDone(indexPath: indexPath)
                                            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
            tableView.cellForRow(at: indexPath)?.textLabel?.textColor = UIColor.gray

                                            completionHandler(true)
        }
        done.backgroundColor = .systemGreen
        let configuration = UISwipeActionsConfiguration(actions: [done])

        return configuration
    }
    
    
}

