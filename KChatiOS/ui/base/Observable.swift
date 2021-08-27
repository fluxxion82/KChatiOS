//
//  Observable.swift
//  KChatiOS
//
//  Created by Sterling Albury on 8/27/21.
//  Copyright © 2021 Sterling, Inc. All rights reserved.
//

import Foundation

class Observable<T: Equatable> {
    private let thread : DispatchQueue
    var property : T? {
        willSet(newValue) {
            if let newValue = newValue,  property != newValue {
                thread.async {
                    self.observe?(newValue)
                }
            }
        }
    }
    
    var observe : ((T) -> ())?
    
    init(_ value: T? = nil, thread dispatcherThread: DispatchQueue =     DispatchQueue.main) {
        self.thread = dispatcherThread
        self.property = value
    }
}
