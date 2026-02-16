//
//  FleetTableViewController.swift
//  iTrack
//
//  Created by DHAVAL PANDIT on 20/09/18.
//  Copyright © 2018 DHAVAL PANDIT. All rights reserved.
//

import UIKit

class FleetTableViewController: UITableViewController {

    var fleets: [Fleet]?
    
    override func viewDidAppear(_ animated: Bool) {
        self.fetchFleets()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeView()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    fileprivate func initializeView() {
        self.initializeAddButton()
        Loader.shared.start("Fetching...")
        self.fetchFleets()
    }
    
    fileprivate func fetchFleets() {
        ModelFactory.fleets().query { (error:NSError?, result:Any?) in
            let resultArray = result as? [Fleet]
            self.fleets = resultArray
            self.tableView.reloadData()
            Loader.shared.stop()
        }
    }
    
    fileprivate func initializeAddButton() {
        let barButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAgencyButtonClicked))
        self.navigationItem.rightBarButtonItems = [barButton]
    }
    
    @objc func addAgencyButtonClicked() {
        self.performSegue(withIdentifier: "ListToAddFleetView", sender: self)
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100.0)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.fleets?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FleetCell") as! FleetTableViewCell
        cell.setData(self.fleets?[indexPath.row])
        return cell
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
