//
//  Venue.swift
//  Toronto 2015
//
//  Created by Pedro Bellesa on 2015-03-12.
//  Copyright (c) 2015 School of ICT, Seneca College. All rights reserved.
//

import Foundation
import CoreData

class Venue: NSManagedObject {

    @NSManaged var hostId: NSNumber
    @NSManaged var location: String
    @NSManaged var map: NSData
    @NSManaged var photo: NSData
    @NSManaged var venueDescription: String
    @NSManaged var venueName: String
    @NSManaged var sports: NSSet

}