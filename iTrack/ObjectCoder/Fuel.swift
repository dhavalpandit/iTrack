//
//  Fuel.swift
//  iTrack
//
//  Created by Taneja-Mac on 15/04/19.
//  Copyright © 2019 DHAVAL PANDIT. All rights reserved.
//

import Foundation
import DataStoreKit

class Fuel: ObjectCoder {
    
    var _id: String?
    var agency: String?
    var fleet: Fleet?
    var driver: String?
    var amount: Double?
    var quantity: Double?
    var date: String?
    var created_at: String?
    
    required init(dictionary withDictionary: [String : Any]) {
        print("Dictionary: \(withDictionary)")
        self._id = withDictionary["_id"] as? String
        self.agency = withDictionary["agency"] as? String
        self.fleet = Fleet(dictionary:  withDictionary["fleet"] as? [String:Any] ?? [String:Any]())
        self.driver = withDictionary["driver"] as? String
        self.amount = withDictionary["amount"] as? Double
        self.quantity = withDictionary["quantity"] as? Double
        self.date = withDictionary["date"] as? String
        self.created_at = withDictionary["created_at"] as? String
    }
    
    func toDictionary() -> [String : Any] {
        var dic: [String:Any] = [String:Any]()
        self._id != nil ? dic["_id"] = self._id! : ()
        self.agency != nil ? dic["agency"] = self.agency! : ()
        self.fleet != nil ? dic["fleet"] = self.fleet! : ()
        self.driver != nil ? dic["driver"] = self.driver! : ()
        self.amount != nil ? dic["amount"] = self.amount! : ()
        self.quantity != nil ? dic["quantity"] = self.quantity! : ()
        self.date != nil ? dic["date"] = self.date! : ()
        self.created_at != nil ? dic["created_at"] = self.created_at! : ()
        return dic
    }
    
    static func identifierKey() -> String {
        return "_id"
    }
}
