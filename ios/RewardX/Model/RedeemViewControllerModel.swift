//
//  RedeemViewControllerModel.swift
//  RewardX
//
//  Created by somnath panda on 13/08/19.
//  Copyright © 2019 somnath panda. All rights reserved.
//


import Foundation

// MARK: - RedeemModel
struct RedeemModel: Codable {
    let status: Int?
    let message: String?
    let data: [RedeemData]?
}

// MARK: - Datum
struct RedeemData: Codable {
    let userUUID, vendorUUID, vendorName: String?
    let logoLink: String?
    let totalPoints: Int?
    let membershipUUID: String?
    let error : String?
    
    
    enum CodingKeys: String, CodingKey {
        case userUUID = "user_uuid"
        case vendorUUID = "vendor_uuid"
        case vendorName = "vendor_name"
        case logoLink = "logo_link"
        case totalPoints = "total_points"
        case membershipUUID = "membership_uuid"
        case error
        
    }
}
