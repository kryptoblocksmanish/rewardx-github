//
//  RewardsViewController.swift
//  RewardX
//
//  Created by somnath panda on 20/08/19.
//  Copyright © 2019 somnath panda. All rights reserved.
//

import UIKit

class RewardsViewController: UIViewController {
    var modelData : RewardsModel?

    @IBOutlet weak var tblRewards: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       tblRewards.tableFooterView = UIView()
        // Do any additional setup after loading the view.
        getRewards()
    }
    //MARK:- Backend Api Call
    func getRewards() {
        let session = URLSession.shared
        // let url = URL(string: Constant.ApiUrl.baseUrl.rawValue + Constant.ApiUrl.offerUrl.rawValue + TempDataStore.sharedInstance.UserUDID)!
        let url = URL(string: Constant.ApiUrl.baseUrl.rawValue + Constant.ApiUrl.RewardsUrl.rawValue + "23jvfuc4gjzb4uil4")!
        
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
                    let people = try decoder.decode(RewardsModel.self, from: jsonData)
                    self.modelData = people
                    print("reddem response -->\(self.modelData)")
                    if let status = self.modelData?.status{
                        if status == 200 {
                            DispatchQueue.main.async {
                                self.tblRewards.reloadData()
                            }
                            
                            
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

extension RewardsViewController:UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            
            return 1
        }else{
            
            return modelData?.data?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: Constant.Keys.cell.rawValue, for: indexPath)
            cell.textLabel?.textColor = .black
            cell.textLabel?.text = Constant.Keys.LoyalityAdd.rawValue
            cell.selectionStyle = .none
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: Constant.Keys.Cell1st.rawValue, for: indexPath) as! RewardsViewControllerTableViewCell
            cell.selectionStyle = .none
            cell.lblRewardTitle.text = modelData?.data?[indexPath.row].ownerName
            let s = modelData?.data?[indexPath.row].registrationDate
            let date = NSDate(timeIntervalSince1970: Double(s ?? 0) / 1000)
            let formatter = DateFormatter()
            formatter.timeZone = NSTimeZone(name: "UTC") as TimeZone?
            formatter.dateFormat = "dd MMMM yyyy"
            cell.lblRewardDate.text = formatter.string(from: date as Date)
            print(formatter.string(from: date as Date))
            cell.lblMembershipID.text = modelData?.data?[indexPath.row].membershipUUID
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0{
            let vc = AddProgramViewController.loadViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
