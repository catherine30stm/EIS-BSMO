//
//  AppDelegate.swift
//  Singleton
//
//  Created by Catherine Barabanova on 28/08/2019.
//  Copyright © 2019 Catherine Barabanova. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDel: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let safe = Safe.shared
        safe.money += 10000
        
        return true
    }

}

