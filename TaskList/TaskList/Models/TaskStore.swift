//
//  TaskStore.swift
//  TaskList
//
//  Created by Mark LEDOUX  on 07/03/2020.
//  Copyright © 2020 Mark LEDOUX . All rights reserved.
//

import Combine

class TaskStore: ObservableObject {
    @Published var prioritizedTasks = [
        PriotizedTasks(
            priority: .high,
            names: [
                "Code the SwiftUI App",
                "Book an escape room",
                "Walk the cat",
                "Pick up heavy things and put them down"
            ]
        ),
        PriotizedTasks(
            priority: .medium,
            names: [
                "Pass the exam on Monday and Tuesday",
                "Make karaoke playlist",
                "Present at iOS meetup group",
            ]
        ),
        PriotizedTasks(
            priority: .low,
            names: [
                "Watch Youtube",
                "Watch Avatar the Last Airbender again",
            ]
        ),
        PriotizedTasks(
            priority: .no,
            names: [
                "Read this week's WSJ series"
            ]
        )
    ]
    
    func getIndex(for priority: Task.Priority) -> Int {
        prioritizedTasks.firstIndex { $0.priority == priority }!
         
    }
}

private extension TaskStore.PriotizedTasks {
    init(priority: Task.Priority, names: [String]) {
        self.init(
            priority: priority,
            tasks: names.map { Task(name: $0) }
        )
    }
}
