//
//  StudentAcademicsViewModel.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 28/01/24.
//

import Foundation
struct DocumentItem: Identifiable {
    var id = UUID()
    var name: String
    var url: String
    var type: String?
}
struct AcademicsDataModel{
    var Name : String = String()
    var ContactNumber : String = String()
    var isError: Bool = false
    var isLoading : Bool = true
    var studentDocLinkResponse: StudentDocLinkResponse?
    var documentList: [DocumentItem] = []
}
class StudentAcademicsViewModel : ObservableObject{
    @Published var academicsDataModel: AcademicsDataModel = AcademicsDataModel()
    private let apiResource = StudentApiResource()
    //    var studentDocs: StudentDocLinkResponse
    init() {
        getDocData {
            // This closure will be executed once everything is done in getDocData
            // You can use the updated document list or perform other actions here
            print("Handling updated document list")
        }
    }
    func getDocData(completion: @escaping () -> Void) {
        self.academicsDataModel.isLoading = true

        apiResource.getStudentDocs() { response in
            DispatchQueue.main.async {
                self.academicsDataModel.isLoading = false
                print("data is \(String(describing: response?.docs.photo)) ")
                
                if response?.docs.docID != 0 {
                    self.academicsDataModel.studentDocLinkResponse = response
                    print("data is \(String(describing: response?.docs)) ")
                    // Generate the document list asynchronously
                    self.generateDocumentList { updatedDocumentList in
                        self.academicsDataModel.documentList = updatedDocumentList
                        print("Doc data : \(self.academicsDataModel.documentList)")
//                        var photoData = self.academicsDataModel.documentList.first(where: { $0.name == "Photo" })
//                        self.storePhotoURL(url: photoData?.url ?? "Error", type: photoData?.type ?? "PDF")
                        // Call the completion handler once everything is done
                        completion()
                    }
                } else {
                    self.academicsDataModel.isError = true
                    completion()
                }
            }
        }
    }
    func generateDocumentList(completion: @escaping ([DocumentItem]) -> Void) {
        guard let docs = self.academicsDataModel.studentDocLinkResponse?.docs else {
            completion([])
            return
        }

        let _: () = docs.toDocumentList { updatedList in
            // Handle the updatedList asynchronously
            completion(updatedList)
        }

        // Note: updatedDocumentList will be an empty array here because toDocumentList is asynchronous
        // If you need to use it synchronously, consider using a completion handler for generateDocumentList as well
    }
//    func storePhotoURL(url : String,type : String){
//        userDefaultsManager.setPhotoUrl(url)
//        userDefaultsManager.setPhotoType(type)
//    }
}
extension Docs {
    func toDocumentList(completion: @escaping ([DocumentItem]) -> Void) {
        var documentList = [DocumentItem]()
        
        if !aadharCard.isEmpty {
            documentList.append(DocumentItem(name: "Aadhar Card", url: aadharCard))
        }
        if ((antiraggingForm?.isEmpty) != nil) {
            documentList.append(DocumentItem(name: "Antiragging Form", url: antiraggingForm ?? ""))
                }
        if !backPassbook.isEmpty {
            documentList.append(DocumentItem(name: "Back Passbook", url: backPassbook))
        }
        if !capAllotmentLetter.isEmpty {
            documentList.append(DocumentItem(name: "CAP Allotment Letter", url: capAllotmentLetter))
        }
        if !casteCertificate.isEmpty {
            documentList.append(DocumentItem(name: "Caste Certificate", url: casteCertificate))
        }
        if !casteValidation.isEmpty {
            documentList.append(DocumentItem(name: "Caste Validation", url: casteValidation))
        }
        if !collegeAdmissionLetter.isEmpty {
            documentList.append(DocumentItem(name: "College Admission Letter", url: collegeAdmissionLetter))
        }
        if !domicile.isEmpty {
            documentList.append(DocumentItem(name: "Domicile", url: domicile))
        }
        if !ewsPro.isEmpty {
            documentList.append(DocumentItem(name: "EWS Pro", url: ewsPro))
        }
        if !fcCenterVarification.isEmpty {
            documentList.append(DocumentItem(name: "FC Center Verification", url: fcCenterVarification))
        }
        if !feeReciept.isEmpty {
            documentList.append(DocumentItem(name: "Fee Receipt", url: feeReciept))
        }
//        if  ((gapCERT?.isEmpty) == nil) {
//                    documentList.append(DocumentItem(name: "Gap Certificate", url: gapCERT ?? ""))
//                }
        if !hscMarksheet.isEmpty {
            documentList.append(DocumentItem(name: "HSC Marksheet", url: hscMarksheet))
        }
        if !incomeCertificate.isEmpty {
            documentList.append(DocumentItem(name: "Income Certificate", url: incomeCertificate))
        }
        if !jeeScoreCard.isEmpty {
            documentList.append(DocumentItem(name: "JEE Score Card", url: jeeScoreCard))
        }
        if !lc.isEmpty {
            documentList.append(DocumentItem(name: "LC", url: lc))
        }
        if !mhtCetScoreCard.isEmpty {
            documentList.append(DocumentItem(name: "MHT CET Score Card", url: mhtCetScoreCard))
        }
        if !nonCreamy.isEmpty {
            documentList.append(DocumentItem(name: "Non-Creamy", url: nonCreamy))
        }
        if !parentSignature.isEmpty {
            documentList.append(DocumentItem(name: "Parent Signature", url: parentSignature))
        }
        if !photo.isEmpty {
            documentList.append(DocumentItem(name: "Photo", url: photo))
        }
        if !rationCard.isEmpty {
            documentList.append(DocumentItem(name: "Ration Card", url: rationCard))
        }
        if !signature.isEmpty {
            documentList.append(DocumentItem(name: "Signature", url: signature))
        }
        if !sscMarksheet.isEmpty {
            documentList.append(DocumentItem(name: "SSC Marksheet", url: sscMarksheet))
        }
        let dispatchGroup = DispatchGroup()
        
        for (index, document) in documentList.enumerated() {
            dispatchGroup.enter()
            
            guard let url = URL(string: document.url) else {
                // Handle invalid URL
                documentList[index].type = "Unknown"
                dispatchGroup.leave()
                continue
            }
            
            checkDocumentType(at: url) { documentType in
                DispatchQueue.main.async {
                    // Update the document type in the main thread
                    documentList[index].type = documentType ?? "Unknown"
                    dispatchGroup.leave()
                }
            }
        }
        
        dispatchGroup.notify(queue: .main) {
            // All document types are determined, handle the updated list
            print(documentList)
            completion(documentList)
        }
    }
    func checkDocumentType(at url: URL, completion: @escaping (String?) -> Void) {
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            
            guard let data = data, error == nil else {
                print("Error loading data from URL: \(error?.localizedDescription ?? "Unknown error")")
                completion(nil)
                return
            }
            print("Data: \(data)")
            // Check for PDF
            
            if data.starts(with: [0x25, 0x50, 0x44, 0x46]) || data.starts(with: [0x1F, 0x8B, 0x08]) {
                print("Detected PDF")
                completion("PDF")
                return
            }
            
            // Check for JPEG
            
            if data.starts(with: [0xFF, 0xD8, 0xFF]) {
                print("Detected jpg")
                completion("JPEG")
                return
            }
            
            // Check for PNG
            if data.starts(with: [0x89, 0x50, 0x4E, 0x47, 0x0D, 0x0A, 0x1A, 0x0A]) {
                completion("PNG")
                return
            }
            
            // Check for GIF
            if data.starts(with: [0x47, 0x49, 0x46]) {
                completion("GIF")
                return
            }
            
            // Check for BMP
            if data.starts(with: [0x42, 0x4D]) {
                completion("BMP")
                return
            }
            
            // Check for TIFF
            if data.starts(with: [0x4D, 0x4D, 0x00, 0x2A]) || data.starts(with: [0x49, 0x49, 0x2A, 0x00]) {
                completion("TIFF")
                return
            }
            
            // Add more checks for other image types as needed...
            
            // If no matching type is found
            completion(nil)
        }
        
        task.resume()
    }
    
    
}


//extension Optional where Wrapped == JSONNull {
//    var value: String? {
//        return nil
//    }
//}
