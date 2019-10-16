
import UIKit
import SideMenu


class ProfileViewController: UIViewController,UITabBarDelegate {
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet weak var tbDashboard: UITabBar!
    @IBOutlet weak var viewChildSubview: UIView!
    @IBOutlet weak var lblUserName: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font:UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
        tbDashboard.delegate = self
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgProfile.isUserInteractionEnabled = true
        imgProfile.addGestureRecognizer(tapGestureRecognizer)
        lblUserName.text = TempDataStore.sharedInstance.userName
        
        setupView()
        setSideMenu()
    }
    
    private func setupView() {
        setupSegmentControl()
        updateView()
    }
    
    //MARK:- Segment control
    
    private func setupSegmentControl() {
        segmentedControl.removeAllSegments()
        
        //        segmentedControl.insertSegment(withTitle: Constant.Keys.OfferTitle.rawValue, at: 0, animated: true)
        //        segmentedControl.insertSegment(withTitle: Constant.Keys.DiscoverTitle.rawValue, at: 1, animated: true)
        //        segmentedControl.insertSegment(withTitle: Constant.Keys.RedeemTitle.rawValue, at: 2, animated: true)
        
        
        segmentedControl.insertSegment(withTitle: Constant.Keys.Rewards.rawValue, at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: Constant.Keys.VenderList.rawValue, at: 1, animated: true)
        segmentedControl.addTarget(self, action: #selector(selectionDidChange), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
    }
    lazy var RewardsViewController: RewardsViewController = {
        let storyboard = UIStoryboard.init(name: Constant.Keys.Main.rawValue, bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: Constant.Identifires.REWARDS_VIEW_CONTROLLER_ID.rawValue) as! RewardsViewController
        self.addViewControllerasChildViewController(childViewController:viewController)
        
        return viewController
    }()
    lazy var VenderListViewController: VenderListViewController = {
        let storyboard = UIStoryboard.init(name: Constant.Keys.Main.rawValue, bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: Constant.Identifires.VENDER_LIST_VIEW_CONTROLLER_ID.rawValue) as! VenderListViewController
        self.addViewControllerasChildViewController(childViewController:viewController)
        return viewController
    }()
    
    @objc fileprivate func selectionDidChange() {
        updateView()
    }
    private func updateView() {
        //        if segmentedControl.selectedSegmentIndex == 0 {
        //            btnTabBarItem.isHidden = true
        //            OfferViewController.view.isHidden = false
        //            DiscoverViewController.view.isHidden = true
        //            RedeemViewController.view.isHidden = true
        //        } else if segmentedControl.selectedSegmentIndex == 1 {
        //             btnTabBarItem.isHidden = false
        //            OfferViewController.view.isHidden = true
        //            DiscoverViewController.view.isHidden = false
        //            RedeemViewController.view.isHidden = true
        //        }
        //        else  {
        //             btnTabBarItem.isHidden = true
        //            OfferViewController.view.isHidden = true
        //            DiscoverViewController.view.isHidden = true
        //            RedeemViewController.view.isHidden = false
        //        }
        if segmentedControl.selectedSegmentIndex == 0 {
         //   btnTabBarItem.isHidden = true
            RewardsViewController.view.isHidden = false
            VenderListViewController.view.isHidden = true
        }
        else  {
           // btnTabBarItem.isHidden = true
            RewardsViewController.view.isHidden = true
            VenderListViewController.view.isHidden = false
        }
    }
    //MARK:- Helper
    
    private func addViewControllerasChildViewController(childViewController:UIViewController) {
        addChild(childViewController)
        childViewController.view.frame = view.bounds
        childViewController.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        childViewController.didMove(toParent: self)
        viewChildSubview.addSubview(childViewController.view)
        
        
    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        
        AttachmentHandler.shared.showAttachmentActionSheet(vc: self)
        AttachmentHandler.shared.imagePickedBlock = { (image) in
            /* get your image here */
            self.imgProfile.image = image
        }
    }
    
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        let objRwardActivity = self.storyboard?.instantiateViewController(withIdentifier: Constant.Identifires.ACTIVITY_VIEW_CONTROLLER_ID.rawValue) as! ActivityViewController
        self.navigationController?.pushViewController(objRwardActivity, animated: true)
    }
    
    @IBAction func btnHomeAction(_ sender: Any) {
        let objRwardActivity = self.storyboard?.instantiateViewController(withIdentifier: Constant.Identifires.REWARD_ACTIVITY_VIEW_CONTROLLER_ID.rawValue) as! RewardActivityViewController
        self.navigationController?.pushViewController(objRwardActivity, animated: true)
        
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

extension ProfileViewController:UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellFirst", for: indexPath) as! ProfileFirstTableViewCell
            return cell
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellSecond", for: indexPath) as! ProfileSecondTableViewCell
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      //  let addVC = self.storyboard?.instantiateViewController(withIdentifier: Constant.Identifires.ADD_VIEW_CONTROLLER_ID.rawValue) as! AddProgramViewController
     //   self.navigationController?.pushViewController(addVC, animated: true)
        
    }
}
