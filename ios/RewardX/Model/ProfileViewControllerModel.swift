//
//  ProfileViewControllerModel.swift
//  RewardX
//
//  Created by somnath panda on 21/08/19.
//  Copyright © 2019 somnath panda. All rights reserved.
//

import Foundation
import Foundation

// MARK: - RewardsModel
struct RewardsModel: Codable {
    let status: Int?
    let message: String?
    let data: [RewardsData]?
}

// MARK: - Datum
struct RewardsData: Codable {
    let id, ownerName, ownerUUID, uuid: String?
    let membershipUUID, userUUID, vendorUUID: String?
    let v, registrationDate: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case ownerName = "owner_name"
        case ownerUUID = "owner_uuid"
        case uuid
        case membershipUUID = "membership_uuid"
        case userUUID = "user_uuid"
        case vendorUUID = "vendor_uuid"
        case v = "__v"
        case registrationDate = "registration_date"
    }
}
// MARK: - Welcome
struct VenderListModel: Codable {
    let status: Int?
    let message: String?
    let data: [VenderListData]?
}

// MARK: - Datum
struct VenderListData: Codable {
    let id: String?
    let v: Int?
    let hostURL: String?
    let ownerName, ownerUUID, uuid, vendorName: String?
    let vendorUUID: String?
    let logoLink: String?
    
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
    }
}
