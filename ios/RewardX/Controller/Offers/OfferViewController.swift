
import UIKit

class OfferViewController: UIViewController {

    
    @IBOutlet var offersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension OfferViewController:UITableViewDelegate,UITableViewDataSource{

    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }else if section == 1{
            return 1
        }else{
            return 5
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            return cell
        }else if indexPath.section == 1{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellFirst", for: indexPath) as! OffersTableViewCell
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellSecond", for: indexPath) as! OffersSecondTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 2{
            let wellnessOfferVC = self.storyboard?.instantiateViewController(withIdentifier: "WellnessOfferViewController") as! WellnessOfferViewController
            self.navigationController?.pushViewController(wellnessOfferVC, animated: true)
        }
    }
}
