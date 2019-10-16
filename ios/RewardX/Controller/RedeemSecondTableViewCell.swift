
import UIKit

class RedeemSecondTableViewCell: UITableViewCell {
    var RedeemData : RedeemModel?
    
    @IBOutlet var redeemSecondCollectionView: UICollectionView!
    @IBOutlet var collectionViewHeight: NSLayoutConstraint!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        redeemSecondCollectionView.dataSource = self
        redeemSecondCollectionView.delegate = self
      
        
        print(RedeemData)
        if (RedeemData?.data?.count) ?? 1%2 == 0{
            collectionViewHeight.constant = CGFloat(Int((RedeemData?.data?.count) ?? 1/2) * 215)
        }else{
            collectionViewHeight.constant = CGFloat(((RedeemData?.data?.count) ?? 1/2) * 215) + 215
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension RedeemSecondTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (RedeemData?.data?.count) ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.Keys.cell.rawValue, for: indexPath) as! RedeemSecondCollectionViewCell
        cell.imgBrand.dowloadFromServer(link: (RedeemData?.data?[indexPath.row].logoLink ?? "1"), contentMode: .scaleAspectFit)
        cell.lblBrandName.text = RedeemData?.data?[indexPath.row].vendorName
        cell.lblTotalPoints.text = String((RedeemData?.data?[indexPath.row].totalPoints)!) + Constant.Keys.points.rawValue
        return cell
    }
}
