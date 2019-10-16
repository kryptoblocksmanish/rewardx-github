//
//  VenderListViewController.swift
//  RewardX
//
//  Created by somnath panda on 20/08/19.
//  Copyright © 2019 somnath panda. All rights reserved.
//

import UIKit

class VenderListViewController: UIViewController {
    
    var modelData : VenderListModel?
    @IBOutlet weak var tblVenderList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
tblVenderList.tableFooterView = UIView()
        // Do any additional setup after loading the view.
        getVenderList()
    }
    
    //MARK:- Backend Api Call
    func getVenderList() {
        let session = URLSession.shared
        // let url = URL(string: Constant.ApiUrl.baseUrl.rawValue + Constant.ApiUrl.offerUrl.rawValue + TempDataStore.sharedInstance.UserUDID)!
        let url = URL(string: Constant.ApiUrl.baseUrl.rawValue + Constant.ApiUrl.VenderListUrl.rawValue)!
        
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
                    let people = try decoder.decode(VenderListModel.self, from: jsonData)
                    self.modelData = people
                    print("reddem response -->\(self.modelData)")
                    if let status = self.modelData?.status{
                        if status == 200 {
                            DispatchQueue.main.async {
                                self.tblVenderList.reloadData()
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

extension VenderListViewController:UITableViewDataSource,UITableViewDelegate{
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
            cell.textLabel?.textColor = UIColor.black
            cell.textLabel?.text = Constant.Keys.RegisterVender.rawValue
            cell.selectionStyle = .none
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: Constant.Keys.Cell1st.rawValue, for: indexPath) as! VenderListViewControllerTableViewCell
            cell.selectionStyle = .none
            cell.lblTitle.text = modelData?.data?[indexPath.row].ownerName
            cell.imgVendor?.dowloadFromServer(link: modelData?.data?[indexPath.row].logoLink ?? "Rectangle", contentMode: .scaleAspectFit)
            return cell
        }
    }
}
