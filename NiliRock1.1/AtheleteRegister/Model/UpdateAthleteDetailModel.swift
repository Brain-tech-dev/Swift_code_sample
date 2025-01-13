//
//  UpdateAthleteDetailModel.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 31/01/24.
//

import Foundation

struct UpdateAthleteDetailModel: Codable {

    let status: Int?
    let message: String?
//    let data: AthleteCategoryData?

    enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
//        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try? (values.decodeIfPresent(Int.self,forKey: .status))
        message = try? (values.decodeIfPresent(String.self,forKey: .message))
//        data = try? (values.decodeIfPresent(AthleteCategoryData.self,forKey: .data))
    }
}
