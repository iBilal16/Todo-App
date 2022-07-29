//
//  CallListModel.swift
//  Todo App
//
//  Created by Bilal Ahmad on 28/07/2022.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let callListModel = try? newJSONDecoder().decode(CallListModel.self, from: jsonData)

import Foundation

// MARK: - CallListModel
struct CallListData: Codable {
    var id: Int?
    var name: String?
    var number: String?

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case number = "number"
    }
}
