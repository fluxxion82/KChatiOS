//
//  RemoteUserRepository.swift
//  KChatiOS
//
//  Created by Sterling Albury on 8/25/21.
//  Copyright © 2021 Sterling, Inc. All rights reserved.
//

import Foundation
import domain

class RemoteUserRepository : UserRepository {
    func disconnect(completionHandler: @escaping (KotlinUnit?, Error?) -> Void) {
        
    }
    
    func getUser(id: Int64, completionHandler: @escaping (Outcome<AppUser>?, Error?) -> Void) {
        let appUser = AppUser.LoggedIn(id: id, username: "flux", createdAt: 1234324)
        
        print("user repo: get user")
        completionHandler(OutcomeSuccess(value: appUser), nil)
    }
    
    func getUser(username: String, completionHandler: @escaping (Outcome<AppUser>?, Error?) -> Void) {
        let appUser = AppUser.LoggedIn(id: 12, username: username, createdAt: 1234324)
        
        print("user repo: get user")
        completionHandler(OutcomeSuccess(value: appUser), nil)
    }
    
    func getUserProfile(completionHandler: @escaping (Outcome<ProfileDetails>?, Error?) -> Void) {
        
    }
    
    func login(param: LoginUser.LoginData, completionHandler: @escaping (Outcome<AppUser>?, Error?) -> Void) {
        print("user repo: loginnn, user: \(String(describing: param.username))")
        let appUser = AppUser.LoggedIn(id: 12, username: param.username!, createdAt: 1234324)
        
        completionHandler(OutcomeSuccess(value: appUser), nil)
    }
    
    func signup(param: SignUpUser.SignUpnData, completionHandler: @escaping (Outcome<AppUser>?, Error?) -> Void) {
        
    }
    
    func updateProfileDetails(updated: ProfileDetails, completionHandler: @escaping (KotlinUnit?, Error?) -> Void) {
        
    }
}
