//
//  ViewController.swift
//  SegueStoryBoard
//
//  Created by Thong Hoang Nguyen on 2019-04-25.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var phoneTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "GoSecond":
                if let vc = segue.destination as? SecondViewController {
                    vc.phoneNumber = phoneTextField.text!
                }
            default:
                break
            }
        }
    }
}

