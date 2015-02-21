//
//  ViewController.swift
//  AllAboutMe
//
//  Created by Pedro Paulo Bellesa Silva on 2015-01-15.
//  Copyright (c) 2015 Pedro Paulo Bellesa Silva. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: View Lifycycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Preselect options with my current information.
        programSelector.selectedSegmentIndex = 1
        
        semesterSelector.selectedSegmentIndex = 2
        
        // Set initial values to text.
        updateTextField()
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Outlets
    
    @IBOutlet weak var allAboutMe: UITextView!

    @IBOutlet weak var programSelector: UISegmentedControl!
  
    @IBOutlet weak var semesterSelector: UISegmentedControl!
    
    @IBOutlet weak var gpaText: UITextField!
    
    @IBOutlet weak var gpaSlider: UISlider!
    
    // MARK: Actions
    
    @IBAction func programChanged(sender: UISegmentedControl) {
        
        // CPA Selected
        if(programSelector.selectedSegmentIndex == 0){
            // Change max semester.
            if(semesterSelector.selectedSegmentIndex >= 3){
                semesterSelector.selectedSegmentIndex = 2
            }
            // Disable semester 7 and 8
            semesterSelector.setEnabled(false, forSegmentAtIndex: 3)
            semesterSelector.setEnabled(false, forSegmentAtIndex: 4)
            
        }
        else{
            semesterSelector.setEnabled(true, forSegmentAtIndex: 3)
            semesterSelector.setEnabled(true, forSegmentAtIndex: 4)
        }
        updateTextField()
    }
    
    @IBAction func semesterChanged(sender: UISegmentedControl) {
        updateTextField()
    }
    
    @IBAction func sliderChanged(sender: UISlider) {
        updateTextField()
    }
    
    @IBAction func gpaTextChanged(sender: UITextField) {
        
        gpaSlider.value = (gpaText.text as NSString).floatValue
        
        if(gpaSlider.value < 2.0){
            gpaSlider.value = 2.0
        }
        else if(gpaSlider.value > 4.0){
            gpaSlider.value = 4.0
        }
        updateTextField()
    }
    
    // MARK: App Logic
    func updateTextField(){
        
        let program = (programSelector.selectedSegmentIndex == 0) ? "CPA" : "BSD"
        let semester = semesterSelector.selectedSegmentIndex + 4
        
        gpaText.text = String(format: "%1.2f", gpaSlider.value)
        
        allAboutMe.text = "I am in the semester \(semester) of the \(program), and my GPA is \(gpaText.text)."
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
}

