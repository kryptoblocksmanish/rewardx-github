
import UIKit

class ProductDetailsViewController: UIViewController {

    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var rewardPointsLabel: UILabel!
    @IBOutlet weak var expiryDateLabel: UILabel!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var quantityRewardLabel: UILabel!
    @IBOutlet weak var productDetailView: UIView!

    var productImage:String = ""
    var rewadPoint:String = ""
    var expiryDate:Int = 0
    var productName:String = ""
    var quantityReward:String = ""
    
    
    class func loadViewController() -> ProductDetailsViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "ProductDetailsViewControllerID") as! ProductDetailsViewController
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productImageView.dowloadFromServer(link: productImage, contentMode: .scaleAspectFit)
        rewardPointsLabel.text = rewadPoint
//        expiryDateLabel.text = expiryDate
        productNameLabel.text = quantityReward
        quantityRewardLabel.text = productName
        
        productDetailView.layer.cornerRadius = 15
        productDetailView.layer.borderWidth = 1
        productDetailView.layer.borderColor = UIColor.gray.cgColor
        
        let s = expiryDate
        
        let date = NSDate(timeIntervalSince1970: Double(s) / 1000)
        let formatter = DateFormatter()
        formatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
        formatter.dateFormat = "dd MMMM yyyy"
        expiryDateLabel.text = formatter.string(from: date as Date)
        print(formatter.string(from: date as Date))
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
