//
//  SportListModel.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 05/02/24.
//

import Foundation

// MARK: - SchoolListModel
struct SportListModel: Codable {
    let status: Int?
    let message: String?
    let data: [SportData]?
    
    enum CodingKeys: String, CodingKey {
        case status = "status"
        case message = "message"
        case data = "data"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try? (values.decodeIfPresent(Int.self,forKey: .status))
        message = try? (values.decodeIfPresent(String.self,forKey: .message))
        data = try? (values.decodeIfPresent([SportData].self,forKey: .data))
    }
}

// MARK: - SchoolData
struct SportData: Codable {
    let id: Int?
    let name: String?
    let image: String?
    var isSelected: Bool = false
    var selected: Int?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case image = "image"
        case selected = "selected"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try? (values.decodeIfPresent(Int.self,forKey: .id))
        name = try? (values.decodeIfPresent(String.self,forKey: .name))
        image = try? (values.decodeIfPresent(String.self,forKey: .image))
        selected = try? (values.decodeIfPresent(Int.self,forKey: .selected))
    }
}
