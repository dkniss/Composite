//
//  TasksViewController.swift
//  Composite
//
//  Created by Daniil Kniss on 20.04.2021.
//

import UIKit

class TasksViewController: UITableViewController {
    
    var tasks = [ConcreteTask]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addTapped))

    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell") as? TaskCell else { return UITableViewCell() }
        
        cell.taskName.text = tasks[indexPath.row].text
        cell.subTasksCount.text = "Кол-во подзадач: \(0)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.tasks.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
    @objc private func addTapped() {
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
}
