//
//  NetworkError.swift
//  iTrack
//
//  Created by DHAVAL PANDIT on 17/03/19.
//  Copyright © 2019 DHAVAL PANDIT. All rights reserved.
//

import Foundation
import DataStoreKit

class NetworkError :ObjectCoder {
    var message: String?
    
    required init(dictionary withDictionary: [String : Any]) {
        self.message = withDictionary["message"] as? String
    }
    
    func toDictionary() -> [String : Any] {
        var dic = [String:Any]()
        self.message != nil ? dic["error"] = self.message! : ()
        return dic
    }
    
    static func identifierKey() -> String {
        return ""
    }
}
