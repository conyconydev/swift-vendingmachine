//
//  Pack.swift
//  VendingMachine
//
//  Created by 윤지영 on 17/12/2018.
//  Copyright © 2018 JK. All rights reserved.
//

import Foundation

class Pack: NSObject {
    private var beverages: [Beverage]

    init(beverages: [Beverage]) {
        self.beverages = beverages
    }

    func add(beverage: Beverage) {
        beverages.append(beverage)
    }

    func isBuyable(with money: Int) -> Bool {
        guard let one = beverages.first else { return false }
        return one.isBuyable(for: money)
    }

    func removeOne() -> Beverage? {
        if beverages.isEmpty { return nil }
        return beverages.removeFirst()
    }

    var count: Int {
        return beverages.count
    }

    override var description: String {
        guard let one = beverages.first else { return "" }
        return one.description
    }

    func isEmpty() -> Bool {
        return beverages.isEmpty
    }

    func hasHotBeverage() -> Bool {
        for beverage in beverages {
            guard let coffee = beverage as? Coffee else { continue }
            if coffee.isHot() { return true }
        }
        return false
    }

    func removeExpiredBeverages() -> [Beverage] {
        var expiredBeverages: [Beverage] = []
        for (index, beverage) in beverages.enumerated() {
            guard let milk = beverage as? Milk else { continue }
            if milk.validate(when: Date()) { continue }
            beverages.remove(at: index)
            expiredBeverages.append(milk)
        }
        return expiredBeverages
    }

}