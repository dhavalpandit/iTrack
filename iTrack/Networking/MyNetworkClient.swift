//
//  MyNetworkClient.swift
//  iTrack
//
//  Created by DHAVAL PANDIT on 17/03/19.
//  Copyright © 2019 DHAVAL PANDIT. All rights reserved.
//

import Foundation
import Reachability
import DataStoreKit


protocol CacheStoreProtocol {
    func cacheEntry(_ path: String!, data:Data, callback:((NSError?,Any?)-> Void)?)
    func dataForId(_ id: String!, callback:((NSError?,Any?)-> Void)?)
}

class MyNetworkClient: NSObject, URLSessionDelegate, NetworkInterface {
    var networkClient: URLSession?
    var url: String?
    var defaultHeaders: [String:String] = [String:String]()
    var isReactive = false
    fileprivate var cacheStore:CacheStoreProtocol?
    override init() {
        super.init()
        let config = URLSessionConfiguration.default
        self.networkClient = URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue.main)
        self.configureNetworkClient()
    }
    
    init(urlString url: String) {
        super.init()
        let config = URLSessionConfiguration.default
        self.networkClient = URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue.main)
        self.url = url
        self.configureNetworkClient()
    }
    
    init(urlString url: String, reactive:Bool = false) {
        super.init()
        let config = URLSessionConfiguration.default
        self.networkClient = URLSession(configuration: config, delegate: self, delegateQueue: OperationQueue.main)
        self.url = url
        self.isReactive = reactive
        self.configureNetworkClient()
    }
    
    func setCacheStore(cacheStore:CacheStoreProtocol){
        self.cacheStore = cacheStore
    }
    
    private func configureNetworkClient() {
        self.defaultHeaders["Content-Type"] = "application/json"
        self.defaultHeaders["Accept"] = "application/json"
    }
    
    func getRequestWithDefaultHeaders(forURL url: URL, method: String, parameters: [String:Any]?) -> URLRequest {
        
        var request = URLRequest(url: url)
        self.defaultHeaders.forEach { (key: String, value: String) in
            request.addValue(value, forHTTPHeaderField: key)
        }
        request.httpMethod = method
        
        let data: Data? =  self.generateDataFromParameters(parameters: parameters)
        data == nil  ? () : (request.httpBody = data!)
        return request
        
    }
    
    private func generateDataFromParameters(parameters: [String:Any]?) -> Data? {
        
        let data = parameters != nil ? (try? JSONSerialization.data(withJSONObject: parameters! , options: JSONSerialization.WritingOptions())) : nil
        return data
        
    }
    
    func setHTTPHeaders(_ headers: [String : String]) {
        headers.forEach { (key:String, value:String) in
            self.defaultHeaders[key] = value
        }
    }
    
    func urlSession(_ session: URLSession, didReceive challenge: URLAuthenticationChallenge, completionHandler: @escaping (URLSession.AuthChallengeDisposition, URLCredential?) -> Swift.Void) {
        if (challenge.protectionSpace.authenticationMethod == NSURLAuthenticationMethodServerTrust) {
            let credential = URLCredential(trust: challenge.protectionSpace.serverTrust!)
            completionHandler(URLSession.AuthChallengeDisposition.useCredential, credential)
        }
    }
    
    private func RESOLVE(_ response: URLResponse?, data: Data?, callback: ((NSError?,Any?) -> Void)?) {
        (data?.count ?? 0) > 0 ? self.sendJSONData(data: data!, callback: callback) : callback?(nil,nil)
    }
    
    private func REJECT(_ response: URLResponse?, data: Data?, callback: ((NSError?,Any?) -> Void)?) {
        (data?.count ?? 0) > 0 ? self.sendJSONData(data: data!, callback: callback) : callback?(nil,nil)
    }
    
    private func sendJSONData(data: Data, callback: ((NSError?,Any?) -> Void)?) {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            callback?(nil,jsonObject)
        } catch let error {
            callback?(NSError(domain: error.localizedDescription, code: 400, userInfo: nil),data)
            return;
        }
    }
    
    func GET(_ URLString: String!, parameters: [String:Any]?, callback: ((NSError?, Any?) -> Void)!) {
        
        self._getDataFromCache(URLString, parameters: parameters ?? [:], callback: callback)
    }
    
    fileprivate func _getCacheUrlKey(_ url:String,parameters:[String:Any])->String{
        
        let urlObj = URL(string: url)
        let resourcePath = urlObj?.relativePath ?? ""
        
        let str = resourcePath
        let queryStr = parameters.stringFromHttpParameters()
        
        return queryStr.isEmpty ? str : str + "?" + queryStr;
        
        
    }
    
    fileprivate func _getDataFromCache(_ URLString: String!, parameters: [String:Any], callback: ((NSError?, Any?) -> Void)!){
        
        var url = self._getCacheUrlKey(URLString, parameters: parameters)
        
        self.cacheStore != nil ? self.cacheStore!.dataForId(url, callback: { [weak self] (error, data) -> Void in
            var dataToParse:Data = data as? Data ?? Data()
            var jsonError:NSError?
            var json: Any?
            do {
//                JSONSerialization.jsonObject(with: da, options: <#T##JSONSerialization.ReadingOptions#>)
                json = try JSONSerialization.jsonObject(with: dataToParse, options: [])
            } catch var error as NSError {
                jsonError = error
                json = nil
            } catch {
                fatalError()
            }
            
            func callBackWithCache(_ error:NSError?,data:Any?){
                callback(error,data)
                self?.networkGET(URLString, parameters: parameters, callback: ReachabilityListener.shared.isReachable() && self?.isReactive == true ? callback : nil)
            }
            
            json != nil ?  callBackWithCache(jsonError,data: json ) : (self?.networkGET(URLString, parameters: parameters, callback: callback))
            
            
        }) : (self.networkGET(URLString, parameters: parameters, callback: callback))
    }
    
    func networkGET(_ URLString: String!, parameters: [String:Any], callback: ((NSError?, Any?) -> Void)!) {
        
        
        
        let queryString = parameters.stringFromHttpParameters()
        let networkURL = queryString.isEmpty  ? URL(string: URLString) : URL(string: URLString + "?" + queryString)
        let cacheKey = self._getCacheUrlKey(URLString, parameters: parameters)
        let request =  self.getRequestWithDefaultHeaders(forURL: networkURL!, method: "GET", parameters: nil)
        self.processNetworkRequest(request: request, cacheKey: cacheKey, callback: callback)
        
        
        
    }
    
    func POST(_ URLString: String!, parameters: [String:Any], callback: ((NSError?, Any?) -> Void)!) {
        let networkURL = URL(string: URLString)
        let params = parameters
        
        let request =  self.getRequestWithDefaultHeaders(forURL: networkURL!, method: "POST", parameters: params)
        self.processNetworkRequest(request: request, cacheKey: nil, callback: callback)
        
    }
    
    func PUT(_ URLString: String!, parameters: [String:Any], callback: ((NSError?, Any?) -> Void)!) {
        let networkURL = URL(string: URLString)
        let params = parameters
        let request =  self.getRequestWithDefaultHeaders(forURL: networkURL!, method: "PUT", parameters: params)
        self.processNetworkRequest(request: request, cacheKey: nil, callback: callback)
        
    }
    
    func DELETE(_ URLString: String!, parameters: [String:Any]?, callback: ((NSError?, Any?) -> Void)!) {
        
        
        let queryString = parameters?.stringFromHttpParameters() ?? ""
        
        let networkURL = queryString.isEmpty ? URL(string: URLString ) : URL(string: URLString + "?" + queryString)
        
        let request =  self.getRequestWithDefaultHeaders(forURL: networkURL!, method: "DELETE", parameters: nil)
        self.processNetworkRequest(request: request, cacheKey: nil, callback: callback)
    }
    
    private func processNetworkRequest(request: URLRequest, cacheKey: String?, callback: ((NSError?,Any?) -> Void)?) {
        
        self.networkClient?.dataTask(with: request, completionHandler: { [weak self] (data:Data?, response:URLResponse?, error:Error?) in
            request.httpMethod == "GET" && data != nil ? self?.cacheStore?.cacheEntry(cacheKey, data: data!, callback: nil) : ()
            
            let httpResponse = response as? HTTPURLResponse
            
            let statusCode = httpResponse?.statusCode ?? 400;
            
            error != nil ? callback?(NSError(domain: error.debugDescription, code: statusCode, userInfo: nil),nil) : statusCode >= 400 ? self?.REJECT(response, data: data, callback: callback) : self?.RESOLVE(response, data: data, callback: callback)
            
        }).resume()
    }
}

