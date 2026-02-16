//
//  AddFleetViewController.swift
//  iTrack
//
//  Created by Taneja-Mac on 07/04/19.
//  Copyright © 2019 DHAVAL PANDIT. All rights reserved.
//

import UIKit

class AddFleetViewController: UIViewController {

    @IBOutlet weak var registrationNumberTextfield: UITextField!
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var companyTextfield: UITextField!
    @IBOutlet weak var modelTextfield: UITextField!
    @IBOutlet weak var chasisNumberTextfield: UITextField!
    @IBOutlet weak var engineNumberTextfield: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeView()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.registrationNumberTextfield.resignFirstResponder()
        self.nameTextfield.resignFirstResponder()
        self.companyTextfield.resignFirstResponder()
        self.modelTextfield.resignFirstResponder()
        self.chasisNumberTextfield.resignFirstResponder()
        self.engineNumberTextfield.resignFirstResponder()
    }
    
    fileprivate func initializeView() {
        
    }
    
    @IBAction func addButtonClicked(_ sender: Any) {
        (self.registrationNumberTextfield.text ?? "") != "" ? (self.nameTextfield.text ?? "") != "" ? (self.companyTextfield.text ?? "") != "" ? (self.modelTextfield.text ?? "") != "" ? self.addFleet() : Util.showAlert(self, message: "Please enter fleet model.") : Util.showAlert(self, message: "Please enter fleet company name.") : Util.showAlert(self, message: "Please enter name") : Util.showAlert(self, message: "Please enter registration number")
    }
    
    fileprivate func addFleet() {
        Loader.shared.start("Adding Fleet...")
        let fleet = Fleet(dictionary: [:])
        fleet.registration_number = self.registrationNumberTextfield.text!
        fleet.company = self.companyTextfield.text!
        fleet.name = self.nameTextfield.text!
        fleet.fleet_model = self.modelTextfield.text!
        fleet.chassis_number = self.chasisNumberTextfield.text
        fleet.engine_number = self.engineNumberTextfield.text
        fleet.agency = Constants.DATA.AGENCIES?[0]._id
        ModelFactory.fleets().add(fleet) { (error:NSError?, result:Any?) in
            Loader.shared.stop()
            let fleetDic = result as? [String:Any] ?? [String:Any]()
            let fleet = Fleet(dictionary: fleetDic)
            fleet._id != nil ? self.popViewController() : Util.showAlert(self, message: "Unable to add fleet right now. Please try again later.")
        }
    }
    
    fileprivate func popViewController() {
        self.navigationController?.popViewController(animated: true)
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
