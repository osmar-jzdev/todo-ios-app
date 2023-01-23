//
//  ToDoListViewController.swift
//  ToDoApp
//
//  Created by Osmar Juarez on 23/09/22.
//

import UIKit

class ToDoListViewController: UIViewController {

    @IBOutlet var toDoListTableView: UITableView!
    @IBOutlet var addTaskButton: UIBarButtonItem!
    let context = (UIApplication.shared.delegate! as! AppDelegate).persistentContainer.viewContext
    var currentTask: Task?
    var task: [Task]?
    var dataManager: TaskDataManager
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toDoListTableView.delegate = self
        toDoListTableView.dataSource = self
        
        dataManager =  TaskDataManager(context: context)
        dataManager.fetch()
        
    }
    
    @IBAction  func unWindFromDetail(segue: UIStoryboardSegue ){
            let source = segue.source as! TaskDetailViewController
            currentTask = source.toDoDetailTask
            do{
                try context.save()
            }
            catch{
                print("error al salvar",error)
            }
            
            let dataManager = TaskDataManager(context: context)
            dataManager.fetch()
            
            //task = dataManager.self
            self.toDoListTableView.reloadData()
        }
}

extension ToDoListViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.countTasks()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "toDoTaskTableViewCell") as! ToDoTaskTableViewCell
        cell.taskTitleLabel.text = dataManager.getTask(index: indexPath.row).title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "taskDetailSegue", sender: Self.self)
    }
}
