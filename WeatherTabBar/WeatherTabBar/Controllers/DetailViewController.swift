//
//  ViewController.swift
//  WeatherTabBar
//
//  Created by Thong Hoang Nguyen on 2019-04-24.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var city: City! {
        didSet {
            cityLabel.text = city.name
            countryLabel.text = city.country
            tempLabel.text = "Teperature: \(city.temp) ºC"
            summaryLabel.text = city.summary
            imageView.image = UIImage(named: city.weatherPhoto!)
        }
    }
    
    let cityLabel = createLabel(withSize: 50)
    let countryLabel = createLabel(withSize: 25)
    let tempLabel = createLabel(withSize: 30)
    let summaryLabel = createLabel(withSize: 30)
    let imageView = UIImageView(frame: UIScreen.main.bounds)

    override func viewDidLoad() {
        super.viewDidLoad()
        let stackView: UIStackView = {
            let stack = UIStackView(arrangedSubviews: [cityLabel, countryLabel, tempLabel, summaryLabel])
            stack.translatesAutoresizingMaskIntoConstraints = false
            stack.axis = .vertical
            stack.distribution = .equalSpacing
            stack.spacing = 15
            stack.alignment = .center
            return stack
        }()
        view.addSubview(imageView)
        view.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    fileprivate static func createLabel(withSize: CGFloat) -> UILabel {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = label.font.withSize(withSize)
        return label
    }
}

