//
//  NameCell.swift
//  TableViewDemo1
//
//  Created by Thong Hoang Nguyen on 2019-04-26.
//  Copyright © 2019 Thong Hoang Nguyen. All rights reserved.
//

import UIKit

class NameCell: UITableViewCell {
    @IBOutlet var nameCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
