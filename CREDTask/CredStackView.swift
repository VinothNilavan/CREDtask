//
//  CredStackView.swift
//  CREDTask
//
//  Created by Vinoth on 29/09/22.
//

import UIKit

class CredStackView: UIView {
    
    private lazy var titleLbl: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightText
        return label
    }()

    private lazy var subTitleLbl: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .lightText
        return label
    }()

    let credFirstView = CredStackFirstView()
        
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(axis: .vertical)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 4
        return stackView
    }()
    
    private lazy var mainActionView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var actionBtn: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Add credits", for: .normal)
        button.setTitleColor(.lightGray, for: .normal)
        button.tintColor = .systemPurple
        button.backgroundColor = .systemBlue.withAlphaComponent(0.6)
        button.layer.borderWidth = 1
        button.titleLabel?.textAlignment = .center
        button.roundTop(radius: 16)
//        button.addTarget(self, action: #selector(didTapAction), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    @objc func updateTimer() {
        
    }
    
    private func setup() {
        credFirstView.backgroundColor = .systemBlue
        addPinnedSubview(mainActionView, insets: UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0))
        mainActionView.addPinnedSubview(stackView, insets: UIEdgeInsets(top: 44, left: 0, bottom: 0, right: 0))
        stackView.addArrangedSubview(titleLbl)
        stackView.addArrangedSubview(subTitleLbl)
        stackView.addArrangedSubview(credFirstView)
        stackView.addArrangedSubview(actionBtn)
        actionBtn.heightAnchor.constraint(equalToConstant: 66).isActive = true
        titleLbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        subTitleLbl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        credFirstView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: mainActionView.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: mainActionView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: mainActionView.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: mainActionView.bottomAnchor, constant: -16)
        ])
        titleLbl.text = "One "
        subTitleLbl.text = "152312312321567  "
    }
}

class CredStackFirstView: UIView {
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setup() { }
}
