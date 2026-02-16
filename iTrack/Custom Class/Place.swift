//
//  Place.swift
//  iTrack
//
//  Created by Taneja-Mac on 14/04/19.
//  Copyright © 2019 DHAVAL PANDIT. All rights reserved.
//

import Foundation
import MapKit

class MyGooglePlacesRequest {
    let place: Place
    
    init(place: Place) {
        self.place = place
    }
    
    func request(_ result: @escaping (PlaceDetails) -> ()) {
        MyGooglePlacesHelpers.doRequest(
            Constants.URL.GOOGLE_PLACES,
            params: [
                "placeid": place.id,
                "key": place.apiKey ?? ""
        ]) { (json:[String:Any]) in
            result(PlaceDetails(json: json ))
        }
    }
}

open class Place: NSObject {
    open var id: String
    open var desc: String
    open var apiKey: String?
    
    override open var description: String {
        get { return desc }
    }
    
    open var shortDesc :String {
        get {
            let components = (self.desc as NSString).components(separatedBy: ",")
            let descName = components.count > 0 ? components[0] as String : ""
            let descPlace = components.count > 1 ? components[1] as String : ""
            return components.count > 1 ? descName + ", " + descPlace : descName
        }
        
    }
    
    public init(id: String, description: String) {
        self.id = id
        self.desc = description
    }
    
    public convenience init(prediction: [String: Any], apiKey: String?) {
        self.init(
            id: prediction["place_id"] as! String,
            description: prediction["description"] as! String
        )
        
        self.apiKey = apiKey
    }
    
    /**
     Call Google Place Details API to get detailed information for this place
     
     Requires that Place#apiKey be set
     
     - parameter result: Callback on successful completion with detailed place information
     */
    open func getDetails(_ result: @escaping (PlaceDetails) -> ()) {
        MyGooglePlacesRequest(place: self).request(result)
    }
}

open class PlaceDetails: CustomStringConvertible {
    open var name: String
    open var latitude: Double
    open var longitude: Double
    open var raw: [String: Any]
    
    public init(json: [String: Any]) {
        let result = json["result"] as! [String: Any]
        let geometry = result["geometry"] as! [String: Any]
        let location = geometry["location"] as! [String: Any]
        
        self.name = result["name"] as! String
        self.latitude = location["lat"] as! Double
        self.longitude = location["lng"] as! Double
        self.raw = json
    }
    
    open var description: String {
        return "PlaceDetails: \(name) (\(latitude), \(longitude))"
    }
    
    open func getCoordinates() -> CLLocation
    {
        return CLLocation(latitude: self.latitude, longitude: self.longitude)
    }
}
