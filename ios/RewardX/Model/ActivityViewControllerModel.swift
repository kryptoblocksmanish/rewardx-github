//
//  ActivityViewControllerModel.swift
//  RewardX
//
//  Created by somnath panda on 16/08/19.
//  Copyright © 2019 somnath panda. All rights reserved.
//

import Foundation

// MARK: - Welcome
struct ActivityModel: Codable {
    let status: Int?
    let message: String?
    let data: [ActivityData]?
}

// MARK: - Datum
struct ActivityData: Codable {
    let id: String?
    let redeemDateTime: Int?
    let ownerUUID: String?
    let membershipUUID: String?
    let redeemPoints: Int?
    let v: Int?
    let isProcessable: Bool?
    let orderID, remarks, uuid: String?
    let rewardPoints, dateTimeAllocated: Int?
    let vendorUUID, incentiveUUID, incentiveName: String?
    let error : String?
    
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case redeemDateTime = "redeem_date_time"
        case ownerUUID = "owner_uuid"
        case membershipUUID = "membership_uuid"
        case redeemPoints = "redeem_points"
        case v = "__v"
        case isProcessable = "is_processable"
        case orderID = "order_id"
        case remarks, uuid
        case rewardPoints = "reward_points"
        case dateTimeAllocated = "date_time_allocated"
        case vendorUUID = "vendor_uuid"
        case incentiveUUID = "incentive_uuid"
        case incentiveName = "incentive_name"
        case error
    }
}
