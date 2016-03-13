//
//  Home+CoreDataProperties.swift
//  Home Report
//
//  Created by Andi Setiyadi on 12/15/15.
//  Copyright © 2015 PFI. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Home {

    @NSManaged var bath: NSNumber?
    @NSManaged var bed: NSNumber?
    @NSManaged var county: String?
    @NSManaged var image: NSData?
    @NSManaged var price: NSNumber?
    @NSManaged var sqft: NSNumber?
    @NSManaged var category: Category?
    @NSManaged var location: Location?
    @NSManaged var status: Status?

}
