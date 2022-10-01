//
//  DataManager.swift
//  ToDo
//
//  Created by Полина Толстенкова on 13.09.2022.
//

import Foundation

protocol DataManager {
    func addTask(_ title: String)
    func deleteTask(at offsets: IndexSet)
    func updateTasks()
    func fetchTasks() -> [TaskModel]
}

