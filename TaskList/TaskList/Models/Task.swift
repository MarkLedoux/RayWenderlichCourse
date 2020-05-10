//
//  Task.swift
//  TaskList
//
//  Created by Mark LEDOUX  on 07/03/2020.
//  Copyright © 2020 Mark LEDOUX . All rights reserved.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()

    var name: String
    var completed = false
}
