//
//  FriendEdit.swift
//  Friends
//
//  Created by Pedro Bellesa on 2015-02-12.
//  Copyright (c) 2015 School of ICT, Seneca College. All rights reserved.
//

import UIKit

class FriendEdit: UIViewController, UITextFieldDelegate {

    // MARK: - Private Properties
    var delegate : EditItemDelegate?
    var model: Model!
    var detailItem: Friend?
    var friend : Friend?
    
    // MARK: - Outlets
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var course: UITextField!
    @IBOutlet weak var phone: UITextField!
    @IBOutlet weak var email: UITextField!
    
    // MARK: - Controller Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        // Initialize UI Fields if Friend exists
        if let f = friend{
            name.text = f.friendName
            course.text = f.course
            phone.text = f.phone
            email.text = f.email
        }
    }

    
    // MARK: - Actions
    
    // Handle "Save" button behaviour
    @IBAction func save(sender: UIBarButtonItem) {
        
        // Add new object to the context and get a reference

        if friend == nil {
            friend = model.addNew("Friend") as? Friend
        }
        friend?.friendName = name.text
        friend?.course = course.text
        friend?.phone = phone.text
        friend?.email = email.text
        friend?.dateAdded = NSDate()
        
        // Call back to the delegate and send new item
        delegate?.editItemController(self, didEditItem: friend)
        
    }
    
    // Handle "Cancel" button behaviour
    @IBAction func cancel(sender: UIBarButtonItem) {
        // Call back to delegate with no item.
        delegate?.editItemController(self, didEditItem: nil)
    }
    
    // MARK: - UITextField Methods
    // Handle Return button in TextField
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Activate next text field until reaching last
        switch textField {
        case name:
            course.becomeFirstResponder()
        case course:
            phone.becomeFirstResponder()
        case phone:
            email.becomeFirstResponder()
        case email:
            email.resignFirstResponder()
        default:
            textField.resignFirstResponder()
        }
        
        return true
    }

}
// MARK: - Protocol
protocol EditItemDelegate {
    func editItemController(controller: AnyObject, didEditItem item: AnyObject?)
}


