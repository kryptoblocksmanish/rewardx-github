
import UIKit


class RedeemViewController: UIViewController {
    var modelData : RedeemModel?
   // var delegate : BranDataDelegate?
    
    @IBOutlet weak var tblRedeem: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblRedeem.tableFooterView = UIView()
        getAllOffers()
    }
    //MARK:- Backend Api Call
    func getAllOffers() {
        let session = URLSession.shared
       // let url = URL(string: Constant.ApiUrl.baseUrl.rawValue + Constant.ApiUrl.offerUrl.rawValue + TempDataStore.sharedInstance.UserUDID)!
        let url = URL(string: Constant.ApiUrl.baseUrl.rawValue + Constant.ApiUrl.redeemUrl.rawValue + "23jvfuc4gjzb4uil4")!
        
        let task = session.dataTask(with: url) { data, response, error in
            
            if error != nil || data == nil {
                DispatchQueue.main.async {
                    
                    let alert = UIAlertController(title:Constant.ApiErrorKeys.serverError.rawValue, message: nil, preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: Constant.AlertKeys.OK.rawValue, style: .default, handler: nil))
                    
                    self.present(alert, animated: true)
                    
                }
                return
            }
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print(dataString)
                let jsonData = Data(dataString.utf8)
                let decoder = JSONDecoder()
                do {
                    let people = try decoder.decode(RedeemModel.self, from: jsonData)
                    self.modelData = people
                    print("reddem response -->\(self.modelData)")
                    if let status = self.modelData?.status{
                        if status == 200 {
                            DispatchQueue.main.async {
                                self.tblRedeem.reloadData()
                            }
//                            self.delegate?.getAllBrandData(ModelData: self.modelData)
                        
//                            if self.delegate != nil {
//
//
//                            }
                         
                        }  else {
                            DispatchQueue.main.async {
                                
                                let alert = UIAlertController(title: Constant.ApiErrorKeys.serverError.rawValue, message: nil, preferredStyle: .alert)
                                
                                alert.addAction(UIAlertAction(title: Constant.AlertKeys.OK.rawValue, style: .default, handler: nil))
                                
                                self.present(alert, animated: true)
                                
                            }
                        }
                        
                        
                    }
                } catch {
                    print(error.localizedDescription)
                    DispatchQueue.main.async {
                        
                        let alert = UIAlertController(title: error.localizedDescription, message: nil, preferredStyle: .alert)
                        
                        alert.addAction(UIAlertAction(title: Constant.AlertKeys.OK.rawValue, style: .default, handler: nil))
                        
                        self.present(alert, animated: true)
                        
                    }
                }
            }
        }
        task.resume()
        
    }
}

extension RedeemViewController:UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            cell.selectionStyle = .none
            return cell
        }
//        else if indexPath.section == 1{
//            let cell = tableView.dequeueReusableCell(withIdentifier: "CellFirst", for: indexPath) as! RedeemTableViewCell
//            cell.redeemOfferCollectionView.reloadData()
//            return cell
//        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellSecond", for: indexPath) as! RedeemSecondTableViewCell
            cell.selectionStyle = .none
            print("reedem data -->\(modelData)")
            cell.RedeemData = modelData
            cell.redeemSecondCollectionView.reloadData()
            return cell
        }
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        if indexPath.section == 1{
//            //            let alert = UIAlertController(title: nil, message: NSLocalizedString(Constant.AlertKeys.AddRewardsAlert.rawValue, comment: Constant.AlertKeys.NSLocalizedStringComments.rawValue), preferredStyle: UIAlertController.Style.alert)
//            //                alert.addAction(UIAlertAction(title: NSLocalizedString(Constant.AlertKeys.JoinNow.rawValue, comment: Constant.AlertKeys.NSLocalizedStringComments.rawValue), style: UIAlertAction.Style.default, handler:{ (action: UIAlertAction!) in
//            
//            let vc = ProductDetailsViewController.loadViewController()
//            let points = self.modelData?.data?[indexPath.row].totalPoints ?? 0
////            let expiry = self.modelData?.data?[indexPath.row].endTime ?? 0
//            vc.rewadPoint = String(points)
////            vc.expiryDate = expiry
//            vc.productName = self.modelData?.data?[indexPath.row].vendorName ?? ""
//            vc.productImage = self.modelData?.data?[indexPath.row].logoLink ?? ""
//            vc.quantityReward = self.modelData?.data?[indexPath.row].vendorName ?? ""
//            self.navigationController?.pushViewController(vc, animated: true)
//            //                } ))
//            //            alert.addAction(UIAlertAction(title:Constant.AlertKeys.Cancel.rawValue, style: UIAlertAction.Style.default, handler:nil))
//            //                self.present(alert, animated: true, completion: nil)
//        }
//    }
}
