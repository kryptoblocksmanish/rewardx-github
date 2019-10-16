
import UIKit

class CommonFunctions: NSObject {
    
    static let sharedInstance = CommonFunctions()
    
    private override init() {}
    
   
    
   
    /**
     Call this function to convert any object into json string
     */
    
    func getJsonString(_ object:Any) -> String {
        guard let data = try? JSONSerialization.data(withJSONObject: object, options: []) else {
            return ""
        }
        return String(data: data, encoding: String.Encoding.utf8) ?? ""
    }
    
    /**
     Call this function to convert model object to json
     */
    
    func convertModelObjectToJson<T : Encodable>(_ model:T) -> [String: Any]? {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        do {
            let data = try jsonEncoder.encode(model)
            do {
                if let jsonParameters = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String:Any] {
                    return jsonParameters
                }
            }
            catch {
                print("error \(error)")
            }
        }
        catch {
            print("error \(error)")
        }
        return nil
    }
    
    /**
     Call this function to convert json object to model
     */
    
    func convertJsonObjectToModel<T : Decodable>(_ data:Data, modelType:T.Type) -> T? {
//        do {
//            let jsonData = try JSONSerialization.data(withJSONObject: object, options: .prettyPrinted)
//
//            let reqJSONStr = String(data: jsonData, encoding: .utf8)
//            let data = reqJSONStr?.data(using: .utf8)
            let jsonDecoder = JSONDecoder()
            do {
                let modelObj = try jsonDecoder.decode(modelType, from: data)
                return modelObj
            }
            catch {
                print("error \(error)")
            }
//        }
//        catch {
//            print("error \(error)")
//        }
        return nil
    }
}
