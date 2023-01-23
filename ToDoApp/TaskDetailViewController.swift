//
//  TaskDetailViewController.swift
//  ToDoApp
//
//  Created by Osmar Juarez on 23/09/22.
//

import UIKit

class TaskDetailViewController: UITableViewController {

    @IBOutlet var taskTitle: UITextField!
    @IBOutlet var taskDate: UIDatePicker!
    @IBOutlet var taskNotes: UITextView!
    @IBOutlet var cancelTaskButton: UIBarButtonItem!
    @IBOutlet var saveTaskButton: UIBarButtonItem!
    let context = (UIApplication.shared.delegate! as! AppDelegate).persistentContainer.viewContext
    var toDoDetailTask : Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if toDoDetailTask != nil {
            taskTitle.text = toDoDetailTask?.title
            taskDate.date = (toDoDetailTask?.date)!
            taskNotes.text = toDoDetailTask?.notes
        } else {
            toDoDetailTask = Task(context: self.context)
            toDoDetailTask?.id_task = UUID()
            taskTitle.text = ""
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! ToDoListViewController
        toDoDetailTask?.title = taskTitle.text
        toDoDetailTask?.notes = taskNotes.text
        toDoDetailTask?.date = taskDate.date
        print("UUID: ", toDoDetailTask?.id_task?.description)
        
        destination.currentTask =  toDoDetailTask
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
         var perform = false
         if validateText(text: taskTitle.text!) {
             perform = true
         }
         else{
             userMessage(alertTitle: "Atención", message: "Escribe un título para la actividad", actionTitle: "Ok", vc: self)
         }
         return perform
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    @IBAction func cancelTaskButtonPress(_ sender: UIBarButtonItem) {
        let isModal = self.presentingViewController is UINavigationController
        if isModal{
            self.dismiss(animated: true)
        }else{
            navigationController?.popViewController(animated: true)
        }
    }
    
}
