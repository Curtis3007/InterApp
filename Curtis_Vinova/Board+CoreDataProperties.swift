//
//  Board+CoreDataProperties.swift
//  Curtis_Vinova
//
//  Created by CATALINA-ADMIN on 9/3/20.
//  Copyright © 2020 CATALINA-ADMIN. All rights reserved.
//
//

import Foundation
import CoreData


extension Board {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Board> {
        return NSFetchRequest<Board>(entityName: "Board")
    }

    @NSManaged public var boardColor: String?
    @NSManaged public var boardDecription: String?
    @NSManaged public var boardID: UUID?
    @NSManaged public var boardName: String?
    @NSManaged public var numOfGroup: Int32
    @NSManaged public var haveGroups: NSSet?

}

// MARK: Generated accessors for haveGroups
extension Board {

    @objc(addHaveGroupsObject:)
    @NSManaged public func addToHaveGroups(_ value: Group)

    @objc(removeHaveGroupsObject:)
    @NSManaged public func removeFromHaveGroups(_ value: Group)

    @objc(addHaveGroups:)
    @NSManaged public func addToHaveGroups(_ values: NSSet)

    @objc(removeHaveGroups:)
    @NSManaged public func removeFromHaveGroups(_ values: NSSet)

}
