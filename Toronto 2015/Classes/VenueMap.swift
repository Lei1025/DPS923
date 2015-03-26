//
//  VenueMap.swift
//  Toronto 2015
//
//  Created by Pedro Bellesa on 2015-03-23.
//  Copyright (c) 2015 School of ICT, Seneca College. All rights reserved.
//

import UIKit

class VenueMap: UIViewController {
    
    // Variable to hold passed in PDF data
    var mapData: NSData!
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Load PDF data to WebView
        webView.loadData(mapData, MIMEType: "application/pdf", textEncodingName: "UTF-8", baseURL: nil)
    }

}
