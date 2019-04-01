//
//  Milk.swift
//  VendingMachine
//
//  Created by Elena on 25/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

class Milk: Beverage {
    private var milkGrade: MilkGrade?
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedDate: Date, hot: Bool = true , milkGrade: MilkGrade? = nil) {
        self.milkGrade = .A
        super.init(
            brand: brand,
            volume: volume,
            price: price,
            name: name,
            manufacturedDate: manufacturedDate)
    }
    
    func hasRankingGrade() -> MilkGrade? {
        guard let milkGrade = milkGrade else {
            return nil
        }
        return milkGrade
    }
}


