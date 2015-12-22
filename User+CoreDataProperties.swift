//
//  User+CoreDataProperties.swift
//  DateCore
//
//  Created by EMo‘s mac  on 12/9/15.
//  Copyright © 2015 Wang. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension User {

    @NSManaged var college: String?
    @NSManaged var name: String?
    @NSManaged var password: String?
    @NSManaged var professional: String?
    @NSManaged var teacherID: String?

}
