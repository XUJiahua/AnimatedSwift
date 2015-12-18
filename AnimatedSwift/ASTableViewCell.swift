//
//  ASTableViewCell.swift
//  AnimatedSwift
//
//  Created by XuJiahua on 15/12/18.
//  Copyright © 2015年 hellojohn. All rights reserved.
//

import UIKit

class ASTableViewCell: UITableViewCell {
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var titleLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
