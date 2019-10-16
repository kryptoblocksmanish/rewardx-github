//
//  SignUpViewControllerModel.swift
//  RewardX
//
//  Created by somnath panda on 06/08/19.
//  Copyright © 2019 somnath panda. All rights reserved.
//
//
import Foundation
import UIKit

// MARK: - SignUpModel
struct SignUpModel: Codable {
    let status: Int?
    let message: String?
    let data: SignUpDataClass?
}

// MARK: - DataClass
struct SignUpDataClass: Codable {
    let salutation, firstName, middleName, lastName: String?
    let fullName, facebookID, googleID: String?
    let phone: Int?
    let dateOfBirth, profileLink: String?
    let createdOn, lastModified: Int?
    let hasCompletedProfile, isActive: Bool?
    let id, uuid, loginType, loginName: String?
    let email, password: String?
    let v: Int?
    let authToken: String?
    let error: String?
    
    enum CodingKeys: String, CodingKey {
        case salutation
        case firstName = "first_name"
        case middleName = "middle_name"
        case lastName = "last_name"
        case fullName = "full_name"
        case facebookID = "facebook_id"
        case googleID = "google_id"
        case phone
        case dateOfBirth = "date_of_birth"
        case profileLink = "profile_link"
        case createdOn = "created_on"
        case lastModified = "last_modified"
        case hasCompletedProfile = "has_completed_profile"
        case isActive = "is_active"
        case id = "_id"
        case uuid
        case loginType = "login_type"
        case loginName = "login_name"
        case email, password
        case v = "__v"
        case authToken = "auth_token"
        case error
    }
}



