//
//  AddDriverViewController.swift
//  iTrack
//
//  Created by Taneja-Mac on 07/04/19.
//  Copyright © 2019 DHAVAL PANDIT. All rights reserved.
//

import UIKit

class AddDriverViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var nameTextfield: UITextField!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var agencyTextfield: UITextField!
    @IBOutlet weak var agencyPickerView: UIPickerView!
    @IBOutlet weak var mobileNumberTextfield: UITextField!
    @IBOutlet weak var agencyLabel: UILabel!
    
    var selectedAgency: Agency?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.nameTextfield.resignFirstResponder()
        self.emailTextfield.resignFirstResponder()
        self.mobileNumberTextfield.resignFirstResponder()
        self.agencyPickerView.isHidden = true
    }
//    Textfield Delegate
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let isAgencyTextField = textField == self.agencyTextfield
        isAgencyTextField ? self.showAgencyPickerView() : self.hideAgencyPickerView()
        return !isAgencyTextField
    }
    
    fileprivate func hideAgencyPickerView() {
        self.agencyPickerView.isHidden = true
    }
    
    fileprivate func showAgencyPickerView() {
        self.agencyPickerView.isHidden = false
        self.nameTextfield.resignFirstResponder()
        self.mobileNumberTextfield.resignFirstResponder()
        self.emailTextfield.resignFirstResponder()
    }
    
    @IBAction func addDriverButtonClicked(_ sender: Any) {
        (self.nameTextfield.text ?? "") != "" ? Util.isValidEmail(testStr: self.emailTextfield.text ?? "") ? (self.mobileNumberTextfield.text ?? "") != "" ? self.addDriver() : Util.showAlert(self, message: "Pleae enter a valid mobile number") : Util.showAlert(self, message: "Pleae enter a valid email address") : Util.showAlert(self, message: "Please enter a valid name")
    }
    
    fileprivate func addDriver() {
        Loader.shared.start("Creating Driver...")
        let driverUser = User(dictionary: [:])
        driverUser.name = self.nameTextfield.text!
        driverUser.email = self.emailTextfield.text!
        driverUser.mobile = self.mobileNumberTextfield.text!
        driverUser.agency = self.selectedAgency?._id
        driverUser.type = "driver"
        ModelFactory.users().add(driverUser) { (error:NSError?, result:Any?) in
            Loader.shared.stop()
            let userDic = result as? [String:Any] ?? [String:Any]()
            let user = User(dictionary: userDic)
            user.error?.message == nil && user._id != nil ? self.popViewController() : Util.showAlert(self, message: user.error?.message ?? "Unable to create driver right now. Please try again later.")
        }
    }
    
    fileprivate func popViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    
//    Picker View Datasource
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Constants.DATA.AGENCIES?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Constants.DATA.AGENCIES?[component].name
    }
    
//    Picker View Delegate
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.selectedAgency = Constants.DATA.AGENCIES?[component]
        self.agencyTextfield.text = self.selectedAgency?.name
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
