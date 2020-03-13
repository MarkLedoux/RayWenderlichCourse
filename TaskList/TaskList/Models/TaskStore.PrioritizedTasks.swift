//
//  TaskStore.PrioritizedTasks.swift
//  TaskList
//
//  Created by Mark LEDOUX  on 13/03/2020.
//  Copyright © 2020 Mark LEDOUX . All rights reserved.
//

import Foundation

extension TaskStore {
    struct PriotizedTasks {
        let priority: Task.Priority
        var tasks: [Task]
    }
}

extension TaskStore.PriotizedTasks: Identifiable {
    var id: Task.Priority {
        priority
    }
}
