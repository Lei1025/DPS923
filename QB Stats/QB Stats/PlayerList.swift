//
//  PlayerList.swift
//  QB Stats
//
//  Created by Pedro Bellesa on 2015-01-29.
//  Copyright (c) 2015 Pedro Bellesa. All rights reserved.
//

import UIKit

class PlayerList: UITableViewController {
    
    // MARK: Properties
    
    var model: Model!
    
    // MARK: View Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()


    }


    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.players.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...
        let player = model.players[indexPath.row] as? Dictionary<String, AnyObject>
        
        let playerName = player!["Player"] as? String
        let teamName = player!["Team"] as? String
        
        cell.imageView?.image = UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource(teamName, ofType: "png")!)
        
        cell.textLabel?.text = playerName
        
        return cell
    }




    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        if segue.identifier == "toPlayerDetail" {
            
            let vc = segue.destinationViewController as PlayerDetail
            
            let tableViewRowNumber = tableView.indexPathForSelectedRow()?.row
            
            let player = model.players[tableViewRowNumber!] as? Dictionary<String, AnyObject>
            
            vc.player = player
            
            vc.title = player!["Player"] as? String
        }
    }

}
