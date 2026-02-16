//
//  Agency.swift
//  iTrack
//
//  Created by DHAVAL PANDIT on 31/03/19.
//  Copyright © 2019 DHAVAL PANDIT. All rights reserved.
//

import Foundation
import DataStoreKit

class Agency: ObjectCoder {
    var _id: String?
    var is_active: Bool?
    var created_at: String?
    var admin: User?
    var name: String?
    var address: String?
    var gstin: String?
    
    
    static func toArray(_ arrayDic: [[String:Any]]?) -> [Agency] {
        let items = arrayDic ?? [[String:Any]]()
        return items.map { (dic:[String : Any]) -> Agency in
            return Agency(dictionary: dic)
        }
    }
    
    required init(dictionary withDictionary: [String : Any]) {
        self._id = withDictionary["_id"] as? String
        self.is_active = withDictionary["is_active"] as? Bool
        self.created_at = withDictionary["created_at"] as? String
        self.admin = User(dictionary: withDictionary["_id"] as? [String:Any] ?? [String:Any]())
        self.name = withDictionary["name"] as? String
        self.address = withDictionary["address"] as? String
        self.gstin = withDictionary["gstin"] as? String
    }
    
    func toDictionary() -> [String : Any] {
        var dic: [String:Any] = [String:Any]()
        self._id != nil ? dic["_id"] = self._id! : ()
        self.is_active != nil ? dic["is_active"] = self.is_active! : ()
        self.created_at != nil ? dic["created_at"] = self.created_at! : ()
        self.admin?._id != nil ? dic["admin"] = self.admin!.toDictionary() : ()
        self.name != nil ? dic["name"] = self.name! : ()
        self.address != nil ? dic["address"] = self.address! : ()
        self.gstin != nil ? dic["gstin"] = self.gstin! :()
        return dic
    }
    
    static func identifierKey() -> String {
        return "_id"
    }
}
