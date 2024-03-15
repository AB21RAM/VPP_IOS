//
//  HodRepository.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 12/03/24.
//

import Foundation
struct HODStudentData : Identifiable{
    var id = UUID()
    var name : String
    var clgID : String
    var contact : String
}
struct HODFacultyData : Identifiable {
    var id = UUID()
    var name : String
    var departName : String
    var contact : String
    var clgID : String
}
struct HODFacultyLeavesList : Identifiable{
    var id = UUID()
    var facultyName : String
    var alternateName : String
    var leaveAppID : Int
    var leaveID : Int
    var no_of_days : Double
    var fromDate : String
    var toDate : String
    var reason : String
    var facultyID : Int
}
struct HODVisitor{
    var id = UUID() 
    var departmentId: Int
    var facultyName: String
    var imageUrl: String
    var inTime: String
    var name: String
    var outTime: String
    var reason: String
    var status: Int
    var visitDate: String
    var visitorId: Int
}
struct HODNoDuesApplication : Identifiable{
    var id = UUID()
    var batch: String?
    var bname: String?
    var branch: Int
    var category: String?
    var collegeId: String?
    var contact: String?
    var email: String?
    var feeReceipt: String?
    var grno: String?
    var Appid: Int
    var idPhoto: String?
    var name: String?
    var offerAdmit: String?
    var password: String?
    var previousLc: String?
    var proofId: String?
    var remark : String?
}
class HodRepository{
    private let apiResource = HodApiResource()
    // main Screen
    func getPresentFacultyCount(
        completion : @escaping (String)-> Void
    ){
        apiResource.getHODPresentFacultyDetails { result in
            guard let response = result , result?.presentCount != nil else{
                completion("0")
                return
            }
            let data = String(response.presentCount)
            completion(data)
        }
    }
    func getHODStudentList(
    completion : @escaping ([HODStudentData])-> Void
    ){
        apiResource.getHODStudentListDetails { result in
            guard let response = result , result?.studentList != nil else {
                completion([])
                return
            }
            let data : [HODStudentData] = response.studentList.map { Student in
                return HODStudentData(name: Student.name, clgID: String(Student.studId), contact: Student.contact)
            }
            completion(data)
        }
    }
    func getHODFacultyList(
    completion : @escaping ([HODFacultyData])-> Void
    ){
        apiResource.getHODFacultyListDetails { result in
            guard let response = result , result?.facultyList != nil else {
                completion([])
                return
            }
            let data : [HODFacultyData] = response.facultyList.map { Faculty in
                return HODFacultyData(name: Faculty.name, departName: Faculty.departName, contact: Faculty.contact, clgID: Faculty.facultyClgId)
            }
            completion(data)
        }
    }
    //----------------------------------------------------------------------
    // Approve Leave Screen
    func getHODFacultyLeaveList (
        completion : @escaping ([HODFacultyLeavesList])-> Void
    ){
        apiResource.getHODApprovedLeavesDetails { result in
            guard let response = result , result?.approvedLeaves != nil else {
                completion([])
                return
            }
            // Additional Check If the signed by HOD to get sorted out
            let data : [HODFacultyLeavesList] = response.approvedLeaves.map { Leave in
                return HODFacultyLeavesList(facultyName: Leave.primaryFacultyName, alternateName: Leave.alternateFacultyName, leaveAppID: Leave.leaveAppId, leaveID: Leave.leaveId, no_of_days: Leave.noOfDays, fromDate: Leave.fromDate, toDate: Leave.toDate, reason: Leave.reason, facultyID : Leave.facultyId)
            }
            completion(data)
        }
    }
    // Extra Hnadling -- Advance
    func postUpdateleaveStatusBody(
        request: UpdateLeaveStatusBody, // need to change the Request Data Type
        completioHandler: @escaping(_ result: SimpleResponse?) -> Void
    ){
        apiResource.postUpdateleaveStatusBody(request: request) { result in
           completioHandler(result)
        }
    }
    
    //----------------------------------------------------------------------
    // Visiter Approval Screen
    
    func getHODVisitorList(
        completion : @escaping ([HODVisitor])-> Void
    ){
        apiResource.getVisitorsList { result in
            guard let response = result , result?.visitors != nil else {
                completion([])
                return
            }
            // Additional Check If the signed by HOD to get sorted out
            var currHODDepartID = 0
            self.apiResource.getHODDepartmentId { result in
                currHODDepartID = result?.departId ?? 0
            }
            let data : [HODVisitor] = response.visitors.compactMap { visitor in
                if visitor.departmentId == currHODDepartID{
                    return HODVisitor(departmentId: visitor.departmentId, facultyName: visitor.facultyName, imageUrl: visitor.imageUrl, inTime: visitor.inTime, name: visitor.name, outTime: visitor.outTime, reason: visitor.reason, status: visitor.status, visitDate: visitor.visitDate, visitorId: visitor.visitorId)
                }
                return nil
            }
            completion(data)
        }
    }
    
