//
//  Model.swift
//  CREDTask
//
//  Created by Vinoth on 28/09/22.
//

import Foundation

struct CredModel {
    let title: String?
    let subTitle: String?
    let buttonTitle: String?
    var stateType: CredState = .expanded
}
