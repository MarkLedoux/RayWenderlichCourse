//
//  TaskEdtitingView.swift
//  TaskList
//
//  Created by Mark LEDOUX  on 12/03/2020.
//  Copyright © 2020 Mark LEDOUX . All rights reserved.
//

import SwiftUI

struct TaskEdtitingView: View {
    @Binding var task: Task

    var body: some View {
        Form {
            TextField("Name", text: $task.name)
            Toggle("Completed", isOn: $task.completed)
        }
    }
}

struct TaskEdtitingView_Previews: PreviewProvider {
    static var previews: some View {
        TaskEdtitingView(
            task: .constant(Task(name: "To Do"))
        )
    }
}
