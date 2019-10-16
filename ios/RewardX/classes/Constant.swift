//
//  Constant.swift
//  RewardX
//
//  Created by somnath panda on 18/06/19.
//  Copyright © 2019 somnath panda. All rights reserved.
//

import Foundation

public struct Constant {
    
    //MAEK:- Base URL
    
    enum ApiUrl: String {
        case baseUrl = "http://ec2-18-234-161-126.compute-1.amazonaws.com:3000/api/customers/"
        case TestUserUDID = "23jvfuc4gjzb4uil4"
        case registrationUrl = "registerCustomer"
        case loginUrl = "loginCustomer"
        case discoverUrl = "discoverNearbyRewards/77.59223/13.017908333333333/1000000"
        case redeemUrl = "getCustomerRewardPointDetailsForAllVendors/"
        case offerUrl = "getAllVendorOffers/"
        case activityUrl = "GetRecentActivities/"
        case RewardsUrl = "getVendorsRegisteredWithCustomer/"
        case VenderListUrl = "GetAllVendors"
        
    }
    enum ApiKeys:String {
        case postMethod = "POST"
        case getMethod = "GET"
        case applicationJson = "application/json"
        case contentType = "Content-Type"
        case fullName = "full_name"
        case email = "email"
        case phone = "phone"
        case password = "password"
        case loginName = "login_name"
        case loginMethod = "login_method"
        case loginWithEmail = "1"
        case loginWithPhone = "2"
        
        
    }
    enum ApiErrorKeys:String {
        case serverError = "Server Error"
    }
    
    enum Identifires: String {
        case LOGIN_VIEW_CONTROLLER_ID = "LogInViewController"
        case PROFILE_VIEW_CONTROLLER_ID = "ProfileViewController"
        case ADD_VIEW_CONTROLLER_ID = "AddProgramViewController"
        case REWARD_ACTIVITY_VIEW_CONTROLLER_ID = "RewardActivityViewController"
        case OFFER_VIEW_CONTROLLER_ID = "OfferViewController"
        case DISCOVER_VIEW_CONTROLLER_ID = "DiscoverViewController"
        case REDEEM_VIEW_CONTROLLER_ID = "RedeemViewController"
        case SEARCH_VIEW_CONTROLLER_ID = "SearchViewController"
        case ACTIVITY_VIEW_CONTROLLER_ID = "ActivityViewController"
        case WELLNESS_OFFER_VIEW_CONTROLLER_ID = "WellnessOfferViewController"
        case REWARDS_VIEW_CONTROLLER_ID = "RewardsViewController"
        case VENDER_LIST_VIEW_CONTROLLER_ID = "VenderListViewController"
    }
    enum Keys: String {
        case ActivityTitle = "Activity"
        case OfferTitle = "Offer"
        case DiscoverTitle = "Discover"
        case RedeemTitle = "Redeem"
        case Rewards = "REWARDS"
        case VenderList = "VENDORS LIST"
        case Main = "Main"
        case points = " points"
        case cell = "Cell"
        case Cell1st = "CellFirst"
        case Cell2nd = "CellSecond"
        case NewLine = "\n"
        case Redeemed = "You redeemed"
        case NotRedeem = "You have been rewarded with"
        case SortPoints = " pts"
        case LoyalityAdd = "Loyalty, Rewards Program Add"
        case RegisterVender = "Registered Vendors List"
    }
    
    enum AlertKeys: String {
        case OK = "Ok"
        case Cancel = "Cancel"
        case AddRewardsAlert = "Get adde to get exciting rewards !"
        case NSLocalizedStringComments = ""
        case JoinNow = "Join Now"
        
    }
}







