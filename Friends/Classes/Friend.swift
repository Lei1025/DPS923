//
//  Friend.swift
//  Friends
//
//  Created by Pedro Bellesa on 2015-02-12.
//  Copyright (c) 2015 School of ICT, Seneca College. All rights reserved.
//

import Foundation
import CoreData

class Friend: NSManagedObject {

    @NSManaged var friendName: String
    @NSManaged var course: String
    @NSManaged var phone: String
    @NSManaged var email: String
    @NSManaged var dateAdded: NSDate

}
