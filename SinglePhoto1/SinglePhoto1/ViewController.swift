//
//  ViewController.swift
//  SinglePhoto1
//
//  Created by Thong Hoang Nguyen on 2019-04-15.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        let width = view.frame.size.width
        let height = view.frame.size.height
        var nextButton = UIButton(frame: CGRect(x: width / 2 - 50, y: height / 2 - 50, width: 100, height: 100))
        nextButton.addTarget(self, action: #selector(pushToNextVC), for: .touchUpInside)
        view.addSubview(nextButton)
        nextButton.backgroundColor = .black
    }

    @objc func pushToNextVC() {
        let nextVC = NextViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
}

