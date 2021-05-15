//
//  Task.swift
//  Composite
//
//  Created by Daniil Kniss on 20.04.2021.
//

import Foundation

class CompositeTask {
    var text: String
    var tasks: [CompositeTask]
    
    init(_ text: String,_ tasks: [CompositeTask]) {
        self.text = text
        self.tasks = tasks
    }
}
