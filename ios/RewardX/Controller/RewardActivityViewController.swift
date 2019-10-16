
import UIKit
import SideMenu

class RewardActivityViewController: UIViewController {
    @IBOutlet var segmentedControl: UISegmentedControl!
    @IBOutlet var childContainerView: UIView!
    @IBOutlet var btnTabBarItem: UITabBar!
    @IBOutlet var btnMenuSlider: UIBarButtonItem!
    @IBOutlet var btnseach: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.font:UIFont.systemFont(ofSize: 20), NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
        
        setupView()
        setSideMenu()
    }
    
    // MARK:- View method

    private func setupView() {
        setupSegmentControl()
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
            btnTabBarItem.isHidden = true
            DiscoverViewController.view.isHidden = false
            RedeemViewController.view.isHidden = true
        }
        else  {
            btnTabBarItem.isHidden = true
            DiscoverViewController.view.isHidden = true
            RedeemViewController.view.isHidden = false
        }
    }
    
    //MARK:- Segment control
    
    private func setupSegmentControl() {
        segmentedControl.removeAllSegments()
//        segmentedControl.insertSegment(withTitle: Constant.Keys.OfferTitle.rawValue, at: 0, animated: true)
//        segmentedControl.insertSegment(withTitle: Constant.Keys.DiscoverTitle.rawValue, at: 1, animated: true)
//        segmentedControl.insertSegment(withTitle: Constant.Keys.RedeemTitle.rawValue, at: 2, animated: true)
        

        segmentedControl.insertSegment(withTitle: Constant.Keys.DiscoverTitle.rawValue, at: 0, animated: true)
        segmentedControl.insertSegment(withTitle: Constant.Keys.RedeemTitle.rawValue, at: 1, animated: true)
        segmentedControl.addTarget(self, action: #selector(selectionDidChange), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
    }

//    lazy var OfferViewController: OfferViewController = {
//        let storyboard = UIStoryboard.init(name: Constant.Keys.Main.rawValue, bundle: Bundle.main)
//        var viewController = storyboard.instantiateViewController(withIdentifier: Constant.Identifires.OFFER_VIEW_CONTROLLER_ID.rawValue) as! OfferViewController
//        self.addViewControllerasChildViewController(childViewController:viewController)
//        return viewController
//    }()
    lazy var DiscoverViewController: DiscoverViewController = {
        let storyboard = UIStoryboard.init(name: Constant.Keys.Main.rawValue, bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: Constant.Identifires.DISCOVER_VIEW_CONTROLLER_ID.rawValue) as! DiscoverViewController
        self.addViewControllerasChildViewController(childViewController:viewController)
     
        return viewController
    }()
    lazy var RedeemViewController: RedeemViewController = {
        let storyboard = UIStoryboard.init(name: Constant.Keys.Main.rawValue, bundle: Bundle.main)
        var viewController = storyboard.instantiateViewController(withIdentifier: Constant.Identifires.REDEEM_VIEW_CONTROLLER_ID.rawValue) as! RedeemViewController
        self.addViewControllerasChildViewController(childViewController:viewController)
        return viewController
    }()
    
    @objc fileprivate func selectionDidChange() {
        updateView()
    }
    
    //MARK:- Helper
    
    private func addViewControllerasChildViewController(childViewController:UIViewController) {
        addChild(childViewController)
        childViewController.view.frame = view.bounds
        childViewController.view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        childViewController.didMove(toParent: self)
        childContainerView.addSubview(childViewController.view)

        
    }
    
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
    
    @IBAction func btnSearchAction(_ sender: Any) {
        let objSearchVC = self.storyboard?.instantiateViewController(withIdentifier: Constant.Identifires.SEARCH_VIEW_CONTROLLER_ID.rawValue) as! SearchViewController
        self.navigationController?.pushViewController(objSearchVC, animated: true)
        
    }
}
