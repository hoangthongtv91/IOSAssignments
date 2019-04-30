//
//  CityViewController.swift
//  WeatherTabBar
//
//  Created by Thong Hoang Nguyen on 2019-04-24.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import UIKit

class CityViewController: UIViewController {
    // dependency injection
    var city: City! {
        didSet {
            tabBarItem = UITabBarItem(title: city.name, image: UIImage(named: city.icon!), selectedImage: nil)
        }
    }
    let goDetailsButton: UIButton = {
        let butt = UIButton(type: .infoLight)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.setTitle("Show Details", for: .normal)
        butt.setTitleColor(.black, for: .normal)
        butt.layer.cornerRadius = 10.0
        butt.layer.borderWidth = 2
        butt.backgroundColor = .cyan
        butt.addTarget(self, action: #selector(showDetailVC), for: .touchUpInside)
        return butt
    }()
    
    let backgroundImageView: UIImageView = UIImageView(frame: UIScreen.main.bounds)
    
    @objc private func showDetailVC() {
        let detailVC = DetailViewController()
        detailVC.city = city
        navigationController?.pushViewController(detailVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = city.name
        backgroundImageView.isUserInteractionEnabled = true
        view.addSubview(backgroundImageView)
        backgroundImageView.addSubview(goDetailsButton)
        NSLayoutConstraint.activate([
            backgroundImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            backgroundImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            goDetailsButton.centerXAnchor.constraint(equalTo: backgroundImageView.centerXAnchor),
            goDetailsButton.centerYAnchor.constraint(equalTo: backgroundImageView.centerYAnchor),
      
        ])
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCity))
    }
    
    @objc func addCity() {
        let addCityVC = AddCityViewController()
        navigationController?.pushViewController(addCityVC, animated: true)
    }
}
