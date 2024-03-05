//
//  StudentRepository.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 17/02/24.
//

import Foundation
class StudentRepository {
    private let apiResource = StudentApiResource()
    private let userDefaultsManager = UserDefaultsManager.shared
    func getPersonalData(completion: @escaping (personalData?) -> Void) {
        apiResource.getStudentPersonalDetails() { response in
            guard let response = response, response.code != 0 else {
                completion(nil)
                return
            }
            if let data = response.radd.first {
                
                let dateString : String? = data.dob
                var dob = ""
                let isoDateFormatter = ISO8601DateFormatter()
                // Add support for milliseconds in the date format
                isoDateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
                if let dateString = dateString, let date = isoDateFormatter.date(from: dateString) {
                    let formattedDate = DateFormatter.localizedString(from: date, dateStyle: .medium, timeStyle: .none)
                    let substring = String(formattedDate.prefix(12))
                    dob = substring
                    print(dob)
                } else {
                    // Print the original date string for debugging
                    print("Invalid date string: \(String(describing: dateString))")
                }
                
                let personalData = personalData(Name: data.name, dob: dob, ContactNumber: data.contact)
                completion(personalData)
            } else {
                completion(nil)
            }
        }
    }
    func getCurrEduData(completion: @escaping(educationalData?) -> Void){
        apiResource.getStudentCurrEduDetails(){ response in
//            guard let response = response ,!response.category.isEmpty else{
//                completion(nil)
//                return
//            }
            print("CurrentEdu response : \(String(describing: response))")
            let category = response?.category
            if let data = response?.data.first{
                var branch = ""
                switch data.branchID {
                case 1:
                    branch = "Computer Engineering"
                case 2:
                    branch = "AI & DS"
                case 4:
                    branch = "Information Technology"
                default:
                    branch = "VPPCOE"
                }
                var programm = ""
                switch data.programmID {
                case 1:
                    programm = "F.Y. B.E"
                case 2:
                    programm = "D.S.E"
                case 3:
                    programm = "S.E"
                case 4:
                    programm = "T.E"
                case 5:
                    programm = "B.E"
                default:
                    programm = "VPPCOE"
                }
                DispatchQueue.global().async {
                    DispatchQueue.main.async {
                        self.userDefaultsManager.setCollegeID(data.studClgID)
                    }
                }
                let educationalData = educationalData(gr: data.grNumber,caste: category ?? "", idNo: data.studClgID ,acYear: data.academicYear,branch:branch ,program: programm)
                completion(educationalData)
            }
             else {
                completion(nil)
            }
        }
    }
    func getStudentPhoto(completion: @escaping(photoData?)-> Void){
        apiResource.getStudentDocs(){ response in
            let data = response?.docs.photo
            completion(photoData(photoUrl: data ?? ""))
        }
    }
    func getSemData(completion: @escaping(StudentSemDetailsResponse?) -> Void){
        apiResource.getStudentSemDetails(){ response in
            completion(response)
        }
    }
    
    
    func getStudentFeeStructure(completion : @escaping(FeeData?)-> Void){
        apiResource.getStudentFeeStructure{ response in
            guard let response = response , response.found else{
                completion(nil)
                return
            }
            
            let totalAmount = response.result.map {data in
                data.amount
            }.reduce(0, +)
            var feeHeads : [FeeStructureData] = []
            let _: [()] = response.result.map { data in
                switch data.fhID {
                    case 1:
                        feeHeads.append(FeeStructureData(FeeHead: "Tuition Fee", amount: String(data.amount)))
                    case 2:
                        feeHeads.append(FeeStructureData(FeeHead: "Development Fee", amount: String(data.amount)))
                    case 3:
                        feeHeads.append(FeeStructureData(FeeHead: "Other Fee", amount: String(data.amount)))
                    case 4:
                        feeHeads.append(FeeStructureData(FeeHead: "Bonafide Certificate", amount: String(data.amount)))
                    case 5:
                        feeHeads.append(FeeStructureData(FeeHead: "REFUNDABLE FEES", amount: String(data.amount)))
                    case 15:
                        feeHeads.append(FeeStructureData(FeeHead: "Amartya Shiksha Yojna", amount: String(data.amount)))
                    case 16:
                        feeHeads.append(FeeStructureData(FeeHead: "Letterhead Charges", amount: String(data.amount)))
                    case 17:
                        feeHeads.append(FeeStructureData(FeeHead: "Fee Structure Charges", amount: String(data.amount)))
                    case 18:
                        feeHeads.append(FeeStructureData(FeeHead: "Transfer Certificate", amount: String(data.amount)))
                    case 19:
                        feeHeads.append(FeeStructureData(FeeHead: "Revaluation Fees", amount: String(data.amount)))
                    case 20:
                        feeHeads.append(FeeStructureData(FeeHead: "Form Fees", amount: String(data.amount)))
                    case 21:
                        feeHeads.append(FeeStructureData(FeeHead: "Transcript Charges", amount: String(data.amount)))
                    case 22:
                        feeHeads.append(FeeStructureData(FeeHead: "Photocopy", amount: String(data.amount)))
                    case 23:
                        feeHeads.append(FeeStructureData(FeeHead: "Cancellation Charges", amount: String(data.amount)))
                    case 24:
                        feeHeads.append(FeeStructureData(FeeHead: "Student Group Insurance Premium", amount: String(data.amount)))
                    case 25:
                        feeHeads.append(FeeStructureData(FeeHead: "Duplicate ID Fine", amount: String(data.amount)))
                    case 26:
                        feeHeads.append(FeeStructureData(FeeHead: "Examination Fees", amount: String(data.amount)))
                    case 27:
                        feeHeads.append(FeeStructureData(FeeHead: "Form Fees", amount: String(data.amount)))
                    case 28:
                        feeHeads.append(FeeStructureData(FeeHead: "Marksheet Fees", amount: String(data.amount)))
                    default:
                        break
                }
            }
            completion(FeeData(totalAmount: String(totalAmount),feeStructure: feeHeads))
        }
    }
    func getStudentBalanceAmount(completion : @escaping(BalanceData?)-> Void){
        apiResource.getStudentBalanceFee{ response in
            guard let response = response , response.success else{
                completion(nil)
                return
            }
            
            let balanceAmount = response.result.map{ data in
                data.balanceAmount
            }.reduce(0, +)
            completion(BalanceData(balanceAmount: String(balanceAmount)))
        }
    }
}

struct BalanceData{
    var balanceAmount : String = String()
}
struct FeeData{
    var totalAmount : String = String()
    var feeStructure : [FeeStructureData] = []
}
struct FeeStructureData : Hashable{
    var FeeHead : String = String()
    var amount : String = String()
    
    func hash(into hasher: inout Hasher) {
            hasher.combine(FeeHead)
            hasher.combine(amount)
            // Combine any other properties that uniquely identify each instance
        }
}

struct personalData {
    var Name : String = String()
    var dob : String = String()
    var ContactNumber : String = String()
}

struct educationalData{
    var gr : String = String()
    var caste : String = String()
    var idNo : String = String()
    var acYear : String = String()
    var branch : String = String()
    var program : String = String()
}

struct photoData {
    var photoUrl : String = String()
}


