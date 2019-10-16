
import UIKit

class ActivityTableViewCell: UITableViewCell {
    @IBOutlet weak var imgActivity: UIImageView!
    
    @IBOutlet weak var lblCompanyName: UILabel!
    @IBOutlet weak var lblTotalPoints: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
