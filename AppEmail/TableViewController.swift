//
//  ViewController.swift
//  AppEmail
//
//  Created by Renato Tramontano on 27/07/18.
//  Copyright © 2018 Renato Tramontano. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var n = 15

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return n
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(indexPath.section) \(indexPath.row)"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "delete") { (action, view, completion) in
            print("delete")
            self.n -= 1
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        deleteAction.backgroundColor = .red
        
        let modifyAction = UIContextualAction(style: .normal, title: "update") { (action, view, completion) in
            print("modify")
            completion(true)
        }
        modifyAction.backgroundColor = .blue
        
        return UISwipeActionsConfiguration(actions: [deleteAction, modifyAction])
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let insert = UIContextualAction(style: .destructive, title: "insert") { (action, view, completion) in
            print("insert")
            self.n -= 1
            tableView.deleteRows(at: [indexPath], with: .automatic)
            completion(true)
        }
        insert.backgroundColor = .green
        
        return UISwipeActionsConfiguration(actions: [insert])
    }
    
    

}

