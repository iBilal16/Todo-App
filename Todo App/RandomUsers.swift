//
//  RandomUsers.swift
//  ApiPractice
//
//  Created by Bilal Ahmad on 13/01/2022.
//

import Foundation

// MARK: - RandomUser
struct RandomUser: Codable {
    var results: [Result]?
    var info: Info?

    enum CodingKeys: String, CodingKey {
        case results = "results"
        case info = "info"
    }
}

// MARK: - Info
struct Info: Codable {
    var seed: String?
    var results: Int?
    var page: Int?
    var version: String?

    enum CodingKeys: String, CodingKey {
        case seed = "seed"
        case results = "results"
        case page = "page"
        case version = "version"
    }
}

// MARK: - Result
struct Result: Codable {
    var gender: String?
    var name: Name?
    var location: Location?
    var email: String?
    var login: Login?
    var dob: Dob?
    var registered: Dob?
    var phone: String?
    var cell: String?
    var id: ID?
    var picture: Picture?
    var nat: String?

    enum CodingKeys: String, CodingKey {
        case gender = "gender"
        case name = "name"
        case location = "location"
        case email = "email"
        case login = "login"
        case dob = "dob"
        case registered = "registered"
        case phone = "phone"
        case cell = "cell"
        case id = "id"
        case picture = "picture"
        case nat = "nat"
    }
}

// MARK: - Dob
struct Dob: Codable {
    var date: String?
    var age: Int?

    enum CodingKeys: String, CodingKey {
        case date = "date"
        case age = "age"
    }
}

// MARK: - ID
struct ID: Codable {
    var name: String?
    var value: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case value = "value"
    }
}

// MARK: - Location
struct Location: Codable {
    var street: Street?
    var city: String?
    var state: String?
    var country: String?
    var postcode: Int?
    var coordinates: Coordinates?
    var timezone: Timezone?

    enum CodingKeys: String, CodingKey {
        case street = "street"
        case city = "city"
        case state = "state"
        case country = "country"
        case postcode = "postcode"
        case coordinates = "coordinates"
        case timezone = "timezone"
    }
}

// MARK: - Coordinates
struct Coordinates: Codable {
    var latitude: String?
    var longitude: String?

    enum CodingKeys: String, CodingKey {
        case latitude = "latitude"
        case longitude = "longitude"
    }
}

// MARK: - Street
struct Street: Codable {
    var number: Int?
    var name: String?

    enum CodingKeys: String, CodingKey {
        case number = "number"
        case name = "name"
    }
}

// MARK: - Timezone
struct Timezone: Codable {
    var offset: String?
    var timezoneDescription: String?

    enum CodingKeys: String, CodingKey {
        case offset = "offset"
        case timezoneDescription = "description"
    }
}

// MARK: - Login
struct Login: Codable {
    var uuid: String?
    var username: String?
    var password: String?
    var salt: String?
    var md5: String?
    var sha1: String?
    var sha256: String?

    enum CodingKeys: String, CodingKey {
        case uuid = "uuid"
        case username = "username"
        case password = "password"
        case salt = "salt"
        case md5 = "md5"
        case sha1 = "sha1"
        case sha256 = "sha256"
    }
}

// MARK: - Name
struct Name: Codable {
    var title: String?
    var first: String?
    var last: String?

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case first = "first"
        case last = "last"
    }
}

// MARK: - Picture
struct Picture: Codable {
    var large: String?
    var medium: String?
    var thumbnail: String?

    enum CodingKeys: String, CodingKey {
        case large = "large"
        case medium = "medium"
        case thumbnail = "thumbnail"
    }
}
