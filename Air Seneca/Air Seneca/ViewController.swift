//
//  ViewController.swift
//  Air Seneca
//
//  Created by Pedro Bellesa on 2015-01-22.
//  Copyright (c) 2015 Pedro Bellesa. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var initialFlight = 0
        
        flightSelector.selectedSegmentIndex = initialFlight
        
        model.generatePickerRowsForFlight(initialFlight)
        
        // Clear labels
        ticketSelected.text = ""
        ticketBoughtMessage.text = ""
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: Outlets
    
    @IBOutlet weak var flightSelector: UISegmentedControl!
    
    @IBOutlet weak var ticketQuantitySelector: UIPickerView!
    
    @IBOutlet weak var ticketSelected: UILabel!
    
    @IBOutlet weak var buyTicket: UIButton!
    
    @IBOutlet weak var ticketBoughtMessage: UILabel!
    
    // MARK: Actions
    @IBAction func flightNumberChanged(sender: UISegmentedControl) {
        
        model.generatePickerRowsForFlight(flightSelector.selectedSegmentIndex)
        ticketQuantitySelector.reloadAllComponents()
        ticketQuantitySelector.selectRow(0, inComponent: 0, animated: true)
        ticketSelected.text = ""
    }
    
    
    @IBAction func buyTicketBought(sender: UIButton) {
        // Retrieve number of tickets
        let quantity = ticketQuantitySelector.selectedRowInComponent(0)
       
        if(quantity != 0){
            // Retrieve selected flight
            let flightNumber = flightSelector.selectedSegmentIndex
            
            // Retrieve destination name
            var flight : String! = flightSelector.titleForSegmentAtIndex(flightNumber)
            
            // Retrieve ticket string
            let ticketMessage = model.pickerRows[quantity]
            
            // Compose message
            ticketBoughtMessage.text = "Sold \(flight): \(ticketMessage)"
            
            // Reduce number of available tickets
            model.buyTickets(quantity, flightNumber: flightNumber)
            
            // Regenerate PicketRows
            model.generatePickerRowsForFlight(flightNumber)
            
        
            ticketQuantitySelector.reloadAllComponents()
            
            ticketQuantitySelector.selectRow(0, inComponent: 0, animated: true)
            
            ticketSelected.text = ""
        }
        else{
            ticketBoughtMessage.text = "No Sale"
        }
        
    }
    // MARK: Delegate Methods
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return model.pickerRows.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return model.pickerRows[row]
    }

    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        ticketSelected.text = model.pickerRows[row]
    }
}

