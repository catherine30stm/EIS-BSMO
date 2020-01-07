//
//  Director.swift
//  Pizzeria3000
//
//  Created by Catherine Barabanova on 24.11.2019.
//  Copyright © 2019 Catherine Barabanova. All rights reserved.
//

protocol DirectorProtocol {
    var delegate: Logger { get }
    func getProfit()
}


class Director: DirectorProtocol {
    var delegate: Logger = Logger.shared
    
    func getProfit() {
        delegate.printPizzeriaProfit()
    }
}

