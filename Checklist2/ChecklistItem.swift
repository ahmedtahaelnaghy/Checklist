//
//  ChecklistItem.swift
//  Checklist2
//
//  Created by Ahmed Taha on 2/16/20.
//  Copyright © 2020 Ahmed Taha. All rights reserved.
//

import Foundation


class ChecklistItem {
    
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
