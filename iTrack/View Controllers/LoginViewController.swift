//
//  LoginViewController.swift
//  iTrack
//
//  Created by DHAVAL PANDIT on 13/03/19.
//  Copyright © 2019 DHAVAL PANDIT. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        let email = self.emailTextfield.text ?? ""
        let password = self.passwordTextfield.text ?? ""
        if(email != "" && password != "") {
            Loader.shared.start("Loggining...")
            ModelFactory.login(email: email, password: password).get(id: nil, params: [:]) { (error:NSError?, result:Any?) in
                Loader.shared.stop()
                let user = result as? User
                user?.error?.message == nil && user?._id != nil ? self.performSegue(withIdentifier: "LoginToMainVCSegue", sender: self ) : Util.showAlert(self, message: user?.error?.message ?? "Unable to login right now. Please try again later.")
            }
        }
        else {
            Util.showAlert(self, message: "Please enter credentials")
        }
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
