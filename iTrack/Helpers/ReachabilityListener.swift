//
//  ReachabilityListener.swift
//  Astro Science
//
//  Created by Taneja on 3/30/17.
//  Copyright © 2017 Taneja. All rights reserved.
//

import Foundation
import Reachability

class ReachabilityListener {
    static let ReachabilityReachable = "ReachabilityReachable"
    static let ReachabilityUnReachable = "ReachabilityUnReachable"
    static let shared = ReachabilityListener()
    
    fileprivate var reachability: Reachability?
    
    func isReachable() -> Bool {
        return self.reachability?.isReachable ?? false
    }
    
    func startMonitoring(){
        self.reachability = ReachabilityListener.add(object: self, whenReachable: { 
            NotificationCenter.default.post(name: Notification.Name(rawValue: ReachabilityListener.ReachabilityReachable), object: nil, userInfo: nil)
        }, whenUnRechable: { 
            NotificationCenter.default.post(name: Notification.Name(rawValue: ReachabilityListener.ReachabilityUnReachable), object: nil, userInfo: nil)
        })
    }
    
    static func add(object:Any?, whenReachable: @escaping () -> Void, whenUnRechable: @escaping () -> Void) -> Reachability? {
        
        let reachability = Reachability()
        reachability?.whenUnreachable = { reachability in
            whenReachable()
        }
        
        reachability?.whenUnreachable = { reachability in
            whenUnRechable()
        }
        do {
            try reachability?.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
        
        return reachability
    }
    
    func stopMonitoring() {
        self.reachability?.stopNotifier()
    }
}
