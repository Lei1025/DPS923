//
//  SportDetail.swift
//  Toronto 2015
//
//  Created by Pedro Bellesa on 2015-03-11.
//  Copyright (c) 2015 School of ICT, Seneca College. All rights reserved.
//

import UIKit

class SportDetail: UIViewController {
    
    // MARK: - Private Properties
    
    // Reference to passed Sport item.
    var detailItem: Sport!
    
    // MARK: - Outlets
    
    @IBOutlet weak var sportImage: UIImageView!
    @IBOutlet weak var sportName: UILabel!
    @IBOutlet weak var sportDescription: UITextView!
    @IBOutlet weak var sportHowItWorks: UITextView!
    @IBOutlet weak var sportHistory: UITextView!
    @IBOutlet weak var sportVenueNames: UILabel!
    
    // MARK: - Controller Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Remove inset space from scroll view
        self.automaticallyAdjustsScrollViewInsets = false;
        
        sportImage.contentMode = UIViewContentMode.ScaleAspectFit
        sportImage.image = UIImage(data: detailItem.photo)
        
        sportName.text = self.detailItem.sportName
        
        // Set starting point of TextView to the top.
        sportDescription.scrollRangeToVisible(NSMakeRange(0, 0))
        sportDescription.text = self.detailItem.sportDescription
        
        sportHistory.scrollRangeToVisible(NSMakeRange(0, 0))
        sportHistory.text = self.detailItem.history
        
        sportHowItWorks.scrollRangeToVisible(NSMakeRange(0, 0))
        sportHowItWorks.text = self.detailItem.howItWorks
        
        // Clear placeholder text
        sportVenueNames.text = ""
        
        // Add Venues to view outlet
        for v in self.detailItem.venues{
            let venue = v as Venue
            
            sportVenueNames.text? += "\(venue.venueName) \n"
        }


    }


}
