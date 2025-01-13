//
//  DashBoardModel.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 07/02/24.
//

import Foundation

struct DashBoardModel: Codable {
    
    let status: Int?
    let message: String?
    let data: DashBoardData?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try? (values.decodeIfPresent(Int.self,forKey: .status))
        message = try? (values.decodeIfPresent(String.self,forKey: .message))
        data = try? (values.decodeIfPresent(DashBoardData.self,forKey: .data))
    }
}

struct DashBoardData: Codable {
    let id: Int?
    let role: String?
    let firstname: String?
    let lastname: String?
    let gender: String?
    let companyName: String?
    let contactPerson: String?
    let email: String?
    let phone: String?
    let image: String?
    let status: String?
    let profileViewCount: String?
    let activeRequestsCount: Int?
    let acceptedRequestsCount: Int?
    let totalEndorsmentsAwarded: Int?
    let unreadMessagesCount: Int?
    let totalEarning: String?
    let openEndorsemntsCount: Int?
    let completedEndorsementsCount: Int?
    let deviceType: String?
    let deviceId: String?
    let deviceToken: String?
    let premiumMember: String?
    let completedPayoutCount: Int?
    let accountVerification: Int?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case role = "role"
        case firstname = "firstname"
        case lastname = "lastname"
        case gender = "gender"
        case companyName = "company_name"
        case activeRequestsCount = "activeRequestsCount"
        case acceptedRequestsCount = "acceptedRequestsCount"
        case contactPerson = "contact_person"
        case email = "email"
        case phone = "phone"
        case image = "image"
        case status = "status"
        case unreadMessagesCount = "unreadMessagesCount"
        case profileViewCount = "profile_view_count"
        case totalEndorsmentsAwarded = "total_endorsments_awarded"
        case totalEarning = "total_earnings"
        case openEndorsemntsCount = "openEndorsemntsCount"
        case completedEndorsementsCount = "completedEndorsementsCount"
        case deviceType = "device_type"
        case deviceId = "device_id"
        case deviceToken = "device_token"
        case premiumMember = "is_premium_member"
        case completedPayoutCount = "completedPayoutCount"
        case accountVerification = "account_verification"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try? (values.decodeIfPresent(Int.self,forKey: .id))
        activeRequestsCount = try? (values.decodeIfPresent(Int.self,forKey: .activeRequestsCount))
        role = try? (values.decodeIfPresent(String.self,forKey: .role))
        firstname = try? (values.decodeIfPresent(String.self,forKey: .firstname))
        lastname = try? (values.decodeIfPresent(String.self,forKey: .lastname))
        gender = try? (values.decodeIfPresent(String.self,forKey: .gender))
        companyName = try? (values.decodeIfPresent(String.self,forKey: .companyName))
        contactPerson = try? (values.decodeIfPresent(String.self,forKey: .contactPerson))
        email = try? (values.decodeIfPresent(String.self,forKey: .email))
        phone = try? (values.decodeIfPresent(String.self,forKey: .phone))
        image = try? (values.decodeIfPresent(String.self,forKey: .image))
        status = try? (values.decodeIfPresent(String.self,forKey: .status))
        profileViewCount = try? (values.decodeIfPresent(String.self,forKey: .profileViewCount))
        unreadMessagesCount = try? (values.decodeIfPresent(Int.self,forKey: .unreadMessagesCount))
        totalEndorsmentsAwarded = try? (values.decodeIfPresent(Int.self,forKey: .totalEndorsmentsAwarded))
        totalEarning = try? (values.decodeIfPresent(String.self,forKey: .totalEarning))
        openEndorsemntsCount = try? (values.decodeIfPresent(Int.self,forKey: .openEndorsemntsCount))
        completedEndorsementsCount = try? (values.decodeIfPresent(Int.self,forKey: .completedEndorsementsCount))
        acceptedRequestsCount = try? (values.decodeIfPresent(Int.self,forKey: .acceptedRequestsCount))
        deviceType = try? (values.decodeIfPresent(String.self,forKey: .deviceType))
        deviceId = try? (values.decodeIfPresent(String.self,forKey: .deviceId))
        deviceToken = try? (values.decodeIfPresent(String.self,forKey: .deviceToken))
        premiumMember = try? (values.decodeIfPresent(String.self,forKey: .premiumMember))
        completedPayoutCount = try? (values.decodeIfPresent(Int.self,forKey: .completedPayoutCount))
        accountVerification = try? (values.decodeIfPresent(Int.self,forKey: .accountVerification))

    }
}
