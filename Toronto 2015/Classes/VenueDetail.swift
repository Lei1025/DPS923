//
//  VenueDetail.swift
//  Toronto 2015
//
//  Created by Pedro Bellesa on 2015-03-11.
//  Copyright (c) 2015 School of ICT, Seneca College. All rights reserved.
//

import UIKit

class VenueDetail: UIViewController {
    
    // MARK: - Private Properties
    
    // Reference to passed Venue item.
    var detailItem: Venue!
    
    // MARK: - Outlets
    
    @IBOutlet weak var venueImage: UIImageView!
    @IBOutlet weak var venueName: UILabel!
    @IBOutlet weak var venueDescription: UITextView!
    @IBOutlet weak var venueLocation: UILabel!
    @IBOutlet weak var venueSports: UILabel!

    
    // MARK: - Controller Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Remove inset from ScrollView
        self.automaticallyAdjustsScrollViewInsets = false;
        
        venueImage.contentMode = UIViewContentMode.ScaleAspectFit
        
        venueImage.image = UIImage(data: detailItem.photo)
        venueName.text = self.detailItem.venueName
        
        // Set TextView to start at the top.
        venueDescription.scrollRangeToVisible(NSMakeRange(0, 0))
        venueDescription.text = self.detailItem.venueDescription
        
        venueLocation.text = self.detailItem.location
        
        // Clear placeholder text
        venueSports.text = ""
        
        // Add sports to view outlet.
        for s in self.detailItem.sports{
            let sport = s as Sport
            
            venueSports.text? += "\(sport.sportName) "
        }
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toVenueMap" {
            
            // Get a reference to the destination view controller
            let vc = segue.destinationViewController as VenueMap
            
            // Pass PDF with map to ViewController
            vc.mapData = detailItem.map
        }
    }
}