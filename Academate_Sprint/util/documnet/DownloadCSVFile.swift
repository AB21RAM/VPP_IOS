//
//  downloadCSVFile.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 16/01/24.
//

import Foundation
import UIKit

func DownloadPendingCSVFile(brach: Int,completion: @escaping (Result<URL, Error>) -> Void) {
    var urlComponents = URLComponents(string: "https://vppcoe-va.getflytechnologies.com/api/admission/pendingAppD")!
        // Add dynamic query parameters
        let branchQueryItem = URLQueryItem(name: "brach", value: "\(brach)")
        // Add more query items if needed

        urlComponents.queryItems = [branchQueryItem]
        // Add more query items as needed

        guard let url = urlComponents.url else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
    
    let task = URLSession.shared.downloadTask(with: url) { (tempURL, response, error) in
        if let error = error {
            print("Error during download task: \(error)")
            completion(.failure(error))
            return
        }
        
        guard let tempURL = tempURL else {
            let noDataError = NSError(domain: "No data received", code: 0, userInfo: nil)
            print("No data received error: \(noDataError)")
            completion(.failure(noDataError))
            return
        }
        
        do {
            let documentsURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            
            // Specify the destination directory
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "M-d-yy_h:mm_a"
            let formattedDate = dateFormatter.string(from: Date())
            let destinationDirectory = documentsURL.appendingPathComponent("downloadedFile_\(formattedDate)")
            
            // Create intermediate directories if they don't exist
            try FileManager.default.createDirectory(at: destinationDirectory, withIntermediateDirectories: true, attributes: nil)
            
            // Specify the destination file URL
            let destinationURL = destinationDirectory.appendingPathComponent("downloadedFilenewtwo.csv")
            
            // Check if a file with the same name already exists
            if FileManager.default.fileExists(atPath: destinationURL.path) {
                // Handle the conflict by renaming the file or taking appropriate action
                let fileNameWithoutExtension = destinationURL.deletingPathExtension().lastPathComponent
                let fileExtension = destinationURL.pathExtension
                let newName = "\(fileNameWithoutExtension)_\(UUID().uuidString).\(fileExtension)"
                let newURL = destinationDirectory.appendingPathComponent(newName)
                try FileManager.default.moveItem(at: tempURL, to: newURL)
                completion(.success(newURL))
            } else {
                // Move the file to the destination
                try FileManager.default.moveItem(at: tempURL, to: destinationURL)
                completion(.success(destinationURL))
            }
        } catch {
            print("Error during file handling: \(error)")
            completion(.failure(error))
        }
    }
    task.resume()
}
func DownloadBranchYearCSVFile(year : Int , brach: String,completion: @escaping (Result<URL, Error>) -> Void) {
    var urlComponents = URLComponents(string: "https://vppcoe-va.getflytechnologies.com/api/admission/departmentAdmissionIT")!
        // Add dynamic query parameters
        let branchQueryItem = URLQueryItem(name: "brach", value: "\(brach)")
        let yearQueryItem = URLQueryItem(name: "year", value: "\(year)")
        // Add more query items if needed

        urlComponents.queryItems = [branchQueryItem,yearQueryItem]
        // Add more query items as needed

        guard let url = urlComponents.url else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
    
    let task = URLSession.shared.downloadTask(with: url) { (tempURL, response, error) in
        if let error = error {
            print("Error during download task: \(error)")
            completion(.failure(error))
            return
        }
        
        guard let tempURL = tempURL else {
            let noDataError = NSError(domain: "No data received", code: 0, userInfo: nil)
            print("No data received error: \(noDataError)")
            completion(.failure(noDataError))
            return
        }
        
        do {
            let documentsURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            
            // Specify the destination directory
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "M-d-yy_h:mm_a"
            let formattedDate = dateFormatter.string(from: Date())
            let destinationDirectory = documentsURL.appendingPathComponent("downloadedFile_\(formattedDate)")
            
            // Create intermediate directories if they don't exist
            try FileManager.default.createDirectory(at: destinationDirectory, withIntermediateDirectories: true, attributes: nil)
            
            // Specify the destination file URL
            let destinationURL = destinationDirectory.appendingPathComponent("downloadedFilenewtwo.csv")
            
            // Check if a file with the same name already exists
            if FileManager.default.fileExists(atPath: destinationURL.path) {
                // Handle the conflict by renaming the file or taking appropriate action
                let fileNameWithoutExtension = destinationURL.deletingPathExtension().lastPathComponent
                let fileExtension = destinationURL.pathExtension
                let newName = "\(fileNameWithoutExtension)_\(UUID().uuidString).\(fileExtension)"
                let newURL = destinationDirectory.appendingPathComponent(newName)
                try FileManager.default.moveItem(at: tempURL, to: newURL)
                completion(.success(newURL))
            } else {
                // Move the file to the destination
                try FileManager.default.moveItem(at: tempURL, to: destinationURL)
                completion(.success(destinationURL))
            }
        } catch {
            print("Error during file handling: \(error)")
            completion(.failure(error))
        }
    }
    task.resume()
}


