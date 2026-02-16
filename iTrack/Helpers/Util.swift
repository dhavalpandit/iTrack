//
//  Util.swift
//  iTrack
//
//  Created by Taneja-Mac on 07/04/19.
//  Copyright © 2019 DHAVAL PANDIT. All rights reserved.
//

import Foundation
import UIKit

class Util {
    static func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    
    static func showAlert(_ vc: UIViewController,message: String) {
        let alertviewcont = UIAlertController(title: "iTrack Application", message: message, preferredStyle: .alert )
        let dismissAction = UIAlertAction(title: "dismiss", style: .cancel){ (action:UIAlertAction) in
            alertviewcont.dismiss(animated: true, completion: nil)
        }
        alertviewcont.addAction(dismissAction)
        vc.present(alertviewcont, animated: true,completion: nil)
    }
}
