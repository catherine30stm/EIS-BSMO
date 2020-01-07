//
//  Safe.swift
//  Singleton
//
//  Created by Catherine Barabanova on 28/08/2019.
//  Copyright © 2019 Catherine Barabanova. All rights reserved.
//

import Foundation

class SafeClass {
    
    static let shared = SafeClass()
    var money = 0
    
//    Нельзя инициализировать
    private init() {
        
    }
}
