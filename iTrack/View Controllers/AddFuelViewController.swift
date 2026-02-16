//
//  AddFuelViewController.swift
//  iTrack
//
//  Created by Taneja-Mac on 22/04/19.
//  Copyright © 2019 DHAVAL PANDIT. All rights reserved.
//

import UIKit

class AddFuelViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var driverTextfield: UITextField!
    @IBOutlet weak var amountTextfield: UITextField!
    @IBOutlet weak var quantityTextfield: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    var drivers: [User]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initializeView()
        // Do any additional setup after loading the view.
    }
    
    fileprivate func initializeView() {
        self.initializeData()
    }
    
    fileprivate func initializeData() {
        Loader.shared.start("Fetching Drivers....")
        ModelFactory.users().query(params: ["type":"driver"], options: [:]) { (error:NSError?, result:Any?) in
            let resultUsers = result as? [User]
            self.drivers = resultUsers
            self.pickerView.reloadAllComponents()
            Loader.shared.stop()
        }
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        let isDriverTextfield = textField == driverTextfield
        self.pickerView.isHidden = !isDriverTextfield
        return !(isDriverTextfield)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.driverTextfield.resignFirstResponder()
        self.amountTextfield.resignFirstResponder()
        self.quantityTextfield.resignFirstResponder()
        self.pickerView.isHidden = true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.drivers?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.drivers?[component].name
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
