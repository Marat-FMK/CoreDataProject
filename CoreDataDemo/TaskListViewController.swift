//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Marat Fakhrizhanov on 24.07.2024.
//

import UIKit

class TaskListViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupNavigationBar()
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
        present(taskVC, animated: true)
    }
}

