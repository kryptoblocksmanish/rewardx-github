import UIKit
class TempDataStore: NSObject {

    //===============Declear variable for store data ============//
    
    var DeviceId = UIDevice.current.identifierForVendor!.uuidString
   // var mainurl = "http://tabadull.urdemowebsite.com/"
    //var mainurl = "http://souqprimo.urdemowebsite.com/"
   var mainurl = "https://souqprimo.com/"
    
    let RISTRICTED_CHARACTERS = "0123456789'*=-؟؛،٬؀٪؉؊؆؇؈٠١٢٣٤٥٦٧٨٩.•{}`~!_@#$₹€¥£%^&()+[]\\|;:'\",<>/?%"
    let ACCEPT_NUMBER_CHARACTERS = "0123456789"
     let RISTRICTED_CHARACTERS_Zipcode = "'*=-؟؛،٬؀٪؉؊؆؇؈.•{}`~!_@#$₹€¥£%^&()+[]\\|;:'\",<>/?%"

    
    var imagearray2 = [String]()
    var locationall:String = String()
    var Searchtext = String()
    var tmpmenuname = [String]()
    var catid = String()
    var LeftsliderIs = Bool()
    var viewall:String = String()
    var Address_ID = String()
    var quote_id = String()
    var FilterCheck = String()
    var BrandCatID = String()
    var Filter_cat_type = String()
    var Filter_cat_type_value = String()
    var ios_fcm_token = String()
    var searchnavtitel = String()
    var checkPaymentOption  = Bool()
     var checkgiftcartOption  = Bool()
    
    var Number_coutryName = [String]()
    var Number_CountryCode = [String]()
    var TempCountryValueArray = [String]()
    var TempCountryNameArray = [String]()
    
    var CountryValueArray = [String]()
    var CountryNameArray = [String]()
    var State_is_region_required = [Bool]()
    var State_is_region_visible = [Bool]()
    var is_Zip_required = [Bool]()
    var backaddaddress = Bool()
    var backsuccesspage = Bool()
    var homeisTranding = Bool()
    var BackFrom = String()
    var isAddressEmpty = Bool()
    var isAddressBook = Bool()
    var isChangeShippingAddress = Bool()
    var isGiftCard = false
    
    var userUDID = String()
    var userName = String()
    var ProfileImage = String()
    
    
    
    

    
    static let sharedInstance: TempDataStore = {
        let instance = TempDataStore()
      
        
        // setup code
        return instance
    }()
    
    override init() {
        super.init()
    }
    
    public static func convertStringtoArabic(_ paramString: String) -> String {
        var finalString: String = paramString
        finalString = finalString.replacingOccurrences(of: "٠", with: "0")
        finalString = finalString.replacingOccurrences(of: "١", with: "1")
        finalString = finalString.replacingOccurrences(of: "٢", with: "2")
        finalString = finalString.replacingOccurrences(of: "٣", with: "3")
        finalString = finalString.replacingOccurrences(of: "٤", with: "4")
        finalString = finalString.replacingOccurrences(of: "٥", with: "5")
        finalString = finalString.replacingOccurrences(of: "٦", with: "6")
        finalString = finalString.replacingOccurrences(of: "٧", with: "7")
        finalString = finalString.replacingOccurrences(of: "٨", with: "8")
        return finalString
    }

}
