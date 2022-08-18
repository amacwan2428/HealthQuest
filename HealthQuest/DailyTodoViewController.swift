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
    var selectedDay:String?
    var workoutList = [Workout]()
    //reference to managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(selectedDay!)
        // Setup table view
        table.delegate = self
        table.dataSource = self
        // Load workouts
        let allWorkouts = [
            "mon" : ["15 min cardio", "3x10 Pushups", "3x10 Squats","3x10 Dumbbell rows"],
            "tue" : ["30 min Cardio", "3x10 Single-leg deadlifts", "3x10 Burpees", "2x Planks","3x10 Glute bridge"],
            "wed" : ["30 min Cardio", "3x10 Bench Press", "3x10 Push-Ups","3x10 Bent-Over Row"],
            "thu" : ["30 min Cardio","3x10 Lunges", "3x10 Pushups", "3x10 Squats","3x10 Dumbbell rows"],
            "fri" : ["30 min Cardio","3x10 Bench Press", "3x10 Pushups", "3x10 Burpees","3x10 Dumbbell rows"]
            
        ]
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
    private func handleMarkAsDone() {
        print ("Mark as done")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Add rows in section equivalent to the number of tasks
        return workoutList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        // Add task title to the cell
        cell.textLabel?.text = workoutList[indexPath.row].title
        return cell
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .none
    }
    func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let action = UIContextualAction(style: .normal,
                                        title: "Undo") { [weak self] (action, view, completionHandler) in
                                            self?.handleMarkAsDone()
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
                                            self?.handleMarkAsDone()
                                            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.checkmark
            tableView.cellForRow(at: indexPath)?.textLabel?.textColor = UIColor.gray

                                            completionHandler(true)
        }
        done.backgroundColor = .systemGreen
        let configuration = UISwipeActionsConfiguration(actions: [done])

        return configuration
    }
    
    
}

