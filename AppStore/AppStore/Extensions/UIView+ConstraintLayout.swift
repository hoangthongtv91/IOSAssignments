//
//  UIView+ConstraintLayout.swift
//  AppStore
//
//  Created by Thong Hoang Nguyen on 2019-04-29.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import UIKit

extension UIView {
    func matchParent(padding: UIEdgeInsets = .zero) {
        translatesAutoresizingMaskIntoConstraints = false
        if let superTopAnchor = superview?.topAnchor {
            topAnchor.constraint(equalTo: superTopAnchor, constant: padding.top).isActive = true
        }
        if let superBottomAnchor = superview?.bottomAnchor {
            bottomAnchor.constraint(equalTo: superBottomAnchor, constant: -padding.bottom).isActive = true
        }
        if let superLeadingAnchor = superview?.leadingAnchor {
            leadingAnchor.constraint(equalTo: superLeadingAnchor, constant: padding.left).isActive = true
        }
        if let superTrailingAnchor = superview?.trailingAnchor {
            trailingAnchor.constraint(equalTo: superTrailingAnchor, constant: -padding.right).isActive = true
        }
    }
}
