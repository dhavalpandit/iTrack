//
//  MenuTableViewController.swift
//  iTrack
//
//  Created by DHAVAL PANDIT on 02/10/18.
//  Copyright © 2018 DHAVAL PANDIT. All rights reserved.
//

import UIKit
import SideMenu

class MenuTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var profileImageView: UIImageView!
    let adminMenu = [
        ["name":"Agencies", "image": "agency", "segue":"MainToAgencies"],
        ["name":"Fleets", "image": "car", "segue":"MainToFleets"],
        ["name":"Drivers", "image": "driver", "segue":"MainToDrivers"],
        ["name":"Maintenance", "image": "maintenance", "segue":"MainToMaintenance"],
        ["name":"Fuel", "image": "fuel", "segue":"MainToFuel"],
        ["name":"Calculator", "image": "calculator", "segue":"MainToCalaculator"],
        ["name":"Location", "image": "location-icon", "segue":"MainToLocation"]
    ]
    let adminMenuItems = ["Agencies","Fleets","Drivers","Maintenance","Fuel","Calculator","Navigation","Location"]
    let segues = ["MainToAgencies", "MainToFleets", "MainToDrivers", "MainToMaintenance", "MainToFuel", "MainToCalaculator", "MainToNavigation", "MainToLocation"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.adminMenu.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuTableViewCell
        cell.setData(menuCell: self.adminMenu[indexPath.row])
//        cell?.textLabel?.text = self.adminMenuItems[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let menuCellData = self.adminMenu[indexPath.row]
        let segue = menuCellData["segue"] as! String
        self.performSegue(withIdentifier:segue, sender: self)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
