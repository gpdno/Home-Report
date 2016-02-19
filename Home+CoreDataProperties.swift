//
//  Home+CoreDataProperties.swift
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

extension Home {

    @NSManaged var price: NSNumber?
    @NSManaged var image: NSData?
    @NSManaged var sqft: NSNumber?
    @NSManaged var bed: NSNumber?
    @NSManaged var bath: NSNumber?
    @NSManaged var county: String?
    @NSManaged var catagory: NSManagedObject?
    @NSManaged var location: Location?
    @NSManaged var status: Status?

}
