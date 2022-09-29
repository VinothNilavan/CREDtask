//
//  CredStackView.swift
//  CREDTask
//
//  Created by Vinoth on 28/09/22.
//

import UIKit

class CredStackView: UIView {
    
    var mainActionView: UIView!
    var titleLbl: UILabel!
    var subTitleLbl: UILabel!
    let creaFirstView = CredStackFirstView()
    
    private lazy var actionBtn: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add credits", for: .normal)
        button.setTitleColor(.purple, for: .normal)
        button.tintColor = .purple
        button.backgroundColor = .clear
        button.layer.borderWidth = 1
        button.titleLabel?.textAlignment = .center
        button.roundTop(radius: 6)
//        button.addTarget(self, action: #selector(didTapAction), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        creaFirstView.backgroundColor = .systemBlue
        addSubview(creaFirstView)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setup() {
        addPinnedSubview(mainActionView)
        mainActionView.addPinnedSubview(actionBtn, height: 44)
        
        NSLayoutConstraint.activate([
            actionBtn.heightAnchor.constraint(equalToConstant: 44),
            actionBtn.leadingAnchor.constraint(equalTo: mainActionView.leadingAnchor),
            actionBtn.trailingAnchor.constraint(equalTo: mainActionView.trailingAnchor),
            actionBtn.bottomAnchor.constraint(equalTo: mainActionView.bottomAnchor)
        ])
    }
}

class CredStackFirstView: UIView {
    @IBOutlet weak var circularSlider: CircularSlider!
}
