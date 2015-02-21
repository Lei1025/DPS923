//
//  Model.swift
//  QB Stats
//
//  Created by Pedro Bellesa on 2015-02-05.
//  Copyright (c) 2015 Pedro Bellesa. All rights reserved.
//

import Foundation

class Model {
    var players : [AnyObject]!
    
    init(){
        let path = NSBundle.mainBundle().URLForResource("stats2014qb", withExtension: "plist")
        
        players = NSArray(contentsOfURL: path!)
    }
}