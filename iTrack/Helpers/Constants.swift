//
//  Constants.swift
//  iTrack
//
//  Created by DHAVAL PANDIT on 17/03/19.
//  Copyright © 2019 DHAVAL PANDIT. All rights reserved.
//

import Foundation

class Constants {
    
    class DATA {
        static var AGENCIES: [Agency]?
    }
    class URL {
//        static let BASE_URL: String = "https://e84d2cf0.ngrok.io"
        static let BASE_URL: String = "http://itrack.vistaura.com"
        static let LOGIN: String = URL.BASE_URL + "/v1/login"
        static let AGENCY: String = URL.BASE_URL + "/v1/agencies"
        static let FLEETS: String = URL.BASE_URL + "/v1/fleets"
        static let USERS: String = URL.BASE_URL + "/v1/users"
        static let FUEL: String = URL.BASE_URL + "/v1/fuel"
        static let MAINTENANCE: String = URL.BASE_URL + "/v1/maintenance"
        static let GOOGLE_PLACES: String = "https://maps.googleapis.com/maps/api/place/autocomplete/json"
    }
    
    class KEY {
        static let GOOGLE_PLACES: String = "AIzaSyDrPWNiFqiBvSqe0LG6XLUR1Kv2UEcYSGA"
        static let GOOGLE_MAPS: String = "AIzaSyAnfa-F1WvvvCWU8k7DvQ8tU94eOerBjko"
    }
}
