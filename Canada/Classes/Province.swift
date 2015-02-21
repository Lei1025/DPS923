//
//  Canada.swift
//  Canada
//
//  Created by Pedro Bellesa on 2015-02-11.
//  Copyright (c) 2015 School of ICT, Seneca College. All rights reserved.
//

import Foundation
import CoreData

class Province: NSManagedObject {
    
    // MARK: - Properties
    @NSManaged var provinceName: String
    @NSManaged var premierName: String
    @NSManaged var dateCreated: NSDate
    @NSManaged var areaInKm: NSNumber

}
