//
//  AppDelegate.swift
//  Home Report
//
//  Created by Andi Setiyadi on 12/13/15.
//  Copyright © 2015 PFI. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.

        checkDataStore()
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    func checkDataStore() {
        let coreData = CoreData()
        let request = NSFetchRequest(entityName: "Home")

        let homeCount = coreData.managedObjectContext.countForFetchRequest(request, error: NSErrorPointer.init())
        if homeCount == 0 {
            uploadSampleData()
        }
    }
    
    func uploadSampleData() {
        let coreData = CoreData()
        
        let url = NSBundle.mainBundle().URLForResource("sample", withExtension: "json")
        let data = NSData(contentsOfURL: url!)
        
        do {
            let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
            let jsonArray = jsonResult.valueForKey("home") as! NSArray
            
            for json in jsonArray {
                let home = NSEntityDescription.insertNewObjectForEntityForName("Home", inManagedObjectContext: coreData.managedObjectContext) as! Home
                home.county = json["county"] as? String
                home.price = json["price"] as? NSNumber
                home.bed = json["bed"] as? NSNumber
                home.bath = json["bath"] as? NSNumber
                home.sqft = json["sqft"] as? NSNumber

                let category = NSEntityDescription.insertNewObjectForEntityForName("Category", inManagedObjectContext: coreData.managedObjectContext) as! Category
                category.homeType = (json["category"] as! NSDictionary)["homeType"] as? String
                home.category = category
                
                let status = NSEntityDescription.insertNewObjectForEntityForName("Status", inManagedObjectContext: coreData.managedObjectContext) as! Status
                let isForSale = (json["status"] as! NSDictionary)["isForSale"] as! Bool
                status.isForSale =  NSNumber(bool: isForSale)
                home.status = status
                
                let imageName = json["image"] as? String
                let image = UIImage(named: imageName!)
                let imageData = UIImageJPEGRepresentation(image!, 1)
                
                home.image = imageData
            }
            
            coreData.saveContext()
            
            let request = NSFetchRequest(entityName: "Home")
            let homeCount = coreData.managedObjectContext.countForFetchRequest(request, error: NSErrorPointer.init())
            print("Total home: \(homeCount)")
        }
        catch {
            fatalError("Cannot upload sample data")
        }
    }
}

