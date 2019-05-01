//
//  Beverage.swift
//  VendingMachine
//
//  Created by Elena on 25/03/2019.
//  Copyright © 2019 JK. All rights reserved.
//
import Foundation

typealias resultGoods = (String, Int) -> Void

class Beverage: NSObject {
    
    private let brand: String
    private let volume: Int
    private let price: Int
    private let name: String
    private let manufacturedDate: Date
    private let expiryPeriod: Int
    
    init(brand: String, volume: Int, price: Int, name: String, manufacturedDate: Date , expiryPeriod: Int) {
        self.brand = brand
        self.volume = volume
        self.price = price
        self.name = name
        self.manufacturedDate = manufacturedDate
        self.expiryPeriod = expiryPeriod
    }
    
    // Required Initializers
    override required convenience init() {
        self.init(
            brand:"",
            volume: 0,
            price: 0,
            name: "",
            manufacturedDate: Date(),
            expiryPeriod: 0
        )
    }
    
    override var description: String {
        return "\(name) \(price)원"
    }
    
    override var className: String {
        return String(describing: type(of: self))
    }
    
    //유통기한
    func isEqualExpirationDate() -> Bool {
        let expirationDate = Date.addDate(addDay: expiryPeriod, day: manufacturedDate)
        return Date.isEqualDate(manufacturedDate: expirationDate)
    }
    
    func isBuy(money: Money) -> Bool {
        return money.isBuy(money: price)
    }
    
    func subtract(pay: Money) {
        pay.subtract(price: price)
    }
    
    func doPurchase(goods: resultGoods) {
        goods(name, price)
    }
    
    var title: String {
        return name
    }
    
    func showPurchase(with show: (String, Int) -> Void) {
        show(name, price)
    }
    
}
