//
//  SuccessModel.swift
//  NiliRock1.1
//
//  Created by Sazid Saifi on 30/01/24.
//

import Foundation

// MARK: - SuccessModel
struct SuccessModel: Codable {
    var userId: Int?
    let status: Int?
    let message: String?
    let data: String?
    
    enum CodingKeys: String, CodingKey {
        case userId = "user_id"
        case status = "status"
        case message = "message"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        userId = try? (values.decodeIfPresent(Int.self,forKey: .userId))
        status = try? (values.decodeIfPresent(Int.self,forKey: .status))
        message = try? (values.decodeIfPresent(String.self,forKey: .message))
        data = try? (values.decodeIfPresent(String.self,forKey: .data))
    }
}
