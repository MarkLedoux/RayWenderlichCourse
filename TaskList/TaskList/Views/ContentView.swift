//
//  ContentView.swift
//  TaskList
//
//  Created by Mark LEDOUX  on 07/03/2020.
//  Copyright © 2020 Mark LEDOUX . All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var taskStore: TaskStore
    @State private var modalIsPresented = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(taskStore.prioritizedTasks) { index in
                    SectionView(prioritizedTasks: self.$taskStore.prioritizedTasks[index])
                }
            }
            .listStyle(GroupedListStyle())
            .navigationBarTitle("Tasks")
            .navigationBarItems(
                leading: EditButton(),
                trailing:
                Button(action: { self.modalIsPresented = true }) {
                    Image(systemName: "plus")
                }
            )
        }
        .sheet(isPresented: $modalIsPresented) {
            NewTaskView(taskStore: self.taskStore)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(taskStore: TaskStore())
    }
}
