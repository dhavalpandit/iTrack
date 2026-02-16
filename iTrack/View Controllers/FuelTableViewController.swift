//
//  FuelTableViewController.swift
//  iTrack
//
//  Created by DHAVAL PANDIT on 05/10/18.
//  Copyright © 2018 DHAVAL PANDIT. All rights reserved.
//

import UIKit

class FuelTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var fuel: [Fuel]?
    
    override func viewWillAppear(_ animated: Bool) {
        self.fetchData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initailizeView()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    fileprivate func initailizeView() {
        self.initializeAddButton()
        self.fetchData()
        Loader.shared.start("Fetching...")
    }
    
    fileprivate func fetchData() {
        ModelFactory.fuel().query { (error:NSError?, result:Any?) in
            let resultArray = result as? [Fuel]
            self.fuel = resultArray
            self.tableView.reloadData()
            Loader.shared.stop()
        }
    }
    
    fileprivate func initializeAddButton() {
        let barButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addFuelButtonClicked))
        self.navigationItem.rightBarButtonItems = [barButton]
    }
    
    @objc func addFuelButtonClicked() {
        self.performSegue(withIdentifier: "ListToAddFuelView", sender: self)
    }

    // MARK: - Table view data source

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.fuel?.count ?? 0
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FuelCell") as! FuelTableViewCell
        cell.setData(self.fuel?[indexPath.row])
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
