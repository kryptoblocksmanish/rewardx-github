import Foundation

// MARK: - AllVenderModel
struct AllVenderModel: Codable {
    let status: Int?
    let message: String?
    let data: [AllVenderData]?
}

// MARK: - Datum
struct AllVenderData: Codable {
    let id: String?
    let v: Int?
    let hostURL: String?
    let ownerName, ownerUUID, uuid, vendorName: String?
    let vendorUUID: String?
    let logoLink: String?
     let error : String?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case v = "__v"
        case hostURL = "host_url"
        case ownerName = "owner_name"
        case ownerUUID = "owner_uuid"
        case uuid
        case vendorName = "vendor_name"
        case vendorUUID = "vendor_uuid"
        case logoLink = "logo_link"
        case error
    }
}