func DownloadBranchCSVFile(brach: String,completion: @escaping (Result<URL, Error>) -> Void) {
    var urlComponents = URLComponents(string: "https://vppcoe-va.getflytechnologies.com/api/admission/departmentAdmissionComputer")!
        // Add dynamic query parameters
        let branchQueryItem = URLQueryItem(name: "brach", value: "\(brach)")
        // Add more query items if needed

        urlComponents.queryItems = [branchQueryItem]
        // Add more query items as needed

        guard let url = urlComponents.url else {
            completion(.failure(NSError(domain: "Invalid URL", code: 0, userInfo: nil)))
            return
        }
    
    let task = URLSession.shared.downloadTask(with: url) { (tempURL, response, error) in
        if let error = error {
            print("Error during download task: \(error)")
            completion(.failure(error))
            return
        }
        
        guard let tempURL = tempURL else {
            let noDataError = NSError(domain: "No data received", code: 0, userInfo: nil)
            print("No data received error: \(noDataError)")
            completion(.failure(noDataError))
            return
        }
        
        do {
            let documentsURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            
            // Specify the destination directory
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "M-d-yy_h:mm_a"
            let formattedDate = dateFormatter.string(from: Date())
            let destinationDirectory = documentsURL.appendingPathComponent("downloadedFile_\(formattedDate)")
            
            // Create intermediate directories if they don't exist
            try FileManager.default.createDirectory(at: destinationDirectory, withIntermediateDirectories: true, attributes: nil)
            
            // Specify the destination file URL
            let destinationURL = destinationDirectory.appendingPathComponent("downloadedFilenewtwo.csv")
            
            // Check if a file with the same name already exists
            if FileManager.default.fileExists(atPath: destinationURL.path) {
                // Handle the conflict by renaming the file or taking appropriate action
                let fileNameWithoutExtension = destinationURL.deletingPathExtension().lastPathComponent
                let fileExtension = destinationURL.pathExtension
                let newName = "\(fileNameWithoutExtension)_\(UUID().uuidString).\(fileExtension)"
                let newURL = destinationDirectory.appendingPathComponent(newName)
                try FileManager.default.moveItem(at: tempURL, to: newURL)
                completion(.success(newURL))
            } else {
                // Move the file to the destination
                try FileManager.default.moveItem(at: tempURL, to: destinationURL)
                completion(.success(destinationURL))
            }
        } catch {
            print("Error during file handling: \(error)")
            completion(.failure(error))
        }
    }
    task.resume()
}
// Function to open a document using UIDocumentInteractionController

func openDocumentInteractionController(with url: URL) -> UIDocumentInteractionController {
    let documentInteractionController = UIDocumentInteractionController(url: url)
    
    guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
          let window = windowScene.windows.first else {
        fatalError("No valid window available.")
    }

    if !documentInteractionController.presentOpenInMenu(from: .zero, in: window, animated: true) {
        print("No compatible apps installed to open the document")
    }

    return documentInteractionController
}

