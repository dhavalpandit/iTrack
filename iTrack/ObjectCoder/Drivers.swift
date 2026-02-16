//
//  Drivers.swift
//  iTrack
//
//  Created by DHAVAL PANDIT on 07/03/19.
//  Copyright © 2019 DHAVAL PANDIT. All rights reserved.
//

import Foundation
import DataStoreKit

class Driver: ObjectCoder {
    
    var name: String?
    var Addres: String?
    
    required init(dictionary withDictionary: [String : Any]) {
        self.name = withDictionary["Name"] as? String
        self.Addres = withDictionary["Addres"] as? String
    }
    
    func toDictionary() -> [String : Any] {
        var dic: [String:Any] = [String:Any]()
        self.name != nil ? dic["Name"] = self.name! : ()
        self.Addres != nil ? dic["Addres"] = self.Addres! : ()
        return dic
    }
    
    static func identifierKey() -> String {
        return "_id"
    }
}
