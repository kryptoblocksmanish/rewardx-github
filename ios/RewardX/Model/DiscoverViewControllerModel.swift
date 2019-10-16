//
//  DiscoverViewControllerModel.swift
//  RewardX
//
//  Created by somnath panda on 13/08/19.
//  Copyright © 2019 somnath panda. All rights reserved.
//

import Foundation
//struct DiscoverModel:Codable {
//    let status:Int?
//    let message : String?
//    let data : [DataArray]?
//
//    struct DataArray:Codable {
//        let _id : String?
//        let __v : Int?
//        let batch_count : Int?
//        let cltv_status : String?
//        let current_rule : String?
//        let customer_value : String?
//        let description : String?
//        let image_link : String?
//        let name : String?
//        let points_category : Int?
//        let points_cltv_period : Int?
//        let points_cltv_status : Int?
//        let points_customer_value : Int?
//        let points_price_of_purchase_category : Int?
//        let points_product_name : Int?
//        let points_sub_category : Int?
//        let points_units_of_purchase : Int?
//        let points_uop_variance : Int?
//        let points_upi_brand : Int?
//        let points_upi_mpn : Int?
//        let points_upi_number : Int?
//        let price_category_points : Int?
//        let price_of_purchase_category : String?
//        let product_category_uuid : String?
//        let product_specific_points : Int?
//        let product_sub_category_uuid : String?
//        let product_upi_brand : String?
//        let product_upi_mpn : String?
//        let product_upi_number : String?
//        let product_url : String?
//        let product_uuid : String?
//        let summary : String?
//        let total_points : Int?
//        let type : String?
//        let units_of_purchase : String?
//        let units_of_purchase_value : Int?
//        let user_uuid : String?
//        let uuid : String?
//        let vendor_uuid : String?
//        let video_url : String?
//        let is_batch : Bool?
//        let is_deleted : Bool?
//        let is_active : Bool?
//        let last_modified : Int?
//        let created_on : Int?
//        let start_time : Int?
//        let end_time : Int?
//        let discount_value : Int?
//        let discount_type : String?
//        let is_verified : Bool?
//    }
//}
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct DiscoverModel: Codable {
    let status: Int?
    let message: String?
    let data: [DiscoverData]?
}

// MARK: - Datum
struct DiscoverData: Codable {
    let id: String?
    let v, batchCount: Int?
    let cltvStatus, currentRule, customerValue, datumDescription: String?
    let imageLink: String?
    let name: String?
    let pointsCategory, pointsCltvPeriod, pointsCltvStatus, pointsCustomerValue: Int?
    let pointsPriceOfPurchaseCategory, pointsProductName, pointsSubCategory, pointsUnitsOfPurchase: Int?
    let pointsUopVariance, pointsUpiBrand, pointsUpiMpn, pointsUpiNumber: Int?
    let priceCategoryPoints: Int?
    let priceOfPurchaseCategory, productCategoryUUID: String?
    let productSpecificPoints: Int?
    let productSubCategoryUUID, productUpiBrand, productUpiMpn, productUpiNumber: String?
    let productURL, productUUID, summary: String?
    let totalPoints: Int?
    let type, unitsOfPurchase: String?
    let unitsOfPurchaseValue: Int?
    let userUUID, uuid, vendorUUID, videoURL: String?
    let isBatch, isDeleted, isActive: Bool?
    let lastModified, createdOn, startTime, endTime: Int?
    let discountValue: Int?
    let discountType: String?
    let isVerified: Bool?
    let uopVariance, cltvPeriod: String?
    let awardedCount: Int?
    let error : String?
    
    
    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case v = "__v"
        case batchCount = "batch_count"
        case cltvStatus = "cltv_status"
        case currentRule = "current_rule"
        case customerValue = "customer_value"
        case datumDescription = "description"
        case imageLink = "image_link"
        case name
        case pointsCategory = "points_category"
        case pointsCltvPeriod = "points_cltv_period"
        case pointsCltvStatus = "points_cltv_status"
        case pointsCustomerValue = "points_customer_value"
        case pointsPriceOfPurchaseCategory = "points_price_of_purchase_category"
        case pointsProductName = "points_product_name"
        case pointsSubCategory = "points_sub_category"
        case pointsUnitsOfPurchase = "points_units_of_purchase"
        case pointsUopVariance = "points_uop_variance"
        case pointsUpiBrand = "points_upi_brand"
        case pointsUpiMpn = "points_upi_mpn"
        case pointsUpiNumber = "points_upi_number"
        case priceCategoryPoints = "price_category_points"
        case priceOfPurchaseCategory = "price_of_purchase_category"
        case productCategoryUUID = "product_category_uuid"
        case productSpecificPoints = "product_specific_points"
        case productSubCategoryUUID = "product_sub_category_uuid"
        case productUpiBrand = "product_upi_brand"
        case productUpiMpn = "product_upi_mpn"
        case productUpiNumber = "product_upi_number"
        case productURL = "product_url"
        case productUUID = "product_uuid"
        case summary
        case totalPoints = "total_points"
        case type
        case unitsOfPurchase = "units_of_purchase"
        case unitsOfPurchaseValue = "units_of_purchase_value"
        case userUUID = "user_uuid"
        case uuid
        case vendorUUID = "vendor_uuid"
        case videoURL = "video_url"
        case isBatch = "is_batch"
        case isDeleted = "is_deleted"
        case isActive = "is_active"
        case lastModified = "last_modified"
        case createdOn = "created_on"
        case startTime = "start_time"
        case endTime = "end_time"
        case discountValue = "discount_value"
        case discountType = "discount_type"
        case isVerified = "is_verified"
        case uopVariance = "uop_variance"
        case cltvPeriod = "cltv_period"
        case awardedCount = "awarded_count"
        case error
    }
}
