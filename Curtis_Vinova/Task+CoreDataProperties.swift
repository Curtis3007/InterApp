//
//  Task+CoreDataProperties.swift
//  Curtis_Vinova
//
//  Created by CATALINA-ADMIN on 9/3/20.
//  Copyright © 2020 CATALINA-ADMIN. All rights reserved.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var section: Int32
    @NSManaged public var taskColor: String?
    @NSManaged public var taskDate: Date?
    @NSManaged public var taskDescription: String?
    @NSManaged public var taskID: UUID?
    @NSManaged public var taskName: String?
    @NSManaged public var timeCreate: Int32
    @NSManaged public var belongToGroup: Group?

}
