//
//  BasePresenter.swift
//  KChatiOS
//
//  Created by Sterling Albury on 8/4/21.
//  Copyright © 2021 Sterling, Inc. All rights reserved.
//

import Foundation

protocol Presenter: class {
    func configureView()
    func start()
    func stop()
}

extension Presenter {
    func configureView() { }
    func start() { }
    func stop() { }
}
