//
//  BuyListModel.swift
//  Todo App
//
//  Created by Bilal Ahmad on 28/07/2022.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let buyListModel = try? newJSONDecoder().decode(BuyListModel.self, from: jsonData)

import Foundation

// MARK: - BuyListModel
struct BuyListModel: Codable {
    var id: Int?
    var name: String?
    var price: Int?
    var quantity: Int?
    var type: Int?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case price = "price"
        case quantity = "quantity"
        case type = "type"
    }
}

