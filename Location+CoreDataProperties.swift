//
//  Location+CoreDataProperties.swift
//  Home Report
//
//  Created by Gregory DeNinno on 2/18/16.
//  Copyright © 2016 PFI. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Location {

    @NSManaged var city: String?
    @NSManaged var home: NSSet?

}
