//
//  downloadCSVFile.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 16/01/24.
//

import Foundation

func DownloadCSVFile(brach: Int,completion: @escaping (Result<URL, Error>) -> Void) {
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
