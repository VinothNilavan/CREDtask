//
//  ImageLibrary.swift
//  TCTask
//
//  Created by Vinoth on 16/07/20.
//  Copyright © 2020 NOVIS. All rights reserved.
//

import Foundation
import UIKit

//Card images provider

class CardImageLibrary {
    
    class func amexImage() -> UIImage {
        return brandImageForCardBrand(CardBrand.AmericanExpress)
    }
    class func dinersClubImage() -> UIImage {
        return brandImageForCardBrand(CardBrand.DinersClub)
    }
    class func discoverImage() -> UIImage {
        return brandImageForCardBrand(CardBrand.Discover)
    }
    class func jcbImage() -> UIImage {
        return brandImageForCardBrand(CardBrand.JCB)
    }
    class func masterCardImage() -> UIImage {
        return brandImageForCardBrand(CardBrand.MasterCard)
    }
    class func unionPayImage() -> UIImage {
        return brandImageForCardBrand(CardBrand.UnionPay)
    }
    class func visaImage() -> UIImage {
        return brandImageForCardBrand(CardBrand.Visa)
    }
    class func visaElectronImage() -> UIImage {
        return brandImageForCardBrand(CardBrand.VisaElectron)
    }
    class func maestroImage() -> UIImage {
        return brandImageForCardBrand(CardBrand.MasterCard)
    }
    class func unknownImage() -> UIImage {
        return brandImageForCardBrand(CardBrand.Unknown)
    }
    class func dankortImage() -> UIImage {
        return brandImageForCardBrand(CardBrand.DinersClub)
    }
    class func errorCardImage() -> UIImage {
        return getCardImage(name: "card_error")
    }

    class func brandImageForCardBrand(_ brand:CardBrand) -> UIImage {
        var imageName = ""
        switch brand {
        case .AmericanExpress:
            imageName = "card_amex"
        case .DinersClub:
            imageName = "card_diners"
        case .Discover:
            imageName = "card_discover"
        case .JCB:
            imageName = "card_jcb"
        case .MasterCard:
            imageName = "card_mastercard"
        case .UnionPay:
            imageName = "card_unionpay_en"
        case .Unknown,.Maestro:
            imageName = "card_unknown"
        case .Visa,.VisaElectron:
            imageName = "card_visa"
        case .Dankort:
            imageName = "card_diners"
        }
        let image = getCardImage(name: imageName)
        return image
    }
    
    class func getCardImage(name:String) -> UIImage {
        
        if let image = UIImage.init(named: name) {
           return image
        }
        return UIImage()
    }
}
