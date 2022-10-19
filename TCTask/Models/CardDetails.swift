//
//  CardDetails.swift
//  TCTask
//
//  Created by Vinoth on 16/07/20.
//  Copyright © 2020 NOVIS. All rights reserved.
//

import Foundation

enum CardBrand: Int,CaseIterable {
    
        case AmericanExpress
        case Dankort
        case DinersClub
        case Discover
        case JCB
        case Maestro
        case MasterCard
        case UnionPay
        case VisaElectron
        case Visa
        case Unknown

    var regex : String {
        switch self {
        case .AmericanExpress:
            return "^3[47][0-9]{5,}$"
        case .Visa:
            return "^4[0-9]{6,}([0-9]{3})?$"
        case .MasterCard:
            return "^(5[1-5][0-9]{4}|677189)[0-9]{5,}$"
        case .DinersClub:
            return "^3(?:0[0-5]|[68][0-9])[0-9]{4,}$"
        case .Discover:
            return "^6(?:011|5[0-9]{2})[0-9]{3,}$"
        case .JCB:
            return "^(?:2131|1800|35[0-9]{3})[0-9]{3,}$"
        case .UnionPay:
            return "^(62|88)[0-9]{5,}$"
        case .Maestro:
            return "^(606282|3841)[0-9]{5,}$"
        case .VisaElectron:
            return "^((((636368)|(438935)|(504175)|(451416)|(636297))[0-9]{0,10})|((5067)|(4576)|(4011))[0-9]{0,12})$"
        default:
            return ""
        }
    }
    var description : String {
        switch self {
        case .AmericanExpress:
            return "american express"
        case .DinersClub:
            return "diners club"
        case .Discover:
            return "discover"
        case .JCB:
            return "jcb"
        case .MasterCard:
            return "mastercard"
        case .UnionPay:
            return "unionpay"
        case .Visa:
            return "visa"
        case .Unknown:
            return "unknown"
        case .Maestro:
            return "maestro"
        case .Dankort:
            return "dankort"
        case .VisaElectron:
            return "visaelectron"
        }
    }
}
