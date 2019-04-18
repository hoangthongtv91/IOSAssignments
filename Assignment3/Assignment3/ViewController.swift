//
//  ViewController.swift
//  Assignment3
//
//  Created by Thong Hoang Nguyen on 2019-04-18.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(goToFirst))
    }
    
    @objc func goToFirst() {
        self.navigationController?.popToRootViewController(animated: true)
    }


}

