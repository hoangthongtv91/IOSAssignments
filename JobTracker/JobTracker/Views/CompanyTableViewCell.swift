//
//  CompanyTableViewCell.swift
//  JobTracker
//
//  Created by Thong Hoang Nguyen on 2019-05-17.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import UIKit

class CompanyTableViewCell: UITableViewCell {
    var company: Company! {
        didSet {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "MMM dd, yyyy"
            companyLabel.text = "\(company.name ?? "")"
            if let applied = company.applied {
                appliedDateLabel.text = "Applied: \(dateFormatter.string(from: applied))"
            }
            if let imageData = company.imageData {
                companyImageView.image = UIImage(data: imageData)
            }
        }
    }
    let companyImageView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "placeholder"))
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.cornerRadius = 10
        iv.layer.borderColor = UIColor.spaceGray.cgColor
        iv.layer.borderWidth = 5
        iv.clipsToBounds = true
        return iv
    }()
    let companyLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "Company Name"
        lb.font = UIFont.boldSystemFont(ofSize: 18)
        lb.textColor = .white
        return lb
    }()
    let appliedDateLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "May 16, 2019"
        lb.font = UIFont.italicSystemFont(ofSize: 16)
        lb.textColor = .white
        return lb
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .black
        addSubview(companyImageView)
        NSLayoutConstraint.activate([
            companyImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            companyImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            companyImageView.widthAnchor.constraint(equalToConstant: 60),
            companyImageView.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        
        let vStackView = UIStackView(arrangedSubviews: [companyLabel, appliedDateLabel])
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        vStackView.axis = .vertical
        vStackView.distribution = .fillEqually
        
        addSubview(vStackView)
        NSLayoutConstraint.activate([
            vStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            vStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            vStackView.leadingAnchor.constraint(equalTo: companyImageView.trailingAnchor, constant: 10)
        ])
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: animated)
    }

}
