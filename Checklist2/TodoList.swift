//
//  TodoList.swift
//  Checklist2
//
//  Created by Ahmed Taha on 2/16/20.
//  Copyright © 2020 Ahmed Taha. All rights reserved.
//

import Foundation

class TodoList {
    
    var todos : [ChecklistItem] = []
    
    
    func newTodo() -> ChecklistItem {
        let item = ChecklistItem()
        item.text = randomTitle()
        item.checked = true
        todos.append(item)
        return item  
    }
    
    
    private func randomTitle() -> String {
        let titles = ["New todo item", "Fill me out", "Generic todo", "I need something to do", "Much todo about nothing"]
        let randomNumber = Int.random(in: 0 ... titles.count - 1)
        return titles[randomNumber]
    }
}
