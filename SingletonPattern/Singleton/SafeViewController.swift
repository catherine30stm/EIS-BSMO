//
//  ViewController.swift
//  Singleton
//
//  Created by Catherine Barabanova on 28/08/2019.
//  Copyright © 2019 Catherine Barabanova. All rights reserved.
//

import UIKit

class SafeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let safe = SafeClass.shared
        print(safe.money)
    }


}

