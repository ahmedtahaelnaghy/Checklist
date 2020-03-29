//
//  AddItemTableViewController.swift
//  Checklist2
//
//  Created by Ahmed Taha on 2/21/20.
//  Copyright © 2020 Ahmed Taha. All rights reserved.
//

import UIKit


protocol AddItemVeiwControllerDelegate: class {
   
    func addItemViewControllerDidCansel(_ controller: AddItemTableViewController)
    func addItemViewController(_ controller: AddItemTableViewController, didFinishAdding item: ChecklistItem)
}

class AddItemTableViewController: UITableViewController {
    
    var delegate: AddItemVeiwControllerDelegate?
    var todeList: TodoList?
    var itemToEdit: ChecklistItem?
    
    
    @IBOutlet weak var addBarButtom: UIBarButtonItem!
    @IBOutlet weak var canselBarButton: UIBarButtonItem!
    @IBOutlet weak var textfile: UITextField!
    
    @IBAction func cansel(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        delegate?.addItemViewControllerDidCansel(self)
    }
    
    @IBAction func done(_ sender: Any) {
        navigationController?.popViewController(animated: true)
        
        let item = ChecklistItem()
        if let textFieldText = textfile.text {
            item.text = textFieldText
        }
        item.checked = false
        delegate?.addItemViewController(self, didFinishAdding: item)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
    }
    
    override func viewWillAppear(_ animated: Bool) {
        textfile.becomeFirstResponder()
    }

    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
}
extension AddItemTableViewController: UITextFieldDelegate {
        
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textfile.resignFirstResponder()
        return false
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let oldText = textfile.text,
            let stringRange = Range(range , in: oldText) else {
            return false
        }
        
        let newText = oldText.replacingCharacters(in: stringRange, with: string)
        if newText.isEmpty {
            addBarButtom.isEnabled = false
        } else {
            addBarButtom.isEnabled = true
        }
        return true
    }
}
