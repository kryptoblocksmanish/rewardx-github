//
//  AddProgramModel.swift
//  RewardX
//
//  Created by somnath panda on 22/08/19.
//  Copyright © 2019 somnath panda. All rights reserved.
//

import Foundation
// MARK: - AddProgramModel
struct AddProgramModel: Codable {
    let status: Int?
    let message: String?
    let data: AddprogramData?
}

// MARK: - DataClass
struct AddprogramData: Codable {
    let v: Int?
    let ownerName, ownerUUID, uuid, userUUID: String?
    let vendorUUID, membershipUUID, id: String?
    let registrationDate: Int?
    let error : String?
    
    
    enum CodingKeys: String, CodingKey {
        case v = "__v"
        case ownerName = "owner_name"
        case ownerUUID = "owner_uuid"
        case uuid
        case userUUID = "user_uuid"
        case vendorUUID = "vendor_uuid"
        case membershipUUID = "membership_uuid"
        case id = "_id"
        case registrationDate = "registration_date"
        case error
    }
}
// MARK: - Welcome
struct MemberValidModel: Codable {
    let status: Int
    let message: String
    let data: MemberValidData
}

// MARK: - DataClass
struct MemberValidData: Codable {
    let id, membershipUUID, ownerUUID, uuid: String?
    let vendorUUID: String?
    let registrationDate: Int?
    let error : String?
    
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case membershipUUID = "membership_uuid"
        case ownerUUID = "owner_uuid"
        case uuid
        case vendorUUID = "vendor_uuid"
        case registrationDate = "registration_date"
        case error
    }
}
