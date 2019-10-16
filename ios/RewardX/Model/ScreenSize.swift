
import UIKit

//==================Screen Size =============//
let Screensize = UIScreen.main.bounds
let ScreenHeight = Screensize.height
let ScreenWidth = Screensize.width

//==================Screen Indicator  =============//
let indicator = UIActivityIndicatorView()

func addIndicator(){
    indicator.frame = CGRect(x:0,y:0,width:UIScreen.main.bounds.size.width,height:UIScreen.main.bounds.size.height)
    indicator.style = UIActivityIndicatorView.Style.whiteLarge
    indicator.backgroundColor = UIColor(red: 184.0/255.0, green: 184.0/255.0, blue: 184.0/255.0, alpha: 1.0)
    indicator.alpha = 0.75
    print("abc")
}

func showIndicator(){
    //show the Indicator
    indicator.startAnimating()
    // window?.rootViewController?.view .addSubview(indicator)
     UIApplication.shared.keyWindow? .addSubview(indicator);
    addIndicator()
   }

func hideIndicator(){
    //Hide the Indicator
    indicator.stopAnimating()
    indicator.removeFromSuperview()
}










