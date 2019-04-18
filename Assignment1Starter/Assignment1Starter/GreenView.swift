//
//  GreenView.swift
//  Assignment1Starter
//
//  Created by Thong Hoang Nguyen on 2019-04-18.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import UIKit

class GreenView: UIView {
    let purpleBar: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .purple
        return v
    }()
    
    let blueStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [UIView(), createBlueView(), createBlueView(), createBlueView(), UIView()])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        sv.distribution = .equalSpacing
        sv.alignment = .center
        return sv
    }()
    
    let redView: UIView = {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .red
        let orangeView1 = UIView(frame: CGRect(x: 10, y: 10, width: 150, height: 60))
        orangeView1.backgroundColor = .orange
        
        let orangeView2 = UIView(frame: CGRect(x: 170, y: 10, width: 80, height: 60))
        orangeView2.backgroundColor = .orange
        
        v.addSubview(orangeView1)
        v.addSubview(orangeView2)
        return v
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .green
        setupPurpleView()
        setupBlueStackView()
        setupRedView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //define all the subviews and setup functions
    // then initialize the grrenview and assign it to mainview in viewController
    
    fileprivate func setupPurpleView() {
        addSubview(purpleBar)
        NSLayoutConstraint.activate([
            purpleBar.heightAnchor.constraint(equalToConstant: 50),
            purpleBar.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.6),
            purpleBar.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            purpleBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
        ])
    }
    
    fileprivate static func createBlueView() -> UIView {
        let v = UIView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = .blue
        NSLayoutConstraint.activate([
            v.widthAnchor.constraint(equalToConstant: 80),
            v.heightAnchor.constraint(equalToConstant: 80)
        ])
        return v
    }
    
    fileprivate func setupBlueStackView() {
        addSubview(blueStackView)
        NSLayoutConstraint.activate([
            blueStackView.heightAnchor.constraint(equalTo: heightAnchor),
            blueStackView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    fileprivate func setupRedView() {
        addSubview(redView)
        NSLayoutConstraint.activate([
            redView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            redView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            redView.heightAnchor.constraint(equalToConstant: 80),
            redView.widthAnchor.constraint(equalToConstant: 260)
        ])
    }
}
