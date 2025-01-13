//
//  StateListModel.swift
//  NiliRock1.1
//
//  Created by Vijay's Braintech on 01/02/24.
//

import Foundation

// MARK: - CountryListModel
struct CountryListModel: Codable {
    let status: Int
    let message: String
    let data: [CountryData]
}

// MARK: - Datum
struct CountryData: Codable {
    let id: Int
    let name: String
}