    func updateVisitorStatus(
        request: VisitorStatusUpdateBody, // need to change the Request Data Type
        completioHandler: @escaping(_ result: SimpleResponse?) -> Void
    ){
        apiResource.updateVisitorStatus(request: request) { result in
           completioHandler(result)
        }
    }
    
    //----------------------------------------------------------------------
    // NoDues POST
    
    func postAddNoduesRemark(
        request: PostRemarkBodyResponse, // need to change the Request Data Type
        completioHandler: @escaping(_ result: SimpleResponse?) -> Void
    ){
        apiResource.postAddNoduesRemark(request: request) { result in
           completioHandler(result)
        }
    }
    
    func postFormSignNodues(
        request: HODNoduesSignApplicationBodyResponse, // need to change the Request Data Type
        completioHandler: @escaping(_ result: SimpleResponse?) -> Void
    ){
        apiResource.postFormSignNodues(request: request) { result in
           completioHandler(result)
        }
    }

    //----------------------------------------------------------------------
    // NoDues GET
    
    // All Applications
    func getNoDuesAllApplications (
        completion : @escaping ([HODNoDuesApplication])-> Void
    ){
        apiResource.getNoDuesApplications { result in
            guard let response = result , result?.data != nil else {
                completion([])
                return
            }
            // Additional Check If the signed by HOD to get sorted out
            let data : [HODNoDuesApplication] = response.data.map { app in
                return HODNoDuesApplication( batch: app.batch,
                                             bname: app.bname,
                                             branch: app.branch,
                                             category: app.category,
                                             collegeId: app.collegeId,
                                             contact: app.contact,
                                             email: app.email,
                                             feeReceipt: app.feeReceipt,
                                             grno: app.grno,
                                             Appid: app.id,
                                             idPhoto: app.idPhoto,
                                             name: app.name,
                                             offerAdmit: app.offerAdmit,
                                             password: app.password,
                                             previousLc: app.previousLc,
                                             proofId: app.proofId,
                                             remark: ""
                )
            }
            completion(data)
        }
    }
    func getAllSignedNoDues (
        completion : @escaping ([HODNoDuesApplication])-> Void
    ){
        apiResource.getAllSignedNoDues { result in
            guard let response = result , result?.data != nil else {
                completion([])
                return
            }
            // Additional Check If the signed by HOD to get sorted out
            let data : [HODNoDuesApplication] = response.data.map { app in
                return HODNoDuesApplication( batch: app.batch,
                                             bname: app.bname,
                                             branch: app.branch,
                                             category: app.category,
                                             collegeId: app.collegeId,
                                             contact: app.contact,
                                             email: app.email,
                                             feeReceipt: app.feeReceipt,
                                             grno: app.grno,
                                             Appid: app.id,
                                             idPhoto: app.idPhoto,
                                             name: app.name,
                                             offerAdmit: app.offerAdmit,
                                             password: app.password,
                                             previousLc: app.previousLc,
                                             proofId: app.proofId,
                                             remark: app.remarks
                )
            }
            completion(data)
        }
        func getAllRemarkedNoDues (
            completion : @escaping ([HODNoDuesApplication])-> Void
        ){
            apiResource.getAllRemarkedNoDues { result in
                guard let response = result , result?.data != nil else {
                    completion([])
                    return
                }
                // Additional Check If the signed by HOD to get sorted out
                let data : [HODNoDuesApplication] = response.data.map { app in
                    return HODNoDuesApplication( batch: app.batch,
                                                 bname: app.bname,
                                                 branch: app.branch,
                                                 category: app.category,
                                                 collegeId: app.collegeId,
                                                 contact: app.contact,
                                                 email: app.email,
                                                 feeReceipt: app.feeReceipt,
                                                 grno: app.grno,
                                                 Appid: app.id,
                                                 idPhoto: app.idPhoto,
                                                 name: app.name,
                                                 offerAdmit: app.offerAdmit,
                                                 password: app.password,
                                                 previousLc: app.previousLc,
                                                 proofId: app.proofId,
                                                 remark: app.remarks)
                }
                completion(data)
            }
        }
    }
}
