//
//  ViewController.swift
//  KChatiOS
//
//  Created by Sterling Albury on 6/9/20.
//  Copyright © 2020 Sterling, Inc. All rights reserved.
//

import UIKit
import multicore

class ViewController: UIViewController {

    @IBOutlet weak var helloWorldLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.helloWorldLabel.text = SampleKt.hello()
    }


}

