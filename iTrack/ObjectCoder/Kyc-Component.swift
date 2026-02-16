//
//  Kyc-Component.swift
//  iTrack
//
//  Created by DHAVAL PANDIT on 10/03/19.
//  Copyright © 2019 DHAVAL PANDIT. All rights reserved.
//

import Foundation
import DataStoreKit

class KycComponent: ObjectCoder {
    var document_number: String?
    var file: String?
    var isVerified: Bool?
    
    required init(dictionary withDictionary: [String : Any]) {
        self.document_number = withDictionary["document_number"] as? String
        self.file = withDictionary["file"] as? String
        self.isVerified = withDictionary["isVerified"] as? Bool
    }
    
    func toDictionary() -> [String : Any] {
        var dic: [String:Any] = [String:Any]()
        self.document_number != nil ? dic["document_number"] = self.document_number! : ()
        self.file != nil ? dic["path of file"] = self.file! : ()
        self.isVerified != nil ? dic["isVerified"] = self.isVerified! : ()
        return dic
    }
    
    static func identifierKey() -> String {
        return "_id"
    }
}
