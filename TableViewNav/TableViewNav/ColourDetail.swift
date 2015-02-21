//
//  ColourDetail.swift
//  TableViewNav
//
//  Created by Pedro Bellesa on 2015-01-29.
//  Copyright (c) 2015 Pedro Bellesa. All rights reserved.
//

import UIKit

class ColourDetail: UIViewController {

    @IBOutlet weak var colourName: UILabel!
    
    var itemDetail : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colourName.text = itemDetail
        title = "\(itemDetail) Info"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        
//
//    }
    

}
