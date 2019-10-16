//
//  RewardsViewControllerTableViewCell.swift
//  RewardX
//
//  Created by somnath panda on 21/08/19.
//  Copyright © 2019 somnath panda. All rights reserved.
//

import UIKit

class RewardsViewControllerTableViewCell: UITableViewCell {

    @IBOutlet weak var lblRewardTitle: UILabel!
    @IBOutlet weak var lblRewardDate: UILabel!
    @IBOutlet weak var lblMembershipID: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
