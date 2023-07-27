//
//  ViewController.swift
//  ToDoListApp
//
//  Created by Gizem Coşkun on 27.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    var items = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.items = UserDefaults.standard.stringArray(forKey: "items") ?? []
        title = "To Do List"
        view.addSubview(tableView)
        tableView.dataSource = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addItemsBtn))
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    @objc func addItemsBtn(){
        let alert = UIAlertController(title: "New Item", message: "Enter new item in todo list", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Enter New Item"
        }
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { (_) in
            if let textField = alert.textFields?.first{
                if let text = textField.text, !text.isEmpty {
                    DispatchQueue.main.async {
                        var currentItem = UserDefaults.standard.stringArray(forKey: "items") ?? []
                        currentItem.append(text)
                        UserDefaults.standard.set(currentItem, forKey: "items")
                        self.items.append(text)
                        self.tableView.reloadData()
                    }
                }
            }
            
        }))
        present(alert, animated: true)
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    
}
