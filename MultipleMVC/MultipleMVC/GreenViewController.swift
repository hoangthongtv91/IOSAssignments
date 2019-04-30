//
//  ViewController.swift
//  MultipleMVC
//
//  Created by Thong Hoang Nguyen on 2019-04-24.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import UIKit

class GreenViewController: UIViewController, UISplitViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        splitViewController?.delegate = self
        splitViewController?.preferredDisplayMode = .allVisible
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}

