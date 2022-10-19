//
//  CreditCardViewModel.swift
//  TCTask
//
//  Created by Vinoth on 16/07/20.
//  Copyright © 2020 NOVIS. All rights reserved.
//

import Foundation
import UIKit

/**
 Credit Card View Model class
**/

class CreditCardViewModel {
    
    func validateCard(totalNumber:String) -> (Bool,CardBrand ) {
        let typeCC = CardValidator.typeCheckingPrefixOnly(creditCardNumber: totalNumber)
        let valid  = CardValidator.validate(creditCardNumber: totalNumber)
        return (valid,typeCC)
    }
    
    func getNumber(_ textFields : [UITextField]) -> String {
        var code = ""
        for view in textFields {
            if let text = view.text {
                code.append(text)
            }
        }
        return code
    }
}
