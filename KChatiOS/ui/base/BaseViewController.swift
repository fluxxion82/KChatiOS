//
//  BaseViewController.swift
//  KChatiOS
//
//  Created by Sterling Albury on 8/4/21.
//  Copyright © 2021 Sterling, Inc. All rights reserved.
//

import Foundation
import UIKit

protocol ViewInterface: class {
    var presenter: Presenter? { get set }
    func prepareForStartBeingVisible()
    func prepareForStopBeingVisible()
}

extension ViewInterface {
    
    func prepareForStartBeingVisible() { }
    
    func prepareForStopBeingVisible() { }
}

class BaseViewController: UIViewController, ViewInterface {

    private enum ViewState {
        case loading
        case loaded
        case configured
        case started
        case stopped
    }
    
    var presenter: Presenter? {
        didSet {
            if let presenter = presenter,
                state == .loaded {
                presenter.configureView()
                state = .configured
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        state = .loaded
        if let presenter = presenter {
            presenter.configureView()
            state = .configured
        }
    }

    private var state = ViewState.loading

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let presenter = presenter,
            state == .configured || state == .stopped {
            presenter.start()
            state = .started
        }
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        if let presenter = presenter {
            presenter.stop()
            state = .stopped
        }
    }

    func prepareForStartBeingVisible() { }
    
    func prepareForStopBeingVisible() { }
}

