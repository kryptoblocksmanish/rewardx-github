
import UIKit

class DiscoverViewController: UIViewController {
    @IBOutlet weak var tblDiscover: UITableView!
    var modelData : DiscoverModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        tblDiscover.tableFooterView = UIView()
        getAllDiscover()
    }
    
   //MARK:- Backend Api Call
    func getAllDiscover() {
        let session = URLSession.shared
        let url = URL(string: Constant.ApiUrl.baseUrl.rawValue + Constant.ApiUrl.discoverUrl.rawValue)!
        showIndicator()
        let task = session.dataTask(with: url) { data, response, error in
          
            if error != nil || data == nil {
                DispatchQueue.main.async {
                    
                    let alert = UIAlertController(title:Constant.ApiErrorKeys.serverError.rawValue, message: nil, preferredStyle: .alert)
                    
                    alert.addAction(UIAlertAction(title: Constant.AlertKeys.OK.rawValue, style: .default, handler: nil))
                    
                    self.present(alert, animated: true)
                    hideIndicator()
                    
                }
                return
            }
            
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print(dataString)
                let jsonData = Data(dataString.utf8)
                let decoder = JSONDecoder()
                do {
                    let people = try decoder.decode(DiscoverModel.self, from: jsonData)
                    self.modelData = people
                    if let status = self.modelData?.status{
                        if status == 200 {
                            
                            DispatchQueue.main.async {
                                
                                self.tblDiscover.reloadData()
                                hideIndicator()
                                
//
//                                let alert = UIAlertController(title: self.modelData?.message, message: nil, preferredStyle: .alert)
//                                
//                                alert.addAction(UIAlertAction(title: Constant.AlertKeys.OK.rawValue, style: .default, handler: { action in
//                                    let vc = self.storyboard?.instantiateViewController(withIdentifier: Constant.Identifires.LOGIN_VIEW_CONTROLLER_ID.rawValue) as! LogInViewController
//                                    self.navigationController?.pushViewController(vc, animated: true)
//                                }))
//                                
//                                self.present(alert, animated: true)
//                                
                            }
                        } else if status == 500 {
                            DispatchQueue.main.async {
                                
                                let alert = UIAlertController(title: self.modelData?.data?[0].error, message: nil, preferredStyle: .alert)
                                
                                alert.addAction(UIAlertAction(title: Constant.AlertKeys.OK.rawValue, style: .default, handler: nil))
                                
                                self.present(alert, animated: true)
                                hideIndicator()
                                
                            }
                        } else {
                            DispatchQueue.main.async {
                                
                                let alert = UIAlertController(title: Constant.ApiErrorKeys.serverError.rawValue, message: nil, preferredStyle: .alert)
                                
                                alert.addAction(UIAlertAction(title: Constant.AlertKeys.OK.rawValue, style: .default, handler: nil))
                                
                                self.present(alert, animated: true)
                                hideIndicator()
                                
                            }
                        }
                        
                        
                    }
                } catch {
                    print(error.localizedDescription)
                    DispatchQueue.main.async {
                        
                        let alert = UIAlertController(title: error.localizedDescription, message: nil, preferredStyle: .alert)
                        
                        alert.addAction(UIAlertAction(title: Constant.AlertKeys.OK.rawValue, style: .default, handler: nil))
                        
                        self.present(alert, animated: true)
                        hideIndicator()
                        
                    }
                }
        }
        }
        task.resume()
        
        }
}

extension DiscoverViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
//        else if section == 1{
//            return 1
//        }
        else{
            return modelData?.data?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: Constant.Keys.cell.rawValue, for: indexPath)
            cell.selectionStyle = .none
            return cell
        }
//        else if indexPath.section == 1{
//            let cell = tableView.dequeueReusableCell(withIdentifier:Constant.Keys.Cell1st.rawValue, for: indexPath) as! DiscoverTableViewCell
//            return cell
//        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: Constant.Keys.Cell2nd.rawValue, for: indexPath) as! DiscoverSecondTableViewCell
            cell.selectionStyle = .none
            cell.lblProductName.text = modelData?.data?[indexPath.row].name
            cell.lblBusinessName.text = "Foodie"
                cell.lblTotalPoints.text = String((modelData?.data?[indexPath.row].totalPoints)!) + Constant.Keys.NewLine.rawValue + Constant.Keys.points.rawValue
            cell.imgProduct?.dowloadFromServer(link: (modelData?.data?[indexPath.row].imageLink)!, contentMode: .scaleAspectFit)
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1{
//            let alert = UIAlertController(title: nil, message: NSLocalizedString(Constant.AlertKeys.AddRewardsAlert.rawValue, comment: Constant.AlertKeys.NSLocalizedStringComments.rawValue), preferredStyle: UIAlertController.Style.alert)
//                alert.addAction(UIAlertAction(title: NSLocalizedString(Constant.AlertKeys.JoinNow.rawValue, comment: Constant.AlertKeys.NSLocalizedStringComments.rawValue), style: UIAlertAction.Style.default, handler:{ (action: UIAlertAction!) in
            
                    let vc = ProductDetailsViewController.loadViewController()
                    let points = self.modelData?.data?[indexPath.row].totalPoints ?? 0
                    let expiry = self.modelData?.data?[indexPath.row].endTime ?? 0
                    vc.rewadPoint = String(points)
                    vc.expiryDate = expiry
                    vc.productName = self.modelData?.data?[indexPath.row].name ?? ""
                    vc.productImage = self.modelData?.data?[indexPath.row].imageLink ?? ""
                    vc.quantityReward = self.modelData?.data?[indexPath.row].summary ?? ""
                    self.navigationController?.pushViewController(vc, animated: true)
//                } ))
//            alert.addAction(UIAlertAction(title:Constant.AlertKeys.Cancel.rawValue, style: UIAlertAction.Style.default, handler:nil))
//                self.present(alert, animated: true, completion: nil)
        }
    }
}
