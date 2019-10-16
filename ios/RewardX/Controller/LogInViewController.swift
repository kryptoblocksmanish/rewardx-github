
import UIKit

class LogInViewController: UIViewController,UITextFieldDelegate{
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet weak var btnEmail: UIButton!
    @IBOutlet weak var btnPhone: UIButton!
    @IBOutlet weak var imgLoginId: UIImageView!
    var isSelectedPhone = false
    let ACCEPT_NUMBER_CHARACTERS = "0123456789"
     var modelData : LogInModel?
    @IBOutlet var txtEmail: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        txtEmail.delegate = self
       
        
    }
   
    @IBAction func btnLogin(_ sender: Any) {
        dismissKeyboard()
        if isValidate() {
            userLogin()
        }
        
    }
    //MARK:- Backend Api Call
    func userLogin()  {
        
        var login_method = String()
        
        if isSelectedPhone==true {
            login_method = Constant.ApiKeys.loginWithPhone.rawValue
        } else {
            login_method = Constant.ApiKeys.loginWithEmail.rawValue
        }
        let session = URLSession.shared
        let url = URL(string: Constant.ApiUrl.baseUrl.rawValue + Constant.ApiUrl.loginUrl.rawValue)!
        
        var request = URLRequest(url: url)
        request.httpMethod = Constant.ApiKeys.postMethod.rawValue
         request.setValue(Constant.ApiKeys.applicationJson.rawValue, forHTTPHeaderField: Constant.ApiKeys.contentType.rawValue)
        
        let json = [
            Constant.ApiKeys.loginName.rawValue: txtEmail.text!, Constant.ApiKeys.password.rawValue:txtPassword.text!, Constant.ApiKeys.loginMethod.rawValue:login_method
            
        ]
        print(json)
        let jsonData = try! JSONSerialization.data(withJSONObject: json, options: [])
        showIndicator()
        let task = session.uploadTask(with: request, from: jsonData) { data, response, error in
            
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
                    let people = try decoder.decode(LogInModel.self, from: jsonData)
                    self.modelData = people
                    if let status = self.modelData?.status{
                        if status == 200 {
                           
                            DispatchQueue.main.async {
                                TempDataStore.sharedInstance.userUDID = (self.modelData?.data?.uuid)!
                                TempDataStore.sharedInstance.userName = (self.modelData?.data?.fullName)!
                                let VC = self.storyboard?.instantiateViewController(withIdentifier: Constant.Identifires.PROFILE_VIEW_CONTROLLER_ID.rawValue) as! ProfileViewController
                                self.navigationController?.pushViewController(VC, animated: true)
                                hideIndicator()
//
//                                let alert = UIAlertController(title: self.modelData?.message, message: nil, preferredStyle: .alert)
//
//                                alert.addAction(UIAlertAction(title: Constant.AlertKeys.OK.rawValue, style: .default, handler: { action in
//                                    let VC = self.storyboard?.instantiateViewController(withIdentifier: Constant.Identifires.PROFILE_VIEW_CONTROLLER_ID.rawValue) as! ProfileViewController
//                                    self.navigationController?.pushViewController(VC, animated: true)
//                                }))
//
//                                self.present(alert, animated: true)
//
                            }
                        } else if status == 500 {
                            DispatchQueue.main.async {
                                
                                let alert = UIAlertController(title: self.modelData?.data?.error, message: nil, preferredStyle: .alert)
                                
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
            if let httpResponse = response as? HTTPURLResponse {
                print(httpResponse.statusCode)
                
            }
         
        }
        
        task.resume()
        
        
    }
     //MARK:- Validation
    
    func isValidate() -> Bool {
        var isValidate = true
        if(txtEmail.text?.trimmingCharacters(in: .whitespaces).count)! <= 0
        {
            isValidate = false
            let alert = UIAlertController(title: nil, message: NSLocalizedString("Enter valid email", comment: ""), preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("AlertOk", comment: ""), style: UIAlertAction.Style.default, handler:{ (action: UIAlertAction!) in
                
                self.txtEmail.text = ""
                self.txtEmail.becomeFirstResponder()
                
                
            } ))
            self.present(alert, animated: true, completion: nil)
            
        } else if(txtPassword.text?.trimmingCharacters(in: .whitespaces).count)! <= 0
        {
            isValidate = false
            let alert = UIAlertController(title: nil, message: NSLocalizedString("Enter valid password", comment: ""), preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("AlertOk", comment: ""), style: UIAlertAction.Style.default, handler:{ (action: UIAlertAction!) in
                
                self.txtPassword.text = ""
                self.txtPassword.becomeFirstResponder()
                
            } ))
            self.present(alert, animated: true, completion: nil)
        }
        
        return isValidate
    }
    func isValidEmail(testStr:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: testStr)
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let cs1 = NSCharacterSet(charactersIn: ACCEPT_NUMBER_CHARACTERS).inverted
        let filtered = string.components(separatedBy: cs1).joined(separator: "")
        print(filtered)
        print(string)
        var returndata = Bool()
        if isSelectedPhone==true {
            if (txtEmail.text?.count)!<12 {
                returndata = (string == filtered)
            } else {
                returndata = false
            }
            
        }
       
            else if txtEmail.isFirstResponder  || txtPassword.isFirstResponder {
                if (textField.textInputMode?.primaryLanguage == "emoji") || textField.textInputMode?.primaryLanguage == nil  {
                    //                                let alert = UIAlertController(title: nil, message: NSLocalizedString("AJKSBVKB;sbv", comment: ""), preferredStyle: UIAlertControllerStyle.alert)
                    //                                alert.addAction(UIAlertAction(title: NSLocalizedString("AlertOk", comment: ""), style: UIAlertActionStyle.default, handler:{ (action: UIAlertAction!) in
                    //                                    hideIndicator()
                    //
                    //
                    //                                } ))
                    //                                self.present(alert, animated: true, completion: nil)
                    // In fact, in iOS7, '[[textField textInputMode] primaryLanguage]' is nil
                    returndata = false
                }
                else
                {

                    returndata = true
                }


            }
        else {
            returndata = true
        }
        
        return returndata
        
        
    }
    
    // MARK: - keyboard hide
    
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(LogInViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    
    
    // MARK: -  view fit keyboard appear
    
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= 50
            }
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += 50
            }
        }
    }
    
    
    //MARK:- Button Action
    @IBAction func btnEmailAction(_ sender: Any) {
        isSelectedPhone = false
        btnEmail.setImage(UIImage(named: "task-2"), for: .normal)
        txtEmail.placeholder = "Email Id"
        btnPhone.setImage(UIImage(named: "task"), for: .normal)
        imgLoginId.image = UIImage(named: "user")
        txtEmail.text = ""
        

    }
    @IBAction func btnPhoneAction(_ sender: Any) {
        isSelectedPhone = true
        txtEmail.placeholder = "Mobile No"
        btnEmail.setImage(UIImage(named: "task"), for: .normal)
        btnPhone.setImage(UIImage(named: "task-2"), for: .normal)
        imgLoginId.image = UIImage(named: "smartphone")
        txtEmail.text = ""
        
    }
    
}
