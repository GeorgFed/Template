//
//  ConnectionManager.swift
//  tableView Test for iPresent
//
//  Created by Georg on 19/08/2019.
//  Copyright © 2019 Georg. All rights reserved.
//

import Foundation

/// # Network State Observation
/// NOTE:  Requires reachabillity file
/// NOTE: Requires Notification names from Connection enumeration, Constants file

class ConnectionManager {
    
    static let sharedInstance = ConnectionManager()
    private var reachability : Reachability!
    
    func observeReachability(){
        try! self.reachability = Reachability()
        NotificationCenter.default.addObserver(self, selector:#selector(self.reachabilityChanged), name: NSNotification.Name.reachabilityChanged, object: nil)
        do {
            try self.reachability.startNotifier()
        }
        catch(let error) {
            print("Error occured while starting reachability notifications : \(error.localizedDescription)")
        }
    }
    
    @objc func reachabilityChanged(note: Notification) {
        let reachability = note.object as! Reachability
        switch reachability.connection {
        case .cellular:
            print("Network available via Cellular Data")
            NotificationCenter.default.post(name: Notification.Name(Connection.cellular.rawValue),
                                            object: nil)
            break
        case .wifi:
            print("Network available via WiFi")
            NotificationCenter.default.post(name: Notification.Name(Connection.wifi.rawValue),
                                            object: nil)
            break
        case .none:
            print("Network is not available")
            NotificationCenter.default.post(name: Notification.Name(Connection.none.rawValue),
                                            object: nil)
            break
        case .unavailable:
            print("No connection")
            NotificationCenter.default.post(name: Notification.Name(Connection.unavailable.rawValue),
                                            object: nil)
            break
        }
    }
}
