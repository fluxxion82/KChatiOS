//
//  SettingsPresenter.swift
//  KChatiOS
//
//  Created by Sterling Albury on 8/4/21.
//  Copyright © 2021 Sterling, Inc. All rights reserved.
//

import Foundation
import UIKit
import domain

protocol SettingsPresenting: Presenter {
    func onGoClick(uName: String?, address: String?, port: String?) -> Bool
}

final class SettingsPresenter: SettingsPresenting {
    var getServerInfo: GetServerInfo
    var updateServerInfo: UpdateServerInfo
    var loginUser: LoginUser
    
    let serverInfoCollector: ServerInfoCollector = ServerInfoCollector()
    
    class ServerInfoCollector: NSObject, Kotlinx_coroutines_coreFlowCollector {
        var userName = Observable<String>()
        var serverAddress = Observable<String>()
        var serverPort = Observable<String>()
        
        override init() {}
        
        func emit(value: Any?, completionHandler: @escaping (KotlinUnit?, Error?) -> Void) {
            print("flow data received!")
            let serverDetails = value as! ServerInfo
            self.userName.property = serverDetails.username ?? "ster"
            self.serverAddress.property = serverDetails.serverIP ?? "10.0.0.62"
            self.serverPort.property = String(describing: (serverDetails.serverPort ?? 4444))
            
            completionHandler(KotlinUnit(), nil)
        }
    }
    
    init(getServerInfo: GetServerInfo, updateServerInfo: UpdateServerInfo, loginUser: LoginUser) {
        self.getServerInfo = getServerInfo
        self.updateServerInfo = updateServerInfo
        self.loginUser = loginUser
        
        getServerInfo.invoke(param: KotlinUnit(), completionHandler: { (coreFlow, error) in
            coreFlow?.collect(collector: self.serverInfoCollector, completionHandler: { (kotlinUnit, error) in
                print("completion")
            })
        })
    }
    
    func onGoClick(uName: String?, address: String?, port: String?) -> Bool {
        print("go clicked")
        DispatchQueue.main.async {
            print("async")
            let serverInfo = ServerInfo(username: uName, serverIP: address, serverPort: KotlinInt(pointer: port))

            self.updateServerInfo.invoke(param: serverInfo) { (result, error) in
                print("we got an update result!, \(String(describing: result)), or error: \(String(describing: error))")
                if ((result) != nil) {
                    self.loginUser.invoke(
                        param: LoginUser.LoginData(username: uName)) { (userState, error) in
                            print("we got a user state!, \(String(describing: userState)) or error \(String(describing: error))")
                            if ((userState?.isKind(of: UserState.LoggedIn.self) ) != nil) {
                                print("logged in")
                                //KLogger.w { "logged in" }

                                // navigation.value = ServerInfoNavigation.UpdateSucceeded.toEvent()
                            }
                    }
               }
            }
            
        }
        
        return true
    }
}
