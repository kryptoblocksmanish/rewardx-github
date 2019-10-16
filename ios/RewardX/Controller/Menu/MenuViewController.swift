
import UIKit

class MenuViewController: UIViewController {

    let menuArray = ["Dashboard","Activities","Profile","Help","Log Out"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension MenuViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var numberCell = 1
        
        if section == 0 {
            numberCell = 1
        }
         else if section == 1 {
            numberCell = menuArray.count
        }
        
        return numberCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height = 45.0
        
        if indexPath.section == 0 {
            height = 200.0
        }
         if indexPath.section == 1 {
             height = 45.0
        }
        return CGFloat(height)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       if indexPath.section == 0
       {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.Keys.Cell1st.rawValue, for: indexPath) as! MenuFirstCell
        cell.lblName.text = TempDataStore.sharedInstance.userName
        cell.lblName.textColor = .white
       // cell.imgProfile.dowloadFromServer(link: TempDataStore.sharedInstance.ProfileImage)
        cell.imgProfile.image = UIImage(named: "Rectangle 2 Copy")
        cell.imgProfile.layer.cornerRadius = cell.imgProfile.frame.height/2
        cell.selectionStyle = .none
        return cell
        }
       else if indexPath.section == 1 {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.Keys.cell.rawValue, for: indexPath) as! MenuTableViewCell
        cell.titleLabel.text = menuArray[indexPath.row]
        cell.titleLabel.textColor = .white
        cell.selectionStyle = .none
        return cell
        }
       else {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constant.Keys.cell.rawValue, for: indexPath) as! MenuTableViewCell
        cell.titleLabel.text = menuArray[indexPath.row]
        cell.selectionStyle = .none
         cell.titleLabel.textColor = .white
        return cell

        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            
        
        if indexPath.row == 0 {
            let objRewardActivityViewController = self.storyboard?.instantiateViewController(withIdentifier: Constant.Identifires.REWARD_ACTIVITY_VIEW_CONTROLLER_ID.rawValue) as! RewardActivityViewController
            self.navigationController?.pushViewController(objRewardActivityViewController, animated: true)
            
        } else if indexPath.row == 1 {
            let objActivity = self.storyboard?.instantiateViewController(withIdentifier: Constant.Identifires.ACTIVITY_VIEW_CONTROLLER_ID.rawValue) as! ActivityViewController
            self.navigationController?.pushViewController(objActivity, animated: true)
         
            
        } else if indexPath.row == 2 {
            let objProfile = self.storyboard?.instantiateViewController(withIdentifier: Constant.Identifires.PROFILE_VIEW_CONTROLLER_ID.rawValue) as! ProfileViewController
            self.navigationController?.pushViewController(objProfile, animated: true)
            
//            let objActivity = self.storyboard?.instantiateViewController(withIdentifier: Constant.Identifires.REWARD_ACTIVITY_VIEW_CONTROLLER_ID.rawValue) as! RewardActivityViewController
//            self.navigationController?.pushViewController(objActivity, animated: true)
            
        } else if indexPath.row == 3 {
//            let objActivity = self.storyboard?.instantiateViewController(withIdentifier: Constant.Identifires.REWARD_ACTIVITY_VIEW_CONTROLLER_ID.rawValue) as! RewardActivityViewController
//            self.navigationController?.pushViewController(objActivity, animated: true)
            
        } else if indexPath.row == 4 {
            let objlogin = self.storyboard?.instantiateViewController(withIdentifier: Constant.Identifires.LOGIN_VIEW_CONTROLLER_ID.rawValue) as! LogInViewController
            self.navigationController?.pushViewController(objlogin, animated: true)
//            let objActivity = self.storyboard?.instantiateViewController(withIdentifier: Constant.Identifires.REWARD_ACTIVITY_VIEW_CONTROLLER_ID.rawValue) as! RewardActivityViewController
//            self.navigationController?.pushViewController(objActivity, animated: true)
            
        } else if indexPath.row == 5 {
//            let objActivity = self.storyboard?.instantiateViewController(withIdentifier: Constant.Identifires.REWARD_ACTIVITY_VIEW_CONTROLLER_ID.rawValue) as! RewardActivityViewController
//            self.navigationController?.pushViewController(objActivity, animated: true)
            
        } else if indexPath.row == 6 {
//            let objlogin = self.storyboard?.instantiateViewController(withIdentifier: Constant.Identifires.LOGIN_VIEW_CONTROLLER_ID.rawValue) as! LogInViewController
//            self.navigationController?.pushViewController(objlogin, animated: true)
            
        }
    }
    }
}
