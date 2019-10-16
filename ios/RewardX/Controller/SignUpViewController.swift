
import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var txtUserName: UITextField!
    @IBOutlet var txtEmailId: UITextField!
    @IBOutlet var txtPhoneNo: UITextField!
    @IBOutlet var txtPassword: UITextField!
    @IBOutlet var txtRePassword: UITextField!
     let ACCEPT_NUMBER_CHARACTERS = "0123456789"
    
    var modelData : SignUpModel?
    
    
    //MARK:- BUTTON ACTION
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnGetStart(_ sender: Any) {
        if isValidate() {
            
           userSignup()
//                let vc = self.storyboard?.instantiateViewController(withIdentifier: "LogInViewControllerID") as! LogInViewController
//                self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    //MARK:- VIEW DIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        txtUserName.delegate = self
        txtEmailId.delegate = self
        txtPhoneNo.delegate = self
        txtPassword.delegate = self
        txtRePassword.delegate = self
        
    }
    
    //MARK:- VALIDATION
    func isValidate() -> Bool {
        var isValidate = true
        
        if (txtUserName.text?.trimmingCharacters(in: .whitespaces).count)! <= 0 {
            isValidate = false
            let alert = UIAlertController(title: nil, message: NSLocalizedString("Enter full name", comment: ""), preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("AlertOk", comment: ""), style: UIAlertAction.Style.default, handler:{ (action: UIAlertAction!) in
                
                self.txtUserName.text = ""
                
                self.txtUserName.becomeFirstResponder()
                
            } ))
            self.present(alert, animated: true, completion: nil)
            
        } else if (txtEmailId.text?.trimmingCharacters(in: .whitespaces).count)! <= 0
        {
            isValidate = false
            let alert = UIAlertController(title: nil, message: NSLocalizedString("Please enter your emailid", comment: ""), preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("AlertOk", comment: ""), style: UIAlertAction.Style.default, handler:{ (action: UIAlertAction!) in
                
                self.txtEmailId.text = ""
                self.txtEmailId.becomeFirstResponder()
                
            } ))
            self.present(alert, animated: true, completion: nil)
        } else if !isValidEmail(testStr: txtEmailId.text!)
        {
            isValidate = false
            let alert = UIAlertController(title: nil, message: NSLocalizedString("EnterValidEmail", comment: ""), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("AlertOk", comment: ""), style: UIAlertAction.Style.default, handler:{ (action: UIAlertAction!) in
                
                
                self.txtEmailId.becomeFirstResponder()
                
            } ))
            self.present(alert, animated: true, completion: nil)
        } else if (txtPhoneNo.text?.trimmingCharacters(in: .whitespaces).count)! <= 0
        {
            isValidate = false
            let alert = UIAlertController(title: nil, message: NSLocalizedString("Please enter your PhoneNo", comment: ""), preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("AlertOk", comment: ""), style: UIAlertAction.Style.default, handler:{ (action: UIAlertAction!) in
                
                self.txtPhoneNo.text = ""
                self.txtPhoneNo.becomeFirstResponder()
                
            } ))
            self.present(alert, animated: true, completion: nil)
        } else if (txtPassword.text?.trimmingCharacters(in: .whitespaces).count)! <= 0
        {
            isValidate = false
            let alert = UIAlertController(title: nil, message: NSLocalizedString("Please enter password", comment: ""), preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("AlertOk", comment: ""), style: UIAlertAction.Style.default, handler:{ (action: UIAlertAction!) in
                
                self.txtPassword.text = ""
                self.txtPassword.becomeFirstResponder()
                
            } ))
            self.present(alert, animated: true, completion: nil)
        } else if (txtRePassword.text?.trimmingCharacters(in: .whitespaces).count)! <= 0
        {
            isValidate = false
            let alert = UIAlertController(title: nil, message: NSLocalizedString("EnterConfirmPassword", comment: ""), preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("AlertOk", comment: ""), style: UIAlertAction.Style.default, handler:{ (action: UIAlertAction!) in
                
                self.txtRePassword.text = ""
                self.txtRePassword.becomeFirstResponder()
                
            } ))
            self.present(alert, animated: true, completion: nil)
        } else if (txtPassword.text != txtRePassword.text)
        {
            isValidate = false
            let alert = UIAlertController(title: nil, message: NSLocalizedString("password_confirmation_failed", comment: ""), preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("AlertOk", comment: ""), style: UIAlertAction.Style.default, handler:{ (action: UIAlertAction!) in
                self.txtRePassword.becomeFirstResponder()
                
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
        if txtPhoneNo.isFirstResponder && txtPhoneNo.returnKeyType != .next{
            if (txtPhoneNo.text?.count)!<12  {
                returndata = (string == filtered)
            } else {
                returndata = false
            }
            
        }
            
        else if txtUserName.isFirstResponder  || txtEmailId.isFirstResponder || txtPhoneNo.isFirstResponder {
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
    

    
   
    //MARK:- Backend Api Call
    
    func userSignup()  {

        let session = URLSession.shared
        let url = URL(string:Constant.ApiUrl.baseUrl.rawValue + Constant.ApiUrl.registrationUrl.rawValue)!

        var request = URLRequest(url: url)
        request.httpMethod = Constant.ApiKeys.postMethod.rawValue
        request.setValue(Constant.ApiKeys.applicationJson.rawValue, forHTTPHeaderField: Constant.ApiKeys.contentType.rawValue)
        let json = [
            Constant.ApiKeys.fullName.rawValue:txtUserName.text!,
            Constant.ApiKeys.email.rawValue: txtEmailId.text!,Constant.ApiKeys.phone.rawValue: txtPhoneNo.text!, Constant.ApiKeys.password.rawValue:txtRePassword.text!

        ]
        let jsonData = try! JSONSerialization.data(withJSONObject: json, options: [])
        let task = session.uploadTask(with: request, from: jsonData) { data, response, error in
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
                    let people = try decoder.decode(SignUpModel.self, from: jsonData)
                    self.modelData = people
                    if let status = self.modelData?.status{
                        if status == 200 {
                            DispatchQueue.main.async {
                                
                                let alert = UIAlertController(title: self.modelData?.message, message: nil, preferredStyle: .alert)
                                
                                alert.addAction(UIAlertAction(title: Constant.AlertKeys.OK.rawValue, style: .default, handler: { action in
                                    let vc = self.storyboard?.instantiateViewController(withIdentifier: Constant.Identifires.LOGIN_VIEW_CONTROLLER_ID.rawValue) as! LogInViewController
                                    self.navigationController?.pushViewController(vc, animated: true)
                                }))
                                
                                self.present(alert, animated: true)
                                
                            }
                        } else if status == 500 {
                            DispatchQueue.main.async {
                                
                                let alert = UIAlertController(title: self.modelData?.data?.error, message: nil, preferredStyle: .alert)
                                
                                alert.addAction(UIAlertAction(title: Constant.AlertKeys.OK.rawValue, style: .default, handler: nil))
                                
                                self.present(alert, animated: true)
                                
                            }
                        } else {
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
            

            if let httpResponse = response as? HTTPURLResponse {
                print(httpResponse.statusCode)

            }
        }

        task.resume()


    }
    
}
