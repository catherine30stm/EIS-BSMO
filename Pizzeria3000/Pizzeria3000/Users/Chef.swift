//
//  Chef.swift
//  Pizzeria3000
//
//  Created by Catherine Barabanova on 24.11.2019.
//  Copyright © 2019 Catherine Barabanova. All rights reserved.
//

protocol ChefProtocol {
    var delegate: Logger { get }
    func getPizzaOrdersStatistics()
}

class Chef: ChefProtocol {
    var delegate: Logger = Logger.shared
    
    func getPizzaOrdersStatistics() {
        delegate.printPizzeriaStatistics()
    }
}
