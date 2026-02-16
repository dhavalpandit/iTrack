//
//  Fleet.swift
//  iTrack
//
//  Created by DHAVAL PANDIT on 05/03/19.
//  Copyright © 2019 DHAVAL PANDIT. All rights reserved.
//

import Foundation
import DataStoreKit

class Fleet: ObjectCoder {
    
    var company: String?
    var _id: String?
    var is_active: Bool?
    var created_at: String?
    var name: String?
    var fleet_model: String?
    var engine_number: String?
    var registration_number: String?
    var chassis_number: String?
    var agency: String?
    
    required init(dictionary withDictionary: [String : Any]) {
        self.name = withDictionary["name"] as? String
        self.company = withDictionary["company"] as? String
        self._id = withDictionary["_id"] as? String
        self.is_active = withDictionary["is_active"] as? Bool
        self.created_at = withDictionary["created_at"] as? String
        self.fleet_model = withDictionary["fleet_model"] as? String
        self.engine_number = withDictionary["engine_number"] as? String
        self.registration_number = withDictionary["registration_number"] as? String
        self.chassis_number = withDictionary["chassis_number"] as? String
        self.agency = withDictionary["agency"] as? String
    }
    
    func toDictionary() -> [String : Any] {
        var dic: [String:Any] = [String:Any]()
        self.name != nil ? dic["name"] = self.name! : ()
        self.company != nil ? dic["company"] = self.company! : ()
        self._id != nil ? dic["_id"] = self._id! : ()
        self.is_active != nil ? dic["is_active"] = self.is_active! : ()
        self.created_at != nil ? dic["created_at"] = self.created_at! : ()
        self.fleet_model != nil ? dic["fleet_model"] = self.fleet_model! : ()
        self.engine_number != nil ? dic["engine_number"] = self.engine_number! : ()
        self.registration_number  != nil ? dic["registration_number"] = self.registration_number! : ()
        self.chassis_number != nil ? dic["chassis_number"] = self.chassis_number! : ()
        self.agency != nil ? dic["agency"] = self.agency! : ()
        return dic
    }
    
    static func identifierKey() -> String {
        return "_id"
    }
}
