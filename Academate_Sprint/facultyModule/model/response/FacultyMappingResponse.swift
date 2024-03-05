//
//  FacultyMappingResponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 22/02/24.
//
import Foundation

// MARK: - FacultyMappingResponse
struct FacultyMappingResponse: Codable {
    var ftypeList: [FtypeList]
    var departList: [DepartList]
    var role: [Role]

    enum CodingKeys: String, CodingKey {
        case ftypeList = "ftype_list"
        case departList = "depart_list"
        case role
    }
}

// MARK: - DepartList
struct DepartList: Codable {
    var departID: Int
    var name: String

    enum CodingKeys: String, CodingKey {
        case departID = "depart_id"
        case name
    }
}

// MARK: - FtypeList
struct FtypeList: Codable {
    var ftypeID: Int
    var ftname: String

    enum CodingKeys: String, CodingKey {
        case ftypeID = "ftype_id"
        case ftname
    }
}

// MARK: - Role
struct Role: Codable {
    var roleID: Int
    var name: String

    enum CodingKeys: String, CodingKey {
        case roleID = "role_id"
        case name
    }
}
