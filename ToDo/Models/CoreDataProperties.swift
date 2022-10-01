//
//  Task+CoreDataProperties.swift
//  ToDo
//
//  Created by Полина Толстенкова on 28.09.2022.
//
//

import Foundation
import CoreData


extension Task: TaskModel {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }
    
    @NSManaged public var title: String
    @NSManaged public var id: UUID
    
}

extension Task : Identifiable {}
