//
//  LocalUserPreferences.swift
//  KChatiOS
//
//  Created by Sterling Albury on 8/25/21.
//  Copyright © 2021 Sterling, Inc. All rights reserved.
//

import Foundation
import domain

class LocalUserPreferences : UserPreferences {
    func clear(completionHandler: @escaping (KotlinUnit?, Error?) -> Void) {
        
    }
    
    func getServerInfo(completionHandler: @escaping (ServerInfo?, Error?) -> Void) {
        let serverInfo = ServerInfo(username: "", serverIP: "", serverPort: 4444)
        completionHandler(serverInfo, nil)
    }
    
    func upsert(serverInfo: ServerInfo, completionHandler: @escaping (KotlinUnit?, Error?) -> Void) {
        print("upsert server info")
        completionHandler(KotlinUnit(), nil)
    }
}
