//
//  PlaceSearchController.swift
//  iTrack
//
//  Created by Taneja-Mac on 14/04/19.
//  Copyright © 2019 DHAVAL PANDIT. All rights reserved.
//

import UIKit

protocol PlaceSearchControllerDelegate: class {
    func placeSearchController(_ placeSearchController: PlaceSearchController, didSelectPlace place: Place)
    func placeSearchControllerHeightForRow() -> CGFloat
}

class PlaceSearchController: UITableViewController {
    
    var places: [Place] = [Place](){
        didSet{
            self.tableView.reloadData()
        }
    }
    weak var delegate: PlaceSearchControllerDelegate?
    var parentTableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    fileprivate func configureTableView(){
        let nib = UINib(nibName: "PlaceSearchCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "PlaceSearchCell")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return places.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //        let nib = UINib(nibName: "PlaceSearchCell", bundle: nil)
        //        tableView.registerNib(nib, forCellReuseIdentifier: "PlaceSearchCell")
        
        let placeCellIdentifier = "placeSearchCell"
        var cell:UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: placeCellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: placeCellIdentifier)
            
        }
        
        cell?.textLabel?.text = places[(indexPath as NSIndexPath).row].description
        
        //        cell.setData(places[indexPath.row])
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.delegate?.placeSearchController(self, didSelectPlace: self.places[(indexPath as NSIndexPath).row])
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.delegate?.placeSearchControllerHeightForRow() ?? 10.00
    }
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
