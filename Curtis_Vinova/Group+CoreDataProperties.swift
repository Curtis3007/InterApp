//
//  Group+CoreDataProperties.swift
//  Curtis_Vinova
//
//  Created by CATALINA-ADMIN on 9/3/20.
//  Copyright © 2020 CATALINA-ADMIN. All rights reserved.
//
//

import Foundation
import CoreData


extension Group {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Group> {
        return NSFetchRequest<Group>(entityName: "Group")
    }

    @NSManaged public var groupID: UUID?
    @NSManaged public var groupName: String?
    @NSManaged public var numOfTask: Int32
    @NSManaged public var section: Int32
    @NSManaged public var timeCreate: Int32
    @NSManaged public var belongToBoard: Board?
    @NSManaged public var haveTasks: NSSet?

}

// MARK: Generated accessors for haveTasks
extension Group {

    @objc(addHaveTasksObject:)
    @NSManaged public func addToHaveTasks(_ value: Task)

    @objc(removeHaveTasksObject:)
    @NSManaged public func removeFromHaveTasks(_ value: Task)

    @objc(addHaveTasks:)
    @NSManaged public func addToHaveTasks(_ values: NSSet)

    @objc(removeHaveTasks:)
    @NSManaged public func removeFromHaveTasks(_ values: NSSet)

}
