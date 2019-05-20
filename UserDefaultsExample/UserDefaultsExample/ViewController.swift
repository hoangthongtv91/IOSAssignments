//
//  ViewController.swift
//  UserDefaultsExample
//
//  Created by Thong Hoang Nguyen on 2019-05-13.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var bluetoothSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = UserDefaults.standard
        if defaults.object(forKey: "switch") != nil {
            bluetoothSwitch.isOn = defaults.bool(forKey: "switch")
        }
    }

    @IBAction func saveSwitchState(_ sender: UISwitch) {
        //1. Get the user default object
        let defaults = UserDefaults.standard
        
        //2. Save the state
        if sender.isOn {
            defaults.set(true, forKey: "switch")
        } else {
            defaults.set(false, forKey: "switch")
        }
    }
    
}

