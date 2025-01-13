//
//  PriceRangeModel.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 05/02/24.
//

import Foundation


struct PriceRangeModel: Codable {
    let status: Int?
    let message: String?
    let data: [PriceRangeData]?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try? (values.decodeIfPresent(Int.self,forKey: .status))
        message = try? (values.decodeIfPresent(String.self,forKey: .message))
        data = try? (values.decodeIfPresent([PriceRangeData].self,forKey: .data))
    }
}

struct PriceRangeData: Codable {
    let id: Int?
    let payRange: String?
    var selected: Int?
    var isSelected: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case payRange = "pay_range"
        case selected = "selected"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try? (values.decodeIfPresent(Int.self,forKey: .id))
        payRange = try? (values.decodeIfPresent(String.self,forKey: .payRange))
        selected = try? (values.decodeIfPresent(Int.self,forKey: .selected))
    }
}


// MARK: - EndorsementAmountModel
struct EndorsementAmountModel: Codable {
    let status: Int?
    let message: String?
    let data: EndorsementAmountData?
    
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try? (values.decodeIfPresent(Int.self,forKey: .status))
        message = try? (values.decodeIfPresent(String.self,forKey: .message))
        data = try? (values.decodeIfPresent(EndorsementAmountData.self,forKey: .data))
    }
}

// MARK: - EndorsementAmountData
struct EndorsementAmountData: Codable {
    let id, endorsementID, payRangeID, amount: Int?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case endorsementID = "endorsement_id"
        case payRangeID = "pay_range_id"
        case amount = "amount"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try? (values.decodeIfPresent(Int.self,forKey: .id))
        endorsementID = try? (values.decodeIfPresent(Int.self,forKey: .endorsementID))
        payRangeID = try? (values.decodeIfPresent(Int.self,forKey: .payRangeID))
        amount = try? (values.decodeIfPresent(Int.self,forKey: .amount))
    }
}
