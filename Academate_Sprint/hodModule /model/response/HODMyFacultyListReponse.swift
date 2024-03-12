//
//  HODMyFacultyListReponse.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 12/03/24.
//

import Foundation
struct HODMyFacultyListReponse: Decodable {
    let facultyList: [FacultyHOD]
    
    private enum CodingKeys: String, CodingKey {
        case facultyList = "FacultyList"
    }
}

struct FacultyHOD: Decodable {
    let contact: String
    let departId: Int
    let departName: String
    let facultyClgId: String
    let facultyId: Int
    let ftname: String
    let ftypeId: Int
    let name: String
    let role1: String
    
    private enum CodingKeys: String, CodingKey {
        case contact, departId = "depart_id", departName = "depart_name", facultyClgId = "faculty_clg_id", facultyId = "faculty_id", ftname, ftypeId = "ftype_id", name, role1
    }
}
