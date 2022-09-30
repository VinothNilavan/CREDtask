//
//  ViewController.swift
//  CREDTask
//
//  Created by Vinoth on 29/09/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var infoBtn: UIButton!
    @IBOutlet weak var closeBtn: UIButton!
    var creadView = CredStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoBtn.roundCorners()
        closeBtn.roundCorners()
        infoBtn.backgroundColor = .darkGray.withAlphaComponent(0.5)
        closeBtn.backgroundColor = .darkGray.withAlphaComponent(0.5)
        self.view = creadView
    }
}
