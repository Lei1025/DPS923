//
//  PlayerDetail.swift
//  QB Stats
//
//  Created by Pedro Bellesa on 2015-01-29.
//  Copyright (c) 2015 Pedro Bellesa. All rights reserved.
//

import UIKit

class PlayerDetail: UIViewController {
    
    // MARK: Properties
    
    var player : Dictionary<String, AnyObject>!
    
    // MARK: User Interfaces
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var teamRating: UILabel!
    @IBOutlet weak var completions: UILabel!
    @IBOutlet weak var yards: UILabel!
    @IBOutlet weak var touchdowns: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Photo
        photo.image = UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource(title, ofType: "jpg")!)
        
        // First label
        
        let team = player["Team"] as String
        let rating = player["Rating"] as Double
        teamRating.text = "Team: \(team), Rating: \(rating)"
        
        // Second Label
        
        let completionsData = player["Completions"] as Int
        let attempts = player["Attempts"] as Int
        let percentage = Int(Double(completionsData) / Double(attempts) * 100)
        
        completions.text = "Completions: \(completionsData) / \(attempts), \(percentage)%"
        
        // Third Label
        
        let ypg = player["YardsPerGame"] as Int
        let ypc = player["YardsPerCompletion"] as Int
        
        yards.text = "Yards: \(ypg) per game, \(ypc) per comp."
        
        // Fourth LAbel
        
        let inter = player["Interceptions"] as Int
        let td = player["Touchdowns"] as Int
        let sacks = player["Sacks"] as Int
        
        touchdowns.text = "\(td) TD, \(inter) INT, \(sacks) Sacks"
        
    }


}
