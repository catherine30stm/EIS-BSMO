//
//  Pizzeria.swift
//  Pizzeria3000
//
//  Created by Catherine Barabanova on 24.11.2019.
//  Copyright © 2019 Catherine Barabanova. All rights reserved.
//

protocol PizzeriaProtocol {
    var delegate: Logger { get }
    func addPizzaOrderForStatistics(type: PizzaType)
}


class Pizzeria: PizzeriaProtocol, LogDelegate {

    var delegate: Logger = Logger.shared
    
    func getAvailableCatalogOfPizza() {
        delegate.printPizzeriaMenu()
    }
    
    func addPizzaOrderForStatistics(type: PizzaType) {
        guard (delegate.pizzeriaStatistics[type] != nil) else {
            delegate.pizzeriaStatistics[type] = 1
            return
        }
        
        delegate.pizzeriaStatistics[type]! += 1
    }
}
