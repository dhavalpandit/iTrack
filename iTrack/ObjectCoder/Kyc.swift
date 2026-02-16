//
//  Kyc.swift
//  iTrack
//
//  Created by DHAVAL PANDIT on 10/03/19.
//  Copyright © 2019 DHAVAL PANDIT. All rights reserved.
//

import Foundation
import DataStoreKit

class Kyc: ObjectCoder {
    
    var _id: String?
    var aadhar: KycComponent?
    var licence: KycComponent?
    var pan: KycComponent?

    required init(dictionary withDictionary: [String : Any]) {
        self._id = withDictionary["_id"] as? String
        self.aadhar = KycComponent(dictionary: withDictionary["aadhar"] as? [String:Any] ?? [:])
        self.licence = KycComponent(dictionary: withDictionary["licence"] as? [String:Any] ?? [:])
        self.pan = KycComponent(dictionary: withDictionary["pan"] as? [String:Any] ?? [:])
        
    }
    
    func toDictionary() -> [String : Any] {
        var dic: [String:Any] = [String:Any]()
        self._id != nil ? dic["_id"] = self._id! : ()
        self.licence != nil ? dic["licence"] = self.licence!.toDictionary() : ()
        self.aadhar != nil ? dic["aadhar"] = self.aadhar!.toDictionary() : ()
        self.pan != nil ? dic["pan"] = self.pan!.toDictionary() : ()
        return dic
    }
    
    static func identifierKey() -> String {
        return "_id"
    }
}
