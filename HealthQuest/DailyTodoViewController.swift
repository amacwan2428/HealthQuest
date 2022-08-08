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
    var workoutList = [WorkoutItem]()
    //reference to managed object context
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup table view
        table.delegate = self
        table.dataSource = self
        // Load workouts
        // Use core data instead
        let teste = "10p, 20 a, 30 c, 123d";
        let testList = teste.split(separator:",")
        for activity in testList
        {
            let item = WorkoutItem(context: self.context)
            // Get task title from textfield
            item.title = String(activity)
            item.day = 0;
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
                                        title: "Done") { [weak self] (action, view, completionHandler) in
                                            self?.handleMarkAsDone()
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCell.AccessoryType.none
            tableView.cellForRow(at: indexPath)?.textLabel?.textColor = UIColor.black
                                            completionHandler(true)
        }
        action.backgroundColor = .systemGreen
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

