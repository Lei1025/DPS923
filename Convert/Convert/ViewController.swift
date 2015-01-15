//
//  ViewController.swift
//  Convert
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

    @IBOutlet weak var userInput: UITextField!

    @IBOutlet weak var results: UILabel!
    
    @IBAction func convertNumber(sender: UIButton) {
        
        var num = (userInput.text as NSString).doubleValue
        
        num = (num * 2) + 29.2131
        
        results.text = String(format: "%1.3f", num)
        
        userInput.text = ""
        
        userInput.resignFirstResponder()
    }
}

