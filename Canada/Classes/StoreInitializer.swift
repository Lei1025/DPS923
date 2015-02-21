//
//  StoreInitializer.swift
//  Classes
//
//  Created by Peter McIntyre on 2015-02-01.
//  Copyright (c) 2015 School of ICT, Seneca College. All rights reserved.
//

import CoreData

class StoreInitializer {
    
    class func create(cdStack: CDStack) {
        
        // New Brunswick
        let nb = NSEntityDescription.insertNewObjectForEntityForName("Province", inManagedObjectContext: cdStack.managedObjectContext!) as Province
        
        nb.provinceName = "New Brunswick"
        nb.premierName = "Brian Gallant"
        nb.areaInKm = 72908
        nb.dateCreated = newDate(1867, month: 7, day: 1)!
        
        
        // Ontario
        let on = NSEntityDescription.insertNewObjectForEntityForName("Province", inManagedObjectContext: cdStack.managedObjectContext!) as Province
        
        on.provinceName = "Ontario"
        on.premierName = "Kathleen Wynne"
        on.areaInKm = 1076395
        on.dateCreated = newDate(1867, month: 7, day: 1)!
        
        
        // Quebec
        let qc = NSEntityDescription.insertNewObjectForEntityForName("Province", inManagedObjectContext: cdStack.managedObjectContext!) as Province
        
        qc.provinceName = "Quebec"
        qc.premierName = "Philippe Couillard"
        qc.areaInKm = 1542056
        qc.dateCreated = newDate(1867, month: 7, day: 1)!
        
        // Save to CoreData
        cdStack.saveContext()
    }
    
    // Create a new date object
    class func newDate(year: Int, month: Int, day: Int) -> NSDate? {
        
        // Configure the objects we need to create the date
        var c: NSCalendar? = NSCalendar(identifier: NSGregorianCalendar)
        var dc: NSDateComponents = NSDateComponents()
        
        // Set the values of the date components
        dc.year = year
        dc.month = month
        dc.day = day
        dc.hour = 0
        dc.minute = 0
        dc.second = 0
        
        return c?.dateFromComponents(dc)
    }
    
}
