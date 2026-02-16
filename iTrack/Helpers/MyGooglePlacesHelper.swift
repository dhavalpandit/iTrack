//
//  MyGooglePlacesHelper.swift
//  iTrack
//
//  Created by Taneja-Mac on 14/04/19.
//  Copyright © 2019 DHAVAL PANDIT. All rights reserved.
//

import Foundation
import UIKit


class MyGooglePlacesHelpers {
    /**
     Build a query string from a dictionary
     
     - parameter parameters: Dictionary of query string parameters
     - returns: The properly escaped query string
     */
    fileprivate class func query(_ parameters: [String: Any]) -> String {
        var components: [(String, String)] = []
        for key in Array(parameters.keys).sorted(by: <) {
            let value: Any! = parameters[key]
            components += [(escape(key), escape("\(value)"))]
        }
        
        return (components.map{"\($0)=\($1)"} as [String]).joined(separator: "&")
    }
    
    private class func queryParameters(parameters: [String:String]) -> String {
        var query = ""
        parameters.forEach { (key: String, value: String) in
            query += "\(escape(key))=\(escape(value))&"
        }
        return query
    }
    
    
    fileprivate class func escape(_ string: String) -> String {
        let legalURLCharactersToBeEscaped: CFString = NSString(string: ":/?&=;+!@#$()',*")
        return CFURLCreateStringByAddingPercentEscapes(nil, string as CFString!, nil, legalURLCharactersToBeEscaped, CFStringBuiltInEncodings.UTF8.rawValue) as String
    }
    
    internal class func doRequest(_ url: String, params: [String: String], success: @escaping ([String:Any]) -> ()) {
        let placeUrl = "\(url)?\(self.queryParameters(parameters: params))"
        let request = URLRequest(
            url: URL(string: placeUrl)!
        )
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in
            self.handleResponse(data, response: response, error: error, success: success)
        }
        
        task.resume()
    }
    
    fileprivate class func handleResponse(_ data: Data!, response: URLResponse!, error: Error!, success: @escaping ([String:Any]) -> ()) {
        if let error = error {
            print("GooglePlaces Error: \(error)")
            return
        }
        
        if response == nil {
            print("GooglePlaces Error: No response from API")
            return
        }
        
        var serializationError:NSError?
        var json: [String:Any] = [:]
        do {
            json = try JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
        } catch let error as NSError {
            serializationError = error
        } catch {
            
        }
        
        
        if let error = serializationError {
            print("GooglePlaces Error: \(error)")
            return
        }
        
        if let status = json["status"] as? String {
            if status != "OK" {
                print("GooglePlaces API Error: \(status)")
                return
            }
        }
        
        // Perform table updates on UI thread
        DispatchQueue.main.async(execute: {
            UIApplication.shared.isNetworkActivityIndicatorVisible = false
            
            success(json)
        })
    }
    
    static func getPlaces(_ searchText: String, callback: @escaping ([Place]) -> Void)
    {
        var places: [Place] = [Place]()
        let parameters = ["key":Constants.KEY.GOOGLE_PLACES, "type":"", "input":searchText]
        MyGooglePlacesHelpers.doRequest(Constants.URL.GOOGLE_PLACES, params: parameters) { success in
            
            if let predictions = success["predictions"] as? Array<[String:Any]> {
                places = predictions.map({ (prediction:[String : Any]) -> Place in
                    return Place(prediction: prediction, apiKey: Constants.KEY.GOOGLE_PLACES)
                })
            }
            callback(places)
        }
    }
}
