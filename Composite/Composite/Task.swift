//
//  Task.swift
//  Composite
//
//  Created by Daniil Kniss on 20.04.2021.
//

import Foundation

protocol Task {
    var text: String { get }
    
}

//class ConcreteTask: Task {
//    var text: String
//
//    init(_ text: String) {
//        self.text = text
//    }
//}

class CompositeTask: Task {
    var text: String
    
    var tasks: [CompositeTask]
    
    init(_ text: String,_ tasks: [CompositeTask]) {
        self.text = text
        self.tasks = tasks
    }
}
