//
//  CreditCardViewController.swift
//  TCTask
//
//  Created by Vinoth on 16/07/20.
//  Copyright © 2020 NOVIS. All rights reserved.
//

import UIKit

class CreditCardViewController: UIViewController {

    @IBOutlet weak var baseHolderView: UIView!
    @IBOutlet weak var errorLbl: UILabel!
    @IBOutlet weak var cardHolderView: UIView!
    @IBOutlet weak var cardTypeImageView: UIImageView!
    @IBOutlet weak var dividerImageView1: UIImageView!
    @IBOutlet weak var dividerImageView2: UIImageView!
    @IBOutlet weak var dividerImageView3: UIImageView!

    var textFields = [UITextField]()

    @IBOutlet weak var cardNumbersStackView: UIStackView!
    
    var editingCardType = CardBrand.Unknown
    
    private var viewModel = CreditCardViewModel()
    
    private func initialise() {
        
        cardHolderView.cornerRadius()
        cardTypeImageView.cornerRadius(1,0.3,.white)
        textFields = cardNumbersStackView.subviews.filter({$0 is UITextField}) as? [UITextField] ?? []
        for tx in textFields {
            tx.addTarget(self, action: #selector(self.textChanged(_:)), for: .editingChanged)
            let placeHodlerColor     = UIColor.init(white: 1, alpha: 0.5)
            let attrits              = [NSAttributedString.Key.foregroundColor: placeHodlerColor]
            tx.attributedPlaceholder = NSAttributedString(string: "X", attributes: attrits)
        }
        getNormalFormat()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialise()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    deinit {
    }
}

extension CreditCardViewController : UITextFieldDelegate {

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        if textField.text?.count ?? 0 > 0 {
            let cha   = textField.text
            textField.text = nil
            DispatchQueue.main.async {
                textField.text  = cha
                textField.becomeFirstResponder()
            }
        }
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func resetTags() {
        let stackSubs = cardNumbersStackView.subviews.filter { (tf) -> Bool in
            let flag = ( tf.isHidden == false && tf is UITextField)
            return flag
        }
        textFields  = stackSubs as? [UITextField] ?? []
        var tagTf = 0
        for textField_ in textFields {
            tagTf += 1
            textField_.tag = tagTf
        }
    }
    
    func getDinnersclubFormat() {
        let text   = cardNumbersStackView.subviews.filter({$0 is UITextField})
        dividerImageView2.isHidden  = true
        for texfFld  in text {
            texfFld.isHidden  = false
            if texfFld.tag == 10 || texfFld.tag == 11 || texfFld.tag == 17 {
                texfFld.isHidden = true
            }
        }
        textFields  =  cardNumbersStackView.subviews.filter({$0 is UITextField}) as? [UITextField] ?? []
        resetTags()
    }
    
    func getAMEXFormat() {
        let text   = cardNumbersStackView.subviews.filter({$0 is UITextField})
        dividerImageView2.isHidden  = true
        for texfFld  in text {
            texfFld.isHidden  = false
            if texfFld.tag == 10 || texfFld.tag == 11 {
                texfFld.isHidden = true
            }
        }
        textFields  =  cardNumbersStackView.subviews.filter({$0 is UITextField}) as? [UITextField] ?? []
        resetTags()
    }
    
    func getNormalFormat() {
        let text   = cardNumbersStackView.subviews.filter({$0 is UITextField})
        dividerImageView2.isHidden  = false
        for texfFld  in text {
            texfFld.isHidden  = false
            if texfFld.tag == 17 {
                texfFld.isHidden = true
            }
        }
        textFields  =  cardNumbersStackView.subviews.filter({$0 is UITextField}) as? [UITextField] ?? []
        resetTags()
    }
    
    fileprivate func forceNextTFFocus(_ textField: UITextField) {
        textField.resignFirstResponder()
        textField.text = String(textField.text!.last!)
        if let index = textFields.firstIndex(where: { (textf) -> Bool in return textf.tag == textField.tag }) {
            let tag = textFields[index].tag
            if  textFields.count >= tag + 1  {
                let nextText = textFields[tag]
                nextText.becomeFirstResponder()
            }
        }
    }
    
    fileprivate func previousTFFocus(_ textField: UITextField) {
        for index in stride(from: textFields.count - 1 , to: 00, by: -1) {
            let txf = textFields[index]
            if txf.tag == textField.tag , txf.tag != 1 {
                if let index = textFields.firstIndex(where: { (textf) -> Bool in return textf.tag == textField.tag }) {
                    let tag = textFields[index-1].tag
                    if tag-1 >= 0   {
                        let nextText = textFields[tag-1]
                        nextText.becomeFirstResponder()
                    }
                }
                break
            }
        }
    }
    
    fileprivate func nextTextFieldsFocus(_ textField: UITextField, _ typeCC: CardBrand) {
        for txf in textFields {
            if txf.tag == textField.tag {
                let tagTF = typeCC == .AmericanExpress ? 17 : 16
                if txf.tag == tagTF {
                    txf.resignFirstResponder()
                    break
                }
                if let index = textFields.firstIndex(where: { (textf) -> Bool in return textf.tag == textField.tag }) {
                    let tag = textFields[index].tag
                    if  textFields.count  >= tag+1  {
                        let nextText = textFields[tag]
                        nextText.becomeFirstResponder()
                        break
                    }
                }
            }
        }
    }
    
    @objc func textChanged(_ textField : UITextField) {
        
        let totalNumber = viewModel.getNumber(textFields)
        let type        = viewModel.validateCard(totalNumber: totalNumber)
        let typeCC      = type.1
        let valid       = type.0
        
        if editingCardType != typeCC {
            editingCardType = typeCC
            switch typeCC {
            case .AmericanExpress:
                getAMEXFormat()
            case .DinersClub:
                getDinnersclubFormat()
            default:
                getNormalFormat()
            }
        }
        
        if typeCC == .Unknown {
            cardTypeImageView.cornerRadius(1,0.3,.white)
        }
        else {
            cardTypeImageView.cornerRadius(0,0.3,.clear)
        }
        
        let currentCharacterCount = textField.text?.count ?? 0

        if currentCharacterCount == 1 {
            nextTextFieldsFocus(textField, typeCC)
        }
        else if currentCharacterCount > 1 {
            forceNextTFFocus(textField)
        }
        else {
            previousTFFocus(textField)
         }
        
        if totalNumber.count > 11 {
            errorLbl.isHidden = valid
        }
        else {
            errorLbl.isHidden = true
        }
        
        cardTypeImageView.image = CardImageLibrary.brandImageForCardBrand(typeCC)

        if totalNumber.count > 12, !valid {
            cardTypeImageView.image = CardImageLibrary.errorCardImage()
        }
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print(textField.text ?? "" )
        return true
    }
}
