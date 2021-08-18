//
//  UserObject+CoreDataProperties.swift
//  First1
//
//  Created by Oleg Vishnivetskiy on 17.08.2021.
//
//

import Foundation
import CoreData


extension UserObject {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserObject> {
        return NSFetchRequest<UserObject>(entityName: "UserObject")
    }

    @NSManaged public var birthdate: Double
    @NSManaged public var city: String?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var picture: String?

}

extension UserObject : Identifiable {

}
