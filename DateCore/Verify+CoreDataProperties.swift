//
//  Verify+CoreDataProperties.swift
//  DateCore
//
//  Created by EMo‘s mac  on 12/10/15.
//  Copyright © 2015 Wang. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Verify {

    @NSManaged var teacherID: String?
    @NSManaged var question: String?
    @NSManaged var answer: String?
    @NSManaged var relationship: User?

}
