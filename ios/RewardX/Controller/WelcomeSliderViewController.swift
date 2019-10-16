

import UIKit

class WelcomeSliderViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var btnNext: UIButton!
    
   
    var slides:[Slide] = [];

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        slides = createSlides()
        setupSlideScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.addSubview(pageControl)

        
    }
    
    func createSlides() -> [Slide] {
        
        let slide1:Slide = Bundle.main.loadNibNamed("SliderView", owner: self, options: nil)?.first as! Slide
        slide1.imgSlider.image = UIImage(named: "earn_header")
        slide1.lblFirstHint.text = "Earn when you purchase, engage  and refer"
        slide1.lblSecondHint.text = "Earn reward tokens for every purchase "
        
        
        let slide2:Slide = Bundle.main.loadNibNamed("SliderView", owner: self, options: nil)?.first as! Slide
        slide2.imgSlider.image = UIImage(named: "pay_header")
        slide2.lblFirstHint.text = "Redeem from your balance at checkout"
        slide2.lblSecondHint.text = "Redeem 10 token for every dollar to be spent "
        
        let slide3:Slide = Bundle.main.loadNibNamed("SliderView", owner: self, options: nil)?.first as! Slide
        slide3.imgSlider.image = UIImage(named: "exchange_header")
        slide3.lblFirstHint.text = "Redeem from your balance at checkout"
        slide3.lblSecondHint.text = "Redeem 10 token for every dollar to be spent "
        
        
      
        
        return [slide1, slide2, slide3]
    }
    
    func setupSlideScrollView(slides : [Slide]) {
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 100, width: view.frame.width, height: 0)
        
            
            scrollView.addSubview(slides[i])
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
    }
    
    /*
     * default function called when view is scolled. In order to enable callback
     * when scrollview is scrolled, the below code needs to be called:
     * slideScrollView.delegate = self or
     */
     func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
        if  Int(pageIndex) == 2 {
            btnNext.setTitle("let's start", for: .normal)
     //       btnNext.addTarget(self, action: #selector(StartAction), for: .touchUpInside)
        } else {
            btnNext.setTitle("next", for: .normal)
    //        btnNext.addTarget(self, action: #selector(NextAction), for: .touchUpInside)
        }

        
//        let maximumHorizontalOffset: CGFloat = scrollView.contentSize.width - scrollView.frame.width
//        let currentHorizontalOffset: CGFloat = scrollView.contentOffset.x
//        
//        // vertical
//        let maximumVerticalOffset: CGFloat = scrollView.contentSize.height - scrollView.frame.height
//        let currentVerticalOffset: CGFloat = scrollView.contentOffset.y
//        
//        let percentageHorizontalOffset: CGFloat = currentHorizontalOffset / maximumHorizontalOffset
//        let percentageVerticalOffset: CGFloat = currentVerticalOffset / maximumVerticalOffset
        
        
        /*
         * below code changes the background color of view on paging the scrollview
         */
        //        self.scrollView(scrollView, didScrollToPercentageOffset: percentageHorizontalOffset)
        
        
        /*
         * below code scales the imageview on paging the scrollview
         */
 /*       let percentOffset: CGPoint = CGPoint(x: percentageHorizontalOffset, y: percentageVerticalOffset)

        if(percentOffset.x > 0 && percentOffset.x <= 0.25) {

            slides[0].imgSlider.transform = CGAffineTransform(scaleX: (0.25-percentOffset.x)/0.25, y: (0.25-percentOffset.x)/0.25)
            slides[1].imgSlider.transform = CGAffineTransform(scaleX: percentOffset.x/0.25, y: percentOffset.x/0.25)

        } else if(percentOffset.x > 0.25 && percentOffset.x <= 0.50) {
            slides[1].imgSlider.transform = CGAffineTransform(scaleX: (0.50-percentOffset.x)/0.25, y: (0.50-percentOffset.x)/0.25)
            slides[2].imgSlider.transform = CGAffineTransform(scaleX: percentOffset.x/0.50, y: percentOffset.x/0.50)

        }*/
        
        
    }
//    @objc func StartAction() {
//        let vc = self.storyboard?.instantiateViewController(withIdentifier: "LogInViewControllerID") as! LogInViewController
//        self.navigationController?.pushViewController(vc, animated: true)
//    }
//    @objc func NextAction() {
//        let pageIndex = round(scrollView.contentOffset.x + view.frame.width)
//        pageControl.currentPage = Int(pageIndex)
//    }
//
    @IBAction func nextButtonAction(_ sender: Any) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        if  Int(pageIndex) == 2 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: Constant.Identifires.LOGIN_VIEW_CONTROLLER_ID.rawValue) as! LogInViewController
            self.navigationController?.pushViewController(vc, animated: true)
            
            
        } else {
            scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
            scrollView.contentSize = CGSize(width: view.frame.width * CGFloat(slides.count), height: view.frame.height)
            scrollView.isPagingEnabled = true
            
            for i in 0 ..< slides.count {
                slides[i].frame = CGRect(x: view.frame.width * CGFloat(i), y: 100, width: view.frame.width, height: 0)
        
                scrollView.addSubview(slides[i])
            }
        }
    }
    
   
}
