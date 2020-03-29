//
//  ViewController.swift
//  Checklist2
//
//  Created by Ahmed Taha on 2/14/20.
//  Copyright © 2020 Ahmed Taha. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController  {

    var todoList : TodoList
    
    @IBAction func addItem(_ sender: Any) {
        
        let newRowIndex = todoList.todos.count
        _ = todoList.newTodo()
        let indexPath = IndexPath(row: newRowIndex , section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)

    }
    
    required init?(coder aDecoder: NSCoder) {
        todoList = TodoList()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoList.todos.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        let item = todoList.todos[indexPath.row]
        
        configuerText(for: cell, with: item)
        configuerCheckmark(for: cell, with: item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            let item = todoList.todos[indexPath.row]
            configuerCheckmark(for: cell, with: item)
            tableView.deselectRow(at: indexPath, animated: true)
            }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        todoList.todos.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic
        )
    }
    
    func configuerText(for cell : UITableViewCell , with item : ChecklistItem) {
        if let Label = cell.viewWithTag(1000) as? UILabel {
            Label.text = item.text
        }
    }
    
    func configuerCheckmark (for cell : UITableViewCell, with item: ChecklistItem ) {
        item.toggleChecked()
    }

    override func prepare(for segue: UIStoryboardSegue , sender : Any?) {
        
        if segue.identifier == "AddItemSegue" {
            if let addItemViewController = segue.destination as? AddItemTableViewController {
                addItemViewController.delegate = self
            }
        }
        
    }
    
}

extension ChecklistViewController: AddItemVeiwControllerDelegate {
    
    func addItemViewControllerDidCansel(_ controller: AddItemTableViewController) {
        navigationController?.popViewController(animated: true)
    }
    func addItemViewController(_ controller: AddItemTableViewController, didFinishAdding item: ChecklistItem) {
        navigationController?.popViewController(animated:true)
        
        let rowIndex = todoList.todos.count
        todoList.todos.append(item)
        let indexPath = IndexPath(row: rowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths , with: .automatic)
    }
}

