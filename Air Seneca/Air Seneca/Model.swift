//
//  Model.swift
//  Air Seneca
//
//  Created by Pedro Bellesa on 2015-01-22.
//  Copyright (c) 2015 Pedro Bellesa. All rights reserved.
//

import Foundation

class Model {
    
    // MARK: Properties
    
    var ticketCost: [Double] = [110.5, 122.7, 147.35, 168.25]
    
    var seatsAvailable: [Int] = [40, 40, 40, 40]
    
    var pickerRows: [String] = []
    
    // MARK: Functions
    
    func buyTickets(numberOfTickets: Int, flightNumber: Int){
        seatsAvailable[flightNumber] -= numberOfTickets
    }
    
    func generatePickerRowsForFlight(flightNumber: Int){
        
        pickerRows = []
        
        let price = ticketCost[flightNumber]
        
        let priceString = String(format: "%1.2f", price)
        
        for var i = 0; i <= seatsAvailable[flightNumber]; i++ {
            pickerRows.append("\(i) x $\(priceString) = " + String(format: "%1.2f", price * Double(i)) )
        }
    }
    
}