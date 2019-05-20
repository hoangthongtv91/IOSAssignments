//
//  ViewController.swift
//  Carthage_Test
//
//  Created by Thong Hoang Nguyen on 2019-05-09.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import UIKit
class ViewController: UIViewController {
    let signatureView = EPSignatureView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(signatureView)
        signatureView.translatesAutoresizingMaskIntoConstraints = false
        signatureView.strokeColor = .black
        signatureView.strokeWidth = 2
        NSLayoutConstraint.activate([
            signatureView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            signatureView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
            signatureView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor),
            signatureView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }
}

