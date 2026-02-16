//
//  Dictionary+Extension.swift
//  iTrack
//
//  Created by DHAVAL PANDIT on 17/03/19.
//  Copyright © 2019 DHAVAL PANDIT. All rights reserved.
//

import Foundation

extension Dictionary {
    
    func stringFromHttpParameters() -> String {
        let parameterArray = self.map { (key, value) -> String in
            let nonNilValue:String = value is NSNumber ? "\(value as? NSNumber ?? 0)" : (value as? String ?? "")
            let percentEscapedKey = (key as? String ?? "").addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? "nokey"
            let percentEscapedValue = nonNilValue.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? "novalue"
            return "\(percentEscapedKey)=\(percentEscapedValue)"
        }
        
        return parameterArray.joined(separator: "&")
    }
}
