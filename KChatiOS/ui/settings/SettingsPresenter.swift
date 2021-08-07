//
//  SettingsPresenter.swift
//  KChatiOS
//
//  Created by Sterling Albury on 8/4/21.
//  Copyright © 2021 Sterling, Inc. All rights reserved.
//

import Foundation
import UIKit

protocol SettingsPresenting {
    func observeServerData() -> String
}

final class SettingsPresenter: SettingsPresenting {
    func observeServerData() -> String {
        "blah"
    }
    
}
