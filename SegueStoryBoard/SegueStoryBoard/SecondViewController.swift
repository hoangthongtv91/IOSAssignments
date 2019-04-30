//
//  SecondViewController.swift
//  SegueStoryBoard
//
//  Created by Thong Hoang Nguyen on 2019-04-25.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet var phoneLabel: UILabel! {
        didSet {
            phoneLabel.text = phoneNumber
        }
    }
    var phoneNumber: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
