//
//  TasksViewController+Ext.swift
//  Composite
//
//  Created by Daniil Kniss on 20.04.2021.
//

import UIKit

protocol TasksDelegate: AnyObject {
    func updateTasks(with tasks : [CompositeTask])
}

extension TasksViewController: TasksDelegate {
    func updateTasks(with tasks: [CompositeTask]) {
        if let previousIndexPath = self.previousTaskIndexPath { 
            self.tasks[previousIndexPath.row].tasks = tasks
            self.tableView.reloadRows(at: [previousIndexPath], with: .automatic)
        }
    }
}
