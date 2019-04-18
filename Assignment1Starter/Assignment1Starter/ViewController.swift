//
//  ViewController.swift
//  Assignment1Starter
//
//  Created by Thong Hoang Nguyen on 2019-04-17.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let mainView: UIView = GreenView()
    
    var activeConstraints: [NSLayoutConstraint] = [] {
        willSet {
            NSLayoutConstraint.deactivate(activeConstraints)
        }
        didSet {
            NSLayoutConstraint.activate(activeConstraints)
        }
    }
    fileprivate func setupLayout() {
        view.addSubview(mainView)
        //set constraints for the mainView (x, y, w, h)
        activeConstraints = [mainView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
                             mainView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.7)
        ]
        mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

        //create a stackview
        let buttStackView = UIStackView(arrangedSubviews: [
            createButton(title: "Square", selector: #selector(squareTapped), fontSize: 14),
            createButton(title: "Portrait", selector: #selector(portraitTapped), fontSize: 14),
            createButton(title: "Landscape", selector: #selector(landscapeTapped), fontSize: 14)
        ])
        buttStackView.translatesAutoresizingMaskIntoConstraints = false
        buttStackView.axis = .horizontal
        buttStackView.distribution = .fillEqually
        buttStackView.alignment = .center
        view.addSubview(buttStackView)
        
        NSLayoutConstraint.activate([
            buttStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            buttStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttStackView.widthAnchor.constraint(equalTo: view.widthAnchor),
            buttStackView.heightAnchor.constraint(equalToConstant: 70)
            ])
    }
    @objc func squareTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 1.0){
            self.activeConstraints = [self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9),
                                 self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.9)
            ]
            self.view.layoutIfNeeded()
        }
    }
    @objc func portraitTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 1.0){
            self.activeConstraints = [self.mainView.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.6),
                                      self.mainView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7)
            ]
            self.view.layoutIfNeeded()
        }
    }
    @objc func landscapeTapped() {
        view.layoutIfNeeded()
        UIView.animate(withDuration: 1.0){
            self.activeConstraints = [self.mainView.widthAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.7),
                                      self.mainView.heightAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.6)
            ]
            self.view.layoutIfNeeded()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        
    }
    
    fileprivate func createButton(title: String, selector: Selector, fontSize: CGFloat) -> UIButton {
        let butt = UIButton(type: .system)
        butt.setTitle(title, for: .normal)
        butt.translatesAutoresizingMaskIntoConstraints = false
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: fontSize)
        butt.addTarget(self, action: selector, for: .touchUpInside)
        return butt
    }
}

