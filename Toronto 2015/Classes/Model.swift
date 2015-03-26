//
//  Model.swift
//  Classes
//
//  Created by Peter McIntyre on 2015-02-01.
//  Copyright (c) 2015 School of ICT, Seneca College. All rights reserved.
//

import CoreData

class Model {

    // MARK: - Private properties
    
    private var cdStack: CDStack!
    
    lazy private var applicationDocumentsDirectory: NSURL = {
        
        return NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0] as NSURL
        }()
    
    // MARK: - Public properties
    
    lazy var frc_example: NSFetchedResultsController = {
        
        // Use this as a template to create other fetched results controllers
        let frc = self.cdStack.frcForEntityNamed("Example", withPredicateFormat: nil, predicateObject: nil, sortDescriptors: "attribute1,true", andSectionNameKeyPath: nil)
        
        return frc
    }()
    
    lazy var frc_sport: NSFetchedResultsController = {
        
        // Use this as a template to create other fetched results controllers
        let frc = self.cdStack.frcForEntityNamed("Sport", withPredicateFormat: nil, predicateObject: nil, sortDescriptors: "sportName,true", andSectionNameKeyPath: nil)
        
        return frc
    }()
    
    lazy var frc_venue: NSFetchedResultsController = {
        
        // Use this as a template to create other fetched results controllers
        let frc = self.cdStack.frcForEntityNamed("Venue", withPredicateFormat: nil, predicateObject: nil, sortDescriptors: "venueName,true", andSectionNameKeyPath: nil)
        
        return frc
        }()

    // MARK: - Data from the network
    
    
    // Method to fetch the collection
    func collectionGet() -> [AnyObject] {
        
        // Create, configure, and execute a web service request
        let request = WebServiceRequest()
        request.sendRequestToUrlPath("/path/to/resource", forDataKeyName: "Collection", from: self, propertyNamed: "collection")
        
        // Return an empty array; when the request completes, a notification will be sent
        return [AnyObject]()
    }
    func executeFetchRequest(fetchRequest fr: NSFetchRequest) -> [AnyObject] {
        
        // Prepare an error object
        var error: NSError? = nil
        
        var results = cdStack.managedObjectContext?.executeFetchRequest(fr, error: &error)
        
        if let error = error {
            print("Fetch request error")
            results = []
        }
        
        return results!
    }
    

    // The next two properties may - or may not - survive the final version of the
    
    // Interim; may be changed
    lazy var networkCollection: [AnyObject] = {
        
        // Placeholder
        return ["hello", "world"]
    }()
    
    // Interim; may be changed
    lazy var networkObject: AnyObject = {
        
        // Placeholder
        return "hello"
    }()
    
    // MARK: - Public methods
    
    init() {
        
        // Check whether the app is being launched for the first time
        // If yes, check if there's an object store file in the app bundle
        // If yes, copy the object store file to the Documents directory
        // If no, create some new data if you need to

        // URL to the object store file in the app bundle
        let storeFileInBundle: NSURL? = NSBundle.mainBundle().URLForResource("ObjectStore", withExtension: "sqlite")

        // URL to the object store file in the Documents directory
        let storeFileInDocumentsDirectory: NSURL = applicationDocumentsDirectory.URLByAppendingPathComponent("ObjectStore.sqlite")

        // System file manager
        let fs: NSFileManager = NSFileManager()
        
        // Check whether this is the first launch of the app
        let isFirstLaunch: Bool = !fs.fileExistsAtPath(storeFileInDocumentsDirectory.path!)
        
        // Check whether the app is supplied with starter data in the app bundle
        let hasStarterData: Bool = storeFileInBundle != nil
        
        if isFirstLaunch {
            
            if hasStarterData {
                
                // Use the supplied starter data
                fs.copyItemAtURL(storeFileInBundle!, toURL: storeFileInDocumentsDirectory, error: nil)
                // Initialize the Core Data stack
                cdStack = CDStack()
                
            } else {
                
                // Initialize the Core Data stack before creating new data
                cdStack = CDStack()
                // Create some new data
                StoreInitializer.create(cdStack)
            }
            
        } else {
            
            // This app has been used/started before, so initialize the Core Data stack
            cdStack = CDStack()
        }
    }
    
    // Generic 'add new' method
    func addNew(entityName: String) -> AnyObject {
        
        return NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: cdStack.managedObjectContext!) as NSManagedObject
    }

    func saveChanges() { cdStack.saveContext() }
    
    // Add more methods here for data maintenance
    // For example, get-all, get-some, get-one, add, update, delete
    // And other command-oriented operations

}
