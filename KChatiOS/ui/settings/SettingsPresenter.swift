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
    func observeServerIp() -> String
    func onGoClick(uName: String?, address: String?, port: String?) -> Bool
}

final class SettingsPresenter: SettingsPresenting {
    var getServerInfo: GetServerInfo
    var updateServerInfo: UpdateServerInfo
    var loginUser: LoginUser
    
    let userName: String
    
    let serverAddress: String
    
    let serverPort: String
    
    func observeServerIp() -> String {
        serverAddress
    }
    
    init(getServerInfo: GetServerInfo, updateServerInfo: UpdateServerInfo, loginUser: LoginUser) {
        self.getServerInfo = getServerInfo
        self.updateServerInfo = updateServerInfo
        self.loginUser = loginUser
        
//        guard let serverDetails = getServerInfo.invoke(param: KotlinUnit(), completionHandler: { (<#Kotlinx_coroutines_coreFlow?#>, error) in
//
//        }) else {
//            self.userName = ""
//            self.serverAddress = ""
//            self.serverPort = ""
//            return
//        }
        
        self.userName = ""
        self.serverAddress = ""
        self.serverPort = ""
    }
    
    func configureView() {
    
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
