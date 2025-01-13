//
//  AtheleteRegisterOneModel.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 30/01/24.
//

import Foundation

struct AtheleteRegisterOneModel: Codable {
    let status: Int?
    let message: String?
    let data: AtheleteData?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try? (values.decodeIfPresent(Int.self,forKey: .status))
        message = try? (values.decodeIfPresent(String.self,forKey: .message))
        data = try? (values.decodeIfPresent(AtheleteData.self,forKey: .data))
    }
}

struct AtheleteData: Codable {
    let accessToken: String?
    let tokenType: String?
    let user: AthleteUserData?
    
    enum CodingKeys: String, CodingKey {
        case accessToken = "access_token"
        case tokenType = "token_type"
        case user = "User"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        accessToken = try? (values.decodeIfPresent(String.self,forKey: .accessToken))
        tokenType = try? (values.decodeIfPresent(String.self,forKey: .tokenType))
        user = try? (values.decodeIfPresent(AthleteUserData.self,forKey: .user))
    }
}

struct AthleteUserData: Codable {
    let firstname: String?
    let lastname: String?
    let companyName: String?
    let contactPerson: String?
    let email: String?
    let phone: String?
    let gender: String?
    let role: String?
    let updatedAt: String?
    let createdAt: String?
    let id: Int?
    let image: String?
    let account_verification: Int?
    
    enum CodingKeys: String, CodingKey {
        case firstname = "firstname"
        case lastname = "lastname"
        case companyName = "company_name"
        case contactPerson = "contact_person"
        case email = "email"
        case phone = "phone"
        case gender = "gender"
        case role = "role"
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case id = "id"
        case image = "image"
        case account_verification = "account_verification"
        
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        firstname = try? (values.decodeIfPresent(String.self,forKey: .firstname))
        lastname = try? (values.decodeIfPresent(String.self,forKey: .lastname))
        companyName = try? (values.decodeIfPresent(String.self,forKey: .companyName))
        contactPerson = try? (values.decodeIfPresent(String.self,forKey: .contactPerson))
        email = try? (values.decodeIfPresent(String.self,forKey: .email))
        phone = try? (values.decodeIfPresent(String.self,forKey: .phone))
        gender = try? (values.decodeIfPresent(String.self,forKey: .gender))
        role = try? (values.decodeIfPresent(String.self,forKey: .role))
        updatedAt = try? (values.decodeIfPresent(String.self,forKey: .updatedAt))
        createdAt = try? (values.decodeIfPresent(String.self,forKey: .createdAt))
        id = try? (values.decodeIfPresent(Int.self,forKey: .id))
        image = try? (values.decodeIfPresent(String.self,forKey: .image))
        account_verification = try? (values.decodeIfPresent(Int.self,forKey: .account_verification))
    }
}
