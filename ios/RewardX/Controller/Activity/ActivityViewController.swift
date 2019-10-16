
import UIKit
import SideMenu

class ActivityViewController: UIViewController {
    @IBOutlet weak var lblPointTitle: UILabel!
    @IBOutlet weak var lblTotalPoints: UILabel!
    @IBOutlet weak var tblActivity: UITableView!
    @IBAction func btnback(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    var modelData : ActivityModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getAllActivities()
        setSideMenu()
        tblActivity.tableFooterView = UIView()
       
    }
    //MARK:- Backend Api Call
    func getAllActivities() {
        let session = URLSession.shared
        let url = URL(string: Constant.ApiUrl.baseUrl.rawValue + Constant.ApiUrl.activityUrl.rawValue + Constant.ApiUrl.TestUserUDID.rawValue)!
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
                    let people = try decoder.decode(ActivityModel.self, from: jsonData)
                    self.modelData = people
                    if let status = self.modelData?.status{
                        if status == 200 {
                            
                            DispatchQueue.main.async {
                                self.tblActivity.reloadData()
                                self.lblTotalPoints.text = "1893"
                                self.lblPointTitle.text = "Your total points"
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
    //MARK:- Slid Menu
    func setSideMenu()  {
        let vc1 = storyboard!.instantiateViewController(withIdentifier: "MenuViewControllerID")
        let menuLeftNavigationController = UISideMenuNavigationController(rootViewController: vc1)
        SideMenuManager.default.menuLeftNavigationController = menuLeftNavigationController
        SideMenuManager.default.menuAddPanGestureToPresent(toView: self.navigationController!.navigationBar)
        SideMenuManager.default.menuAddScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)
        SideMenuManager.default.menuFadeStatusBar = false
        SideMenuManager.defaultManager.menuWidth = self.view.frame.size.width - 50
    }
    
    @IBAction func menuAction(_ sender: Any) {
        present(SideMenuManager.default.menuLeftNavigationController!, animated: true, completion: nil)
    }
}



extension ActivityViewController:UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (modelData?.data?.count ?? 0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constant.Keys.cell.rawValue, for: indexPath) as! ActivityTableViewCell
        
        if modelData?.data?[indexPath.row].redeemDateTime != nil {
            cell.lblCompanyName.text = Constant.Keys.Redeemed.rawValue
//            let someOtherDateTime = Date(timeIntervalSinceReferenceDate: modelData?.data?[indexPath.row].redeemDateTime)
            cell.lblDate.text = String((modelData?.data?[indexPath.row].redeemDateTime)!)
            cell.lblTotalPoints.text = String((modelData?.data?[indexPath.row].redeemPoints)!) + Constant.Keys.SortPoints.rawValue
        } else if modelData?.data?[indexPath.row].dateTimeAllocated != nil {
            cell.lblCompanyName.text = Constant.Keys.NotRedeem.rawValue
//            let someOtherDateTime = Date(timeIntervalSinceReferenceDate: modelData?.data?[indexPath.row].dateTimeAllocated)
            cell.lblDate.text = String((modelData?.data?[indexPath.row].dateTimeAllocated)!)
            cell.lblTotalPoints.text = String((modelData?.data?[indexPath.row].rewardPoints)!) + Constant.Keys.SortPoints.rawValue
        }
      cell.imgActivity.dowloadFromServer(link: "https://kryptoblocks-image-upload-bucket.s3.ap-south-1.amazonaws.com/plane1.jpg", contentMode: .scaleAspectFit)
        
        
            return cell
    }
}
