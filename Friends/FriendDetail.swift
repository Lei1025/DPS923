//
//  FriendDetail.swift
//  Friends
//
//  Created by Pedro Bellesa on 2015-02-12.
//  Copyright (c) 2015 School of ICT, Seneca College. All rights reserved.
//

import UIKit

class FriendDetail: UIViewController, EditItemDelegate {
    
    // MARK: - Properties
    var detailItem : Friend!
    var model: Model!
    
    // MARK: - Outlets
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var courseCode: UILabel!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var dateAdded: UILabel!
    
    
    // MARK: - Controller Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add Edit button to view.
        let editButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Edit, target: self, action: "edit")
        self.navigationItem.rightBarButtonItem = editButton
        
        let detailItemFriend = detailItem as Friend
        
        // Friend name
        name.text = detailItemFriend.friendName
        
        // Course
        courseCode.text = detailItemFriend.course
        
        // Phonen Number
        phoneNumber.text = "Phone: \(detailItemFriend.phone)"
        
        // Email
        email.text = detailItemFriend.email
        
        // Date Added
        let date = NSDateFormatter.localizedStringFromDate(detailItemFriend.dateAdded, dateStyle: NSDateFormatterStyle.LongStyle, timeStyle: NSDateFormatterStyle.NoStyle)
        dateAdded.text = "Added: \(date)"
        
    }
    
    // Reload data that was edited
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        name.text = detailItem.friendName
        courseCode.text = detailItem.course
        phoneNumber.text = detailItem.phone
        email.text = detailItem.email
        
        let date = NSDateFormatter.localizedStringFromDate(detailItem.dateAdded, dateStyle: NSDateFormatterStyle.LongStyle, timeStyle: NSDateFormatterStyle.NoStyle)
        dateAdded.text = String(format: "Added: \(date)")
    }
    
    // MARK: - Custom Methods
    
    func edit() {
        // Create Controller
        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("AddEditFriend") as FriendEdit
        
        
        // Configure Properties
        vc.title = "Edit"
        vc.model = self.model
        vc.friend = self.detailItem
        vc.delegate = self
        
        // Present Controller usign built in PUSH navigation
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    // MARK: - Protocol Implementation
    
    func editItemController(controller: AnyObject, didEditItem item: AnyObject?){
        self.model.saveChanges()
        
        // Pop Controller
        self.navigationController?.popViewControllerAnimated(true)
    }
}

