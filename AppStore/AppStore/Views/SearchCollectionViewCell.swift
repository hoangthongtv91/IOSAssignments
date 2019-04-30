//
//  SearchCollectionViewCell.swift
//  AppStore
//
//  Created by Thong Hoang Nguyen on 2019-04-29.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    let iconImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .blue
        iv.widthAnchor.constraint(equalToConstant: 64).isActive = true
        iv.heightAnchor.constraint(equalToConstant: 64).isActive = true
        iv.layer.cornerRadius = 12
        return iv
    }()

    let nameLabel: UILabel = {
       let lb = UILabel()
        lb.text = "Instagram"
        return lb
    }()
    
    let categoryLabel: UILabel = {
        let lb = UILabel()
        lb.text = "photo & video"
        return lb
    }()
    
    let ratingsLabel: UILabel = {
        let lb = UILabel()
        lb.text = "991k"
        return lb
    }()
    
    let getButton: UIButton = {
        let butt = UIButton(type: .system)
        butt.setTitle("GET", for: .normal)
        butt.setTitleColor(.blue, for: .normal)
        butt.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        butt.backgroundColor = UIColor(white: 0.95, alpha: 1)
        butt.widthAnchor.constraint(equalToConstant: 80).isActive = true
        butt.heightAnchor.constraint(equalToConstant: 32).isActive = true
        butt.layer.cornerRadius = 16
        return butt
    }()
    lazy var screenshot1ImageView = createScreenShotImageView()
    lazy var screenshot2ImageView = createScreenShotImageView()
    lazy var screenshot3ImageView = createScreenShotImageView()
    
    fileprivate func createScreenShotImageView() -> UIImageView {
        let iv = UIImageView()
        iv.backgroundColor = .green
        iv.layer.cornerRadius = 7
        return iv
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        let labelStackView = UIStackView(arrangedSubviews: [nameLabel, categoryLabel, ratingsLabel])
        labelStackView.axis = .vertical
        
        let appInfoStackView = UIStackView(arrangedSubviews: [iconImageView, labelStackView, getButton])
        appInfoStackView.spacing = 12
        appInfoStackView.alignment = .center
        
        let screenshotStackView = UIStackView(arrangedSubviews: [screenshot1ImageView, screenshot2ImageView, screenshot3ImageView])
        screenshotStackView.spacing = 12
        screenshotStackView.distribution = .fillEqually
        
        let wholeStackView = UIStackView(arrangedSubviews: [appInfoStackView, screenshotStackView])
        wholeStackView.axis = .vertical
        
        addSubview(wholeStackView)
        wholeStackView.spacing = 16
        wholeStackView.matchParent(padding: UIEdgeInsets.init(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


