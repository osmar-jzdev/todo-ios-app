//
//  TaskDataManager.swift
//  ToDoApp
//
//  Created by Osmar Juarez on 24/09/22.
//

import Foundation
import CoreData

class TaskDataManager{
    private var task : [Task] = []
    private var context : NSManagedObjectContext
    
    init(context: NSManagedObjectContext){
        self.context = context
    }
    
    func fetch() {
        do{
            self.task = try self.context.fetch(Task.fetchRequest())
        } catch {
            print("Error al recuperar", error)
        }
    }
    
    func getTask(index: Int) -> Task{
        return task[index]
    }
    
    func countTasks() -> Int{
        return task.count
    }
}
