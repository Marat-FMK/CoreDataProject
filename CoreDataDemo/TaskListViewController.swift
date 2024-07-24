//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Marat Fakhrizhanov on 24.07.2024.
//

import UIKit
import CoreData


protocol TaskViewControllerDelegate {
   func reloadData()
}

class TaskListViewController: UITableViewController {

    
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private let cellID = "task"
    
    private var taskList: [ Task ] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
        setupNavigationBar()
        fetchData()
        
    }

    
    
    
    private func setupNavigationBar() {
        
        title = "Task List"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navBarAppearance = UINavigationBarAppearance()
        
        navBarAppearance.backgroundColor = UIColor(_colorLiteralRed: 21/255, green: 101/255, blue: 192/255, alpha: 194/255)
        navBarAppearance.titleTextAttributes = [ .foregroundColor: UIColor(.white)]
        navBarAppearance.largeTitleTextAttributes = [ .foregroundColor: UIColor(.white)] // цвет текста для ларге тайтл и для обычного тайтла ...Atributes изменяет текст и принимает массив с [.dfdfdfsf: Any]
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewTask)) // добавляем и настраиваем цвет кнопки в правый угол нав контроллера в селектор нужен метод objc
        navigationController?.navigationBar.tintColor = .white
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance // для лардж тайтл при скроле
        
        
        
    }
    @objc private func addNewTask(){
        let taskVC = TaskViewController()
        taskVC.delegate = self
        present(taskVC, animated: true)
    }
    
    private func fetchData() {
        let fetchReguest = Task.fetchRequest()
        
        do{
            taskList = try context.fetch(fetchReguest)
        } catch let error {
            print(error)
        }
    }
}


// MARK: - UITableViewDataSource

extension TaskListViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        taskList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        let task = taskList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = task.title
        
        cell.contentConfiguration = content
        
        
        return cell
        
    }
}

extension TaskListViewController : TaskViewControllerDelegate {
    
    func reloadData() {
        fetchData()
        tableView.reloadData()
    }
}
