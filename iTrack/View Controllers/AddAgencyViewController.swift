//
//  AddAgencyViewController.swift
//  iTrack
//
//  Created by Taneja-Mac on 07/04/19.
//  Copyright © 2019 DHAVAL PANDIT. All rights reserved.
//

import UIKit

class AddAgencyViewController: UIViewController {

    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var addressTextfield: UITextField!
    @IBOutlet weak var gstNumberTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeView()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.nameTextfield.resignFirstResponder()
        self.addressTextfield.resignFirstResponder()
        self.gstNumberTextfield.resignFirstResponder()
    }
    
    fileprivate func initializeView() {
        
    }
    
    @IBAction func createButtonClicked(_ sender: Any) {
        (self.nameTextfield.text ?? "") != "" ? (self.addressTextfield.text ?? "") != "" ? (self.gstNumberTextfield.text ?? "") != "" ? self.addAgency() : Util.showAlert(self, message: "Please enter agency GST number.") : Util.showAlert(self, message: "Please enter agency address.") : Util.showAlert(self, message: "Please enter agency name.")
    }
    
    fileprivate func addAgency() {
        Loader.shared.start("Adding Agency...")
        let agency = Agency(dictionary: [:])
        agency.name = self.nameTextfield.text!
        agency.address = self.addressTextfield.text!
        agency.gstin = self.gstNumberTextfield.text!
        
        ModelFactory.agency().add(agency) { (error:NSError?, result:Any?) in
            Loader.shared.stop()
            let agencyDic = result as? [String:Any] ?? [String:Any]()
            let dbAgecny = Agency(dictionary: agencyDic)
            dbAgecny._id != nil ? self.popViewController() : Util.showAlert(self, message: "Unable to add agency right now. Please try again later.")
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
