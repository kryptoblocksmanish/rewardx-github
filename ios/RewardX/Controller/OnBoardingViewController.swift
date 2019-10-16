
import UIKit

class OnBoardingViewController: UIViewController {

    @IBAction func btnSignin(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: Constant.Identifires.LOGIN_VIEW_CONTROLLER_ID.rawValue) as! LogInViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

     
    }
   
}
