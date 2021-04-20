//
//  TasksViewController.swift
//  Composite
//
//  Created by Daniil Kniss on 20.04.2021.
//

import UIKit

class TasksViewController: UITableViewController,UINavigationControllerDelegate {
    
    var tasks = [CompositeTask]()
    
    var previousTaskIndexPath: IndexPath?
    
    weak var delegate: TasksDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(addTapped))
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let nextViewController = storyboard?.instantiateViewController(identifier: "TasksViewController") as? TasksViewController else { return }
        let currentTask = tasks[indexPath.row]
        
        nextViewController.tasks = currentTask.tasks
        nextViewController.delegate = self
        self.previousTaskIndexPath = indexPath
        navigationController?.pushViewController(nextViewController, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell") as? TaskCell else { return UITableViewCell() }
        
        let currentTask = self.tasks[indexPath.row]
        
        cell.taskName.text = currentTask.text
        cell.subTasksCount.text = "Кол-во подзадач: \(currentTask.tasks.count)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.tasks.remove(at: indexPath.row)
            self.delegate?.updateTasks(with: self.tasks)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            self.tableView.reloadData()
        }
    }
    
    @objc private func addTapped() {
        let alertVC = UIAlertController(title: "Добавить задачу", message: "", preferredStyle: .alert)
        alertVC.addTextField { textField in
            textField.placeholder = "Введите имя задачи"
        }
        
        let action = UIAlertAction(title: "Ок", style: .default) { _ in
            let newTask = CompositeTask(alertVC.textFields![0].text ?? "", [])
            self.tasks.append(newTask)
            self.delegate?.updateTasks(with: self.tasks)
            self.tableView.reloadData()
        }
        
        alertVC.addAction(action)
        self.present(alertVC, animated: true)
    }
}

