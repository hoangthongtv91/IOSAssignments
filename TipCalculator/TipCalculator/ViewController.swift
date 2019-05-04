//
//  ViewController.swift
//  TipCalculator
//
//  Created by Thong Hoang Nguyen on 2019-04-30.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var billAmountTextField: UITextField!
    @IBOutlet var tipAmountLabel: UILabel!
    @IBOutlet var stackView: UIStackView!
    lazy var stackViewConstraints: [NSLayoutConstraint] = [
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    ]
    
    var tipPercentage: Float = 0, billAmount: Float = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(stackViewConstraints)
        let center = NotificationCenter.default
        center.addObserver(self, selector: #selector(keyboardWillBeShown(note:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        center.addObserver(self, selector: #selector(keyboardWillBeHidden(note:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        setTipAmountLabel()
        
        billAmountTextField.delegate = self
        hideKeyboardWhenTappedAround()
    }


    fileprivate func setTipAmountLabel() {
        tipAmountLabel.text = "$\(billAmount * tipPercentage / 100)"
    }
    @IBAction func adjustTipPercentage(_ sender: UISlider) {
        tipPercentage = sender.value
        setTipAmountLabel()
    }
    
    @objc func keyboardWillBeShown(note: Notification) {
        let info = note.userInfo
        let keyboardSize: CGRect = info![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        view.frame.origin.y -= keyboardSize.height / 3
        
    }
    
    @objc func keyboardWillBeHidden(note: Notification) {
        let info = note.userInfo
        let keyboardSize: CGRect = info![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
        view.frame.origin.y += keyboardSize.height / 3
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if let text = textField.text {
            let textRange = Range(range, in: text)
            billAmount = Float(text.replacingCharacters(in: textRange!, with: string))!
            setTipAmountLabel()
        }
        return true
    }
}

extension UIViewController {
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
