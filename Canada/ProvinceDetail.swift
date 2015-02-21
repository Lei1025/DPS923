//
//  ProvinceDetail.swift
//  Canada
//
//  Created by Pedro Bellesa on 2015-02-11.
//  Copyright (c) 2015 School of ICT, Seneca College. All rights reserved.
//

import UIKit

class ProvinceDetail: UIViewController {
    
    // MARK: - Properties
    var detailItem: Province!
    
    // MARK: - Outlets
    @IBOutlet weak var provinceName: UILabel!
    
    @IBOutlet weak var premierName: UILabel!
    
    @IBOutlet weak var areaKm: UILabel!
    
    @IBOutlet weak var confederationDate: UILabel!
    
    
    // MARK: - Controller Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Province Name
        provinceName.text = detailItem.provinceName
        
        // Premier
        premierName.text = "Premier: \(detailItem.premierName)"
        
        // Area
        areaKm.text = "Area in square km: \(detailItem.areaInKm.descriptionWithLocale(NSLocale.currentLocale()))"
        
        // Confederation Date
        let date = NSDateFormatter.localizedStringFromDate(detailItem.dateCreated, dateStyle: NSDateFormatterStyle.LongStyle, timeStyle: NSDateFormatterStyle.NoStyle)
        
        confederationDate.text = "Confederation: \(date)"

        
    }
}
