//
//  VenderListViewControllerTableViewCell.swift
//  RewardX
//
//  Created by somnath panda on 21/08/19.
//  Copyright © 2019 somnath panda. All rights reserved.
//

import UIKit

class VenderListViewControllerTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgVendor: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
