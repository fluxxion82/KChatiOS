//
//  ViewController.swift
//  KChatiOS
//
//  Created by Sterling Albury on 7/30/21.
//  Copyright © 2021 Sterling, Inc. All rights reserved.
//

import UIKit
import multicore
import domain

protocol SettingsViewInterface: ViewInterface {
}

class ViewController: BaseViewController, SettingsViewInterface {
    var component = KChatComponent()
    
    fileprivate var _presenter: SettingsPresenter {
        return presenter as! SettingsPresenter
    }
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userNameInput: UITextField!
    @IBOutlet weak var serverIpInput: UITextField!
    @IBOutlet weak var serverPortInput: UITextField!
    @IBOutlet weak var enterButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = SettingsPresenter(
            getServerInfo: self.component.getServerInfo,
            updateServerInfo: self.component.updateServerInfo,
            loginUser: self.component.loginUser
        )
        
        print(SampleKt.hello() + " " + Bar().name())
        
        self.userNameLabel.text = GetSampleFooKt.goodbye()

    }
    
    @IBAction func onClick(_ sender: UIButton, forEvent event: UIEvent) {
        print("Button is Clicked")
        _presenter.onGoClick(
            uName: userNameInput.text,
            address: serverIpInput.text,
            port: serverPortInput.text
        )
    }
}
