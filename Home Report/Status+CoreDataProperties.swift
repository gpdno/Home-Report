//
//  Status+CoreDataProperties.swift
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

extension Status {

    @NSManaged var isForSale: NSNumber?
    @NSManaged var home: Home?

}
