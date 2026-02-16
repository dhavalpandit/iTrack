//
//  ModelFactory.swift
//  iTrack
//
//  Created by DHAVAL PANDIT on 17/03/19.
//  Copyright © 2019 DHAVAL PANDIT. All rights reserved.
//

import Foundation
import DataStoreKit

class ModelFactory {
    
    class func login(email: String, password: String) -> Restify<User> {
        let path = Constants.URL.LOGIN + "/\(email)"
        let client = MyNetworkClient()
        client.setHTTPHeaders(["password":password])
        return Restify<User>(path: path, networkClient: client)
    }
    
    class func agency() -> Restify<Agency> {
        let path = Constants.URL.AGENCY
        let client = MyNetworkClient()
        return Restify<Agency>(path: path, networkClient: client)
    }
    
    class func fleets() -> Restify<Fleet> {
        let path = Constants.URL.FLEETS
        let client = MyNetworkClient()
        return Restify<Fleet>(path: path, networkClient: client)
    }
    
    class func users() -> Restify<User> {
        let path = Constants.URL.USERS
        let client = MyNetworkClient()
        return Restify<User>(path: path, networkClient: client)
    }
    
    class func maintenance() -> Restify<Maintenance> {
        let path = Constants.URL.MAINTENANCE
        let client = MyNetworkClient()
        return Restify<Maintenance>(path: path, networkClient: client)
    }
    
    class func fuel() -> Restify<Fuel> {
        let path = Constants.URL.FUEL
        let client = MyNetworkClient()
        return Restify<Fuel>(path: path, networkClient: client)
    }
}
