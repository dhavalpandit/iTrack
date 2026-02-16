//
//  AgenciesViewController.swift
//  iTrack
//
//  Created by DHAVAL PANDIT on 31/03/19.
//  Copyright © 2019 DHAVAL PANDIT. All rights reserved.
//

import UIKit

class AgenciesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var agencies: [Agency]? = Constants.DATA.AGENCIES
    
    override func viewDidAppear(_ animated: Bool) {
        self.fetchAgencies()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeView()
        // Do any additional setup after loading the view.
    }
    
    fileprivate func initializeView() {
        self.initializeAddButton()
        Loader.shared.start("Fetching...")
        self.fetchAgencies()
    }
    
    fileprivate func fetchAgencies() {
        ModelFactory.agency().query { (error:NSError?, result:Any?) in
            let resultArray = result as? [Agency]
            self.agencies = resultArray
            self.tableView.reloadData()
            Loader.shared.stop()
        }
    }
    
    fileprivate func initializeAddButton() {
        let barButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addAgencyButtonClicked))
        self.navigationItem.rightBarButtonItems = [barButton]
    }
    
    @objc func addAgencyButtonClicked() {
        self.performSegue(withIdentifier: "ListToAddAgencyView", sender: self)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(95.0)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.agencies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AgencyCell") as! AgencyTableViewCell
        cell.setData(self.agencies?[indexPath.row])
        return cell
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
