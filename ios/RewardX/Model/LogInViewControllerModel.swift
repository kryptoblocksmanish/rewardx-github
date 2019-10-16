//
//  LogInViewControllerModel.swift
//  RewardX
//
//  Created by somnath panda on 13/08/19.
//  Copyright © 2019 somnath panda. All rights reserved.
//

import Foundation
//struct LogInModel:Codable {
//    let status:Int?
//    let message : String?
//    let data : DataArray?
//
//    struct DataArray:Codable {
//        let _id : String?
//        let password : String?
//        let email : String?
//        let login_name : String?
//        let login_type : String?
//        let uuid : String?
//        // let __v : String?
//        let is_active : Bool?
//        let has_completed_profile : Bool?
//        let last_modified : String?
//        let created_on : String?
//        let profile_link : String?
//        let date_of_birth : String?
//        //let phone : String?
//        let google_id : String?
//        let facebook_id : String?
//        let full_name : String?
//        let last_name : String?
//        let middle_name : String?
//        let first_name : String?
//        let salutation : String?
//
//    }
//}
// MARK: - Welcome
struct LogInModel: Codable {
    let status: Int?
    let message: String?
    let data: LoginDataClass?
}

// MARK: - DataClass
struct LoginDataClass: Codable {
    let id, password, email, loginName: String?
    let loginType, uuid: String?
    let v: Int?
    let isActive, hasCompletedProfile: Bool?
    let lastModified, createdOn: Int?
    let profileLink, dateOfBirth: String?
    let phone: Int?
    let googleID, facebookID, fullName, lastName: String?
    let middleName, firstName, salutation: String?
    let error : String?
    
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case password, email
        case loginName = "login_name"
        case loginType = "login_type"
        case uuid
        case v = "__v"
        case isActive = "is_active"
        case hasCompletedProfile = "has_completed_profile"
        case lastModified = "last_modified"
        case createdOn = "created_on"
        case profileLink = "profile_link"
        case dateOfBirth = "date_of_birth"
        case phone
        case googleID = "google_id"
        case facebookID = "facebook_id"
        case fullName = "full_name"
        case lastName = "last_name"
        case middleName = "middle_name"
        case firstName = "first_name"
        case salutation
        case error
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {
    
    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }
    
    public var hashValue: Int {
        return 0
    }
    
    public init() {}
    
    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
