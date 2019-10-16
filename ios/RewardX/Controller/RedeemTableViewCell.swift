
import UIKit

class RedeemTableViewCell: UITableViewCell {

    @IBOutlet var redeemOfferCollectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        redeemOfferCollectionView.dataSource = self
        redeemOfferCollectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

extension RedeemTableViewCell:UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! RedeemCollectionViewCell
        return cell
    }
}
