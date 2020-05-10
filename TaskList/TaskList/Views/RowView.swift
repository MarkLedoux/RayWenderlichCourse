//
//  RowView.swift
//  TaskList
//
//  Created by Mark LEDOUX  on 11/03/2020.
//  Copyright © 2020 Mark LEDOUX . All rights reserved.
//

import SwiftUI

struct RowView: View {
    @Binding var task: Task

    let checkmark = Image(systemName: "checkmark")

    var body: some View {
        NavigationLink(
        destination: TaskEdtitingView(task: $task)) {
            if task.completed {
                checkmark
            } else {
                checkmark.hidden()
            }
            Text(task.name)
                .foregroundColor(Color.black)
                .strikethrough(task.completed)
        }
    }
}

struct RowView_Previews: PreviewProvider {
    static var previews: some View {
        RowView(task: .constant (Task(name: "To Do")))
    }
}
