//
//  MenuScript.swift
//  VendingMachine
//
//  Created by Elena on 08/04/2019.
//  Copyright © 2019 JK. All rights reserved.
//

import Foundation

protocol MessagePrintable {
    var message: String { get }
}

enum MenuScript: Int, CaseIterable {
    case returnChange = 0, addMoney = 1, buyBeverage
    
    var menuScript: String{
        switch self {
            case .returnChange:
                return "잔돈반환종료하기"
            case .addMoney:
                return "금액추가"
            case .buyBeverage:
                return "음료구매"
        }
    }
}

enum MenuError: Error, MessagePrintable {
    
    case invalidForm
    case noNumberGoods
    case notMenu
    case notInt
    case notNegativeNumber
    case notDefine
    
    private var manual: String {
        let sample = "ex) 10,000원 투입 시 --> 1 10000\n     1번음료 구매 시 --> 2 1 \n     잔돈 반환 종료는 --> 0 "
        
        switch self {
        case .invalidForm:
            return "메뉴와 값 사이에 띄워서 입력해주세요.\n \(sample)"
        case .noNumberGoods:
            return "입력한 번호의 음료가 없습니다."
        case .notMenu:
            return "지원하는 메뉴를 입력해주세요."
        case .notInt:
            return "숫자로 입력해주세요.\n \(sample)"
        case .notNegativeNumber:
            return "숫자는 양수로 입력해주세요."
        case .notDefine:
            return "알수 없는 오류입니다."
        }
    }
    
    var message: String {
        return "잘못 입력하셨습니다. \(self.manual)"
    }
    
}

