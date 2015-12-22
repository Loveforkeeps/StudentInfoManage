//
//  Student+CoreDataProperties.swift
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

extension Student {

    @NSManaged var name: String?
    @NSManaged var sno: String?
    @NSManaged var id: String?
    @NSManaged var college: String?
    @NSManaged var speciality: String?
    @NSManaged var sex: String?
    @NSManaged var nativePlace: String?
    @NSManaged var hometown: String?
    @NSManaged var attentionYear: String?
    @NSManaged var classNo: NSNumber?

}
