//
//  TaskStore.swift
//  TaskList
//
//  Created by Mark LEDOUX  on 07/03/2020.
//  Copyright © 2020 Mark LEDOUX . All rights reserved.
//

import Combine

class TaskStore: ObservableObject {
   @Published var tasks = [
        "Code the SwiftUI App",
        "Book an escape room",
        "Walk the cat",
        "Pick up heavy things and put them down",
        "Pass the exam on Monday and Tuesday",
        "Make karaoke playlist",
        "Present at iOS meetup group",
        "Watch Youtube",
        "Watch Avatar the Last Airbender again",
        "Read this week's WSJ series"
        ].map { Task(name: $0) }
    
}
