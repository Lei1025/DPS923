//
//  Launch.swift
//  Toronto 2015
//
//  Created by Pedro Bellesa on 2015-03-11.
//  Copyright (c) 2015 School of ICT, Seneca College. All rights reserved.
//

import UIKit

class Launch: UIViewController {
    
    // Passed in by the app delegate during app initialization
    var model: Model!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toSportList" {
            
            let vc = segue.destinationViewController as SportList
            
            vc.model = model;
        }
        if segue.identifier == "toVenueList" {
            let vc = segue.destinationViewController as VenueList
        }
    }


}
