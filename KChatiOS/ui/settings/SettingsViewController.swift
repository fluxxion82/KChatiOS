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

class ViewController: BaseViewController {
    
    fileprivate var _presenter: SettingsPresenter {
        return presenter as! SettingsPresenter
    }
    
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var userNameInput: UITextField!
    @IBOutlet weak var serverIpInput: UITextField!
    @IBOutlet weak var serverPortInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(SampleKt.hello() + " " + Bar().name())
        
        self.userNameLabel.text = GetSampleFooKt.goodbye()
        
        DispatchQueue.main.async {
            
        }
    }
}
