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
    @State var modalIsPresented = false
    
    var body: some View {
        NavigationView {
            NavigationLink(destination: /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Destination@*/Text("Destination")/*@END_MENU_TOKEN@*/) {
                List {
                    ForEach(taskStore.tasks) { task in
                        Text(task.name)
                            .foregroundColor(Color.black)
                    }
                    .onMove { sourceIndices, destinationIndex  in
                        self.taskStore.tasks.move(
                            fromOffsets: sourceIndices,
                            toOffset: destinationIndex)
                    }
                    .onDelete { indexSet in
                        self.taskStore.tasks.remove(
                            atOffsets: indexSet)
                    }
                }
                .navigationBarTitle("Tasks")
                .navigationBarItems(
                    leading: EditButton(),
                    trailing:
                    Button(action: { self.modalIsPresented = true }) {
                        Image(systemName: "plus")
                    }
                )
            }
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
