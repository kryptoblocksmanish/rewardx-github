

import UIKit

class AddProgramViewController: UIViewController {
   var modelData : AllVenderModel?
    
    @IBOutlet weak var businessNumberTextfield: UITextField!
    @IBOutlet weak var memberNumberTextfield: UITextField!
    @IBOutlet weak var addProgramTableView: UITableView!
    @IBAction func btnBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    var vendorName = [String]()
    var searchedArray : [String] = []
    var imageArray: [String] =  []
    var searchImageArray = [String]()
    
    class func loadViewController() -> AddProgramViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "AddProgramViewControllerID") as! AddProgramViewController
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addProgramTableView.isHidden = true
        hitApi()
    }
    
    func hitApi(){
        let session = URLSession.shared
        let url = URL(string: "http://ec2-18-234-161-126.compute-1.amazonaws.com:3000/api/customers/GetAllVendors")!
        
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
                    let people = try decoder.decode(AllVenderModel.self, from: jsonData)
                    self.modelData = people
                    print("reddem response -->\(self.modelData)")
                    if let status = self.modelData?.status{
                        if status == 200 {
                            
                            for obj in self.modelData?.data ?? []
                            {
                                self.vendorName.append(obj.vendorName ?? "")
                                self.imageArray.append(obj.logoLink ?? "")
                            }
                            
                            
//                            DispatchQueue.main.async {
//
//                              //  self.tblRedeem.reloadData()
//                            }
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
//    {
//        let session = URLSession.shared
//        let url = URL(string: "http://ec2-18-234-161-126.compute-1.amazonaws.com:3000/api/customers/GetAllVendors")!
//
//        let task = session.dataTask(with: url) { data, response, error in
//
//            if error != nil || data == nil {
//                DispatchQueue.main.async {
//                    let alert = UIAlertController(title:Constant.ApiErrorKeys.serverError.rawValue, message: nil, preferredStyle: .alert)
//                    alert.addAction(UIAlertAction(title: Constant.AlertKeys.OK.rawValue, style: .default, handler: nil))
//                    self.present(alert, animated: true)
//                }
//                return
//            }
//
//            if let data = data, let dataString = String(data: data, encoding: .utf8) {
//                print(dataString)
//                let jsonData = Data(dataString.utf8)
//                let decoder = JSONDecoder()
//                do {
//                    let people = try decoder.decode(RedeemModel.self, from: jsonData)
//                    self.modelData = people
//                    print("reddem response -->\(self.modelData)")
//                    if let status = self.modelData?.status{
//                        if status == 200 {
//                            DispatchQueue.main.async {
//                                self.tblRedeem.reloadData()
//                            }
//                            //                            self.delegate?.getAllBrandData(ModelData: self.modelData)
//
//                            //                            if self.delegate != nil {
//                            //
////                            //
//                                                        }
//
//                        }  else {
//                            DispatchQueue.main.async {
//                                let alert = UIAlertController(title: Constant.ApiErrorKeys.serverError.rawValue, message: nil, preferredStyle: .alert)
//                                alert.addAction(UIAlertAction(title: Constant.AlertKeys.OK.rawValue, style: .default, handler: nil))
//                                self.present(alert, animated: true)
//                            }
//                        }
//                    }
//                } catch {
//                    print(error.localizedDescription)
//                    DispatchQueue.main.async {
//                        let alert = UIAlertController(title: error.localizedDescription, message: nil, preferredStyle: .alert)
//                        alert.addAction(UIAlertAction(title: Constant.AlertKeys.OK.rawValue, style: .default, handler: nil))
//                        self.present(alert, animated: true)
//                    }
//                }
//            }
//        }
//        task.resume()
//    }
    
    
    @IBAction func saveAction(_ sender: Any) {
        
        
    }
    
}

extension AddProgramViewController:UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text,
            let textRange = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: textRange,
                                                       with: string)
            
            searchedArray.removeAll()
            searchImageArray.removeAll()
            if textField.text?.count != 0 {
                for (index,obj) in vendorName.enumerated() {
                    let range = obj.lowercased().range(of: textField.text!, options: .caseInsensitive, range: nil,   locale: nil)
                    if range != nil {
                        searchedArray.append(obj)
                        searchImageArray.append(imageArray[index])
                    }
                }
            } else {
               searchedArray = []
                searchImageArray = []
            }
            addProgramTableView.reloadData()
            
            if searchedArray.count != 0{
                addProgramTableView.isHidden = false
            }else{
                addProgramTableView.isHidden = true
            }
        }
        return true
    }
}

extension AddProgramViewController:UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return searchedArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! AddProgramTableViewCell
            cell.nameLabel.text = searchedArray[indexPath.row]
        cell.searchImageView.dowloadFromServer(link: searchImageArray[indexPath.row], contentMode: .scaleAspectFit)
            return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       addProgramTableView.isHidden = true
        self.businessNumberTextfield.text = searchedArray[indexPath.row]
    }
}
