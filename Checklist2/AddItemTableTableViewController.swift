//
//  AddItemTableTableViewController.swift
//  Checklist2
//
//  Created by Ahmed Taha on 2/21/20.
//  Copyright © 2020 Ahmed Taha. All rights reserved.
//

import UIKit

class AddItemTableTableViewController: UITableViewController {
    
    @IBOutlet weak var textfield: UITextField!
    
    
    @IBAction func cansel(_ sender: Any) {
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func done(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.largeTitleDisplayMode = .never
        
    }
}
