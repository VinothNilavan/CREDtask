//
//  CredStackView.swift
//  CREDTask
//
//  Created by Vinoth on 28/09/22.
//

import UIKit

class CredStackView: UIView {
    
    var mainActionView: UIView!
    var actionBtn: UIButton!
    var titleLbl: UILabel!
    var subTitleLbl: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
