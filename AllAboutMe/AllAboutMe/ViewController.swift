//
//  ViewController.swift
//  AllAboutMe
//
//  Created by Pedro Paulo Bellesa Silva on 2015-01-15.
//  Copyright (c) 2015 Pedro Paulo Bellesa Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var allAboutMe: UITextView!

    @IBOutlet weak var programSelector: UISegmentedControl!
    
    @IBOutlet weak var semesterSelector: UISegmentedControl!
    
    @IBAction func programChanged(sender: UISegmentedControl) {
    }
    
    @IBAction func semesterChanged(sender: UISegmentedControl) {
    }
    
    
}

