//
//  User.swift
//  iTrack
//
//  Created by DHAVAL PANDIT on 03/03/19.
//  Copyright © 2019 DHAVAL PANDIT. All rights reserved.
//

import Foundation
import DataStoreKit

class User: ObjectCoder {
    
    var _id: String?
    var name: String?
    var email: String?
    var mobile: String?
    var password: String?
    var type: String?
    var fleet: Fleet?
    var agency: String?
    var error: NetworkError?
    
    required init(dictionary withDictionary: [String : Any]) {
        self.name = withDictionary["name"] as? String
        self.email = withDictionary["email"] as? String
        self.mobile = withDictionary["mobile"] as? String
        self.password = withDictionary["password"] as? String
        self._id = withDictionary["_id"] as? String
        self.type = withDictionary["type"] as? String
        self.fleet = Fleet(dictionary: withDictionary["fleet"] as? [String:Any] ?? [String:Any]())
        self.agency = withDictionary["agency"] as? String
        self.error = NetworkError(dictionary: withDictionary["error"] as? [String:Any] ?? [String:Any]())
    }
    
    func toDictionary() -> [String : Any] {
        var dic: [String:Any] = [String:Any]()
        self.name != nil ? dic["name"] = self.name! : ()
        self.email != nil ? dic["email"] = self.email! : ()
        self.mobile != nil ? dic["mobile"] = self.mobile! : ()
        self.password != nil ? dic["password"] = self.password! : ()
        self.fleet?._id != nil ? dic["fleet"] = self.fleet!.toDictionary() : ()
        self.type != nil ? dic["type"] = self.type! : ()
        self.agency != nil ? dic["agency"] = self.agency! : ()
        self.error?.message != nil ? dic["error"] = self.error!.toDictionary() : ()
        return dic
    }
    
    static func identifierKey() -> String {
        return "_id"
    }
}
