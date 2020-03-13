//
//  SectionView.swift
//  TaskList
//
//  Created by Mark LEDOUX  on 13/03/2020.
//  Copyright © 2020 Mark LEDOUX . All rights reserved.
//

import SwiftUI

struct SectionView: View {
    @Binding var prioritizedTasks: TaskStore.PriotizedTasks
    
    var body: some View {
        Section(
            header: Text(
                "\(prioritizedTasks.priority.rawValue.capitalized) Priority"
            )
            ) {
            ForEach(prioritizedTasks.tasks) { index in
                RowView(task: self.$prioritizedTasks.tasks[index])
            }
            .onMove { sourceIndices, destinationIndex  in
                self.prioritizedTasks.tasks.move(
                    fromOffsets: sourceIndices,
                    toOffset: destinationIndex)
            }
            .onDelete { indexSet in
                self.prioritizedTasks.tasks.remove(
                    atOffsets: indexSet)
            }
        }
    }
}
