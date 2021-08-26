//
//  KChatComponent.swift
//  KChatiOS
//
//  Created by Sterling Albury on 8/25/21.
//  Copyright © 2021 Sterling, Inc. All rights reserved.
//

import Foundation
import domain

class KChatComponent: DomainModule {
    lazy var module: DomainModuleIos = DomainModuleIos(userPreferences: userPreferences, userRepository: userRepository)
    
    var userPreferences: UserPreferences = LocalUserPreferences()
    
    var userRepository: UserRepository = RemoteUserRepository()
    
    lazy var getServerInfo: GetServerInfo = module.getServerInfo
    
    lazy var getUserState: GetUserState = module.getUserState
    
    lazy var loginUser: LoginUser = module.loginUser
    
    lazy var updateServerInfo: UpdateServerInfo = module.updateServerInfo
    
    init() {}
    
    init(userPreferences: UserPreferences, userRepository: UserRepository) {
        self.userPreferences = userPreferences
        self.userRepository = userRepository
    }
    
    func chatEvents() -> ChatEventPersistence {
        module.chatEvents()
    }
    
    func dispatchersFacade() -> CoroutinesContextFacade {
        module.dispatchersFacade()
    }
    
    func foregroundEvent() -> ForegroundEventPersistence {
        module.foregroundEvent()
    }
    
    func scopeFacade() -> CoroutineScopeFacade {
        module.scopeFacade()
    }
    
    func userEvents() -> UserEventsPersistence {
        module.userEvents()
    }
}
