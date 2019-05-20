//
//  UIVIewController+ChildViewController.swift
//  AppStore
//
//  Created by Thong Hoang Nguyen on 2019-05-08.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import UIKit

extension UIViewController {
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.view.matchParent()
        child.didMove(toParent: self)
        
    }
    func remove() {
        guard parent != nil else { return }
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
