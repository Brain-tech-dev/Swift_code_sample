//
//  LoginModel.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 30/01/24.
//

import Foundation

//MARK: - LoginModel
struct LoginModel: Codable {
    let status: Int?
    let message: String?
    let data: UserData?

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try? (values.decodeIfPresent(Int.self,forKey: .status))
        message = try? (values.decodeIfPresent(String.self,forKey: .message))
        data = try? (values.decodeIfPresent(UserData.self,forKey: .data))
    }
}

//MARK: - UserData
struct UserData: Codable {
    let accessToken: String?
    let tokenType: String?
    let user: User?

    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case user = "User"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        accessToken = try? (values.decodeIfPresent(String.self,forKey: .accessToken))
        tokenType = try? (values.decodeIfPresent(String.self,forKey: .tokenType))
        user = try? (values.decodeIfPresent(User.self,forKey: .user))
    }
}

//MARK: - User
struct User: Codable {
    let id: Int?
    let role: String?
    let firstname: String?
    let gender: String?
    let companyName: String?
    let contactPerson: String?
    let lastname: String?
    let email: String?
    let image: String?
    let status: String?
    let createdAt: String?
    let updatedAt: String?
    let deviceId: String?
    let deviceToken: String?
    let deviceType: String?
//    let companyIndustry: [CompanyIndustryData]?
    let companyMatching: [CompanyMatchingParameterData]?
    let account_verification: Int?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case role = "role"
        case firstname = "firstname"
        case lastname = "lastname"
        case companyName = "company_name"
        case contactPerson = "contact_person"
        case email = "email"
        case gender = "gender"
        case image = "image"
        case status = "status"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case deviceId = "device_id"
        case deviceToken = "device_token"
        case deviceType = "device_type"
//        case companyIndustry = "company_industry"
        case companyMatching = "company_matching"
        case account_verification = "account_verification"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try? (values.decodeIfPresent(Int.self,forKey: .id))
        role = try? (values.decodeIfPresent(String.self,forKey: .role))
        firstname = try? (values.decodeIfPresent(String.self,forKey: .firstname))
        lastname = try? (values.decodeIfPresent(String.self,forKey: .lastname))
        companyName = try? (values.decodeIfPresent(String.self,forKey: .companyName))
        contactPerson = try? (values.decodeIfPresent(String.self,forKey: .contactPerson))
        email = try? (values.decodeIfPresent(String.self,forKey: .email))
        gender = try? (values.decodeIfPresent(String.self,forKey: .gender))
        image = try? (values.decodeIfPresent(String.self,forKey: .image))
        status = try? (values.decodeIfPresent(String.self,forKey: .status))
        createdAt = try? (values.decodeIfPresent(String.self,forKey: .createdAt))
        updatedAt = try? (values.decodeIfPresent(String.self,forKey: .updatedAt))
        deviceId = try? (values.decodeIfPresent(String.self,forKey: .deviceId))
        deviceToken = try? (values.decodeIfPresent(String.self,forKey: .deviceToken))
        deviceType = try? (values.decodeIfPresent(String.self,forKey: .deviceType))
//        companyIndustry = try? (values.decodeIfPresent([CompanyIndustryData].self,forKey: .companyIndustry))
        companyMatching = try? (values.decodeIfPresent([CompanyMatchingParameterData].self,forKey: .companyMatching))
        account_verification = try? (values.decodeIfPresent(Int.self,forKey: .account_verification))

    }
}

//MARK: - User
struct CompanyMatchingParameterData: Codable {
    let id: Int?
    let companyId: Int?
    let key : String?
    let value: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case companyId = "company_id"
        case key = "key"
        case value = "value"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try? (values.decodeIfPresent(Int.self,forKey: .id))
        companyId = try? (values.decodeIfPresent(Int.self,forKey: .companyId))
        key = try? (values.decodeIfPresent(String.self,forKey: .key))
        value = try? (values.decodeIfPresent(String.self,forKey: .value))
    }
}

struct CompanyMatchingRequestData: Codable {
    var match: String?

    enum CodingKeys: String, CodingKey {
        case match = "match"
    }
}
