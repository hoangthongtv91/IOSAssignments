//
//  AddCityViewController.swift
//  WeatherTabBar
//
//  Created by Thong Hoang Nguyen on 2019-04-27.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import UIKit

class AddCityViewController: UIViewController {
    let cityTextField = createTextField(frame: CGRect(x: 0, y: 0, width: 500, height: 30), placeholder: "City", keyboardType: nil)
    let countryTextField = createTextField(frame: CGRect(x: 0, y: 0, width: 500, height: 30), placeholder: "Country", keyboardType: nil)
    let tempTextField = createTextField(frame: CGRect(x: 0, y: 0, width: 500, height: 30), placeholder: "Temperature", keyboardType: .numberPad)
    let summaryTextField = createTextField(frame: CGRect(x: 0, y: 0, width: 500, height: 30), placeholder: "Summary", keyboardType: nil)
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [cityTextField, countryTextField, tempTextField, summaryTextField])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = UIStackView.Alignment.leading
        stackView.distribution = .equalSpacing
        stackView.spacing = 30
        return stackView
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(stackView)
        view.backgroundColor = .white
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(createNewCity))
    }
    
    fileprivate static func createTextField(frame: CGRect, placeholder: String?, keyboardType: UIKeyboardType?) -> UITextField {
        let textField = UITextField(frame: frame)
        textField.translatesAutoresizingMaskIntoConstraints = false
        if let placeholder = placeholder {
            textField.placeholder = placeholder
        }
        if let keyboardType = keyboardType {
            textField.keyboardType = keyboardType
        }
        textField.font = textField.font?.withSize(17)
        textField.backgroundColor = .white
        textField.widthAnchor.constraint(equalToConstant: 300).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 30))
        textField.leftView = leftView
        textField.leftViewMode = .always
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOffset = CGSize(width: 0, height: 0.8)
        textField.layer.shadowOpacity = 1
        textField.layer.shadowRadius = 0
        
        return textField
    }
    @objc func createNewCity() {
        let city = City(name: cityTextField.text!, country: countryTextField.text!, temp: Double(Int(tempTextField.text!)!), icon: "japan", summary: summaryTextField.text!, weatherPhoto: nil)
        let newCityVC = CityViewController()
        newCityVC.city = city
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.citiesVC.add(newCityVC)
    }
}
