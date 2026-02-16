//
//  MainViewController.swift
//  iTrack
//
//  Created by DHAVAL PANDIT on 05/10/18.
//  Copyright © 2018 DHAVAL PANDIT. All rights reserved.
//

import UIKit
import SideMenu
import GoogleMaps

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeView()
        // Do any additional setup after loading the view.
    }
    
    fileprivate func initializeView() {
        self.initializeData()
    }
    
    fileprivate func initializeData() {
        Loader.shared.start("Loading...")
        ModelFactory.agency().query { (error:NSError?, result:Any?) in
            let resultArray = result as? [Agency]
            Constants.DATA.AGENCIES = resultArray
            Loader.shared.stop()
        }
    }
    
    @IBAction func agenciesButtonClicked(_ sender: Any) {
        self.performSegue(withIdentifier:"DashboardToAgencies", sender: self)
    }
    
    @IBAction func driversButtonClicked(_ sender: Any) {
        self.performSegue(withIdentifier:"DashboardToDrivers", sender: self)
    }
    
    
    @IBAction func fleetsButtonClicked(_ sender: Any) {
        self.performSegue(withIdentifier:"DashboardToFleets", sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
