//
//  TasksViewController.swift
//  Composite
//
//  Created by Daniil Kniss on 20.04.2021.
//

import UIKit

class TasksViewController: UITableViewController {
    
    var tasks = [ConcreteTask]()

    @IBAction func addTask(_ sender: Any) {
        let alertVC = UIAlertController(title: "Добавить задачу", message: "", preferredStyle: .alert)
        alertVC.addTextField { textField in
            textField.placeholder = "Введите имя задачи"
        }
        let action = UIAlertAction(title: "Ок", style: .default) { _ in
            let newTask = ConcreteTask(alertVC.textFields![0].text ?? "")
            self.tasks.append(newTask)
            self.tableView.reloadData()
        }
        alertVC.addAction(action)
        self.present(alertVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
}
