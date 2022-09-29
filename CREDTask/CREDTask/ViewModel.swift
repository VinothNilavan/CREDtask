//
//  ViewModel.swift
//  CREDTask
//
//  Created by Vinoth on 28/09/22.
//

import Foundation

class ViewModel {
    var models = [CredModel]()
    
    init() {
        let model1 = CredModel(title: "Hi, how much you need?",
                              subTitle: "move the dial and set any amount you need upto ₹ 50000", buttonTitle: "Proceed to EMI selection", stateType: CredState.collapsed)
        let model2 = CredModel(title: "how do you wish to repay?",
                              subTitle: "Choose one of our recommended plans or make your own", buttonTitle: "Select your bank account", stateType: CredState.collapsed)
        let model3 = CredModel(title: "where should we send the money?",
                              subTitle: "amount will be credited to this bank account, EMI will also be debited from this bank account", buttonTitle: "Tap for 1-click KYC", stateType: CredState.collapsed)
        models = [model1, model2, model3]
    }
}
