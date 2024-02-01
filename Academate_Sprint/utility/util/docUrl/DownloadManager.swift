//
//  Download.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 28/01/24.
//

import Foundation
import UIKit
import SwiftUI

final class DownloadManager: ObservableObject {
    @Published var isDownloading = false
    @Published var isDownloaded = false

    // MARK: - Download Methods
    func downloadFile(fileURL: String, fileName: String) {
        print("downloadFile")
        isDownloading = true

        let docsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let destinationUrl = docsUrl?.appendingPathComponent(fileName)

        if let destinationUrl = destinationUrl {
            if FileManager().fileExists(atPath: destinationUrl.path) {
                print("\(destinationUrl.path)")
                print("File already exists")
                isDownloading = false
                isDownloaded = true
            } else {
                let urlRequest = URLRequest(url: URL(string: fileURL)!)

                let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                    if let error = error {
                        print("Request error: ", error)
                        self.isDownloading = false
                        return
                    }

                    guard let response = response as? HTTPURLResponse else { return }

                    if response.statusCode == 200 {
                        guard let data = data else {
                            self.isDownloading = false
                            return
                        }
                        DispatchQueue.main.async {
                            do {
                                try data.write(to: destinationUrl, options: Data.WritingOptions.atomic)
                                
                                DispatchQueue.main.async {
                                    self.isDownloading = false
                                    self.isDownloaded = true
                                }
                            } catch let error {
                                print("Error saving file: ", error)
                                self.isDownloading = false
                            }
                        }
                    }
                }
                dataTask.resume()
            }
        }
    }

    // MARK: - Delete Methods
    
    func deleteFile(fileName: String) {
        let docsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let destinationUrl = docsUrl?.appendingPathComponent(fileName)

        if let destinationUrl = destinationUrl {
            guard FileManager().fileExists(atPath: destinationUrl.path) else { return }
            do {
                try FileManager().removeItem(at: destinationUrl)
                print("File deleted successfully")
                isDownloaded = false
            } catch let error {
                print("Error while deleting file: ", error)
            }
        }
    }

    // MARK: - Check Existence Methods
    
    func checkFileExists(fileName: String) {
        let docsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let destinationUrl = docsUrl?.appendingPathComponent(fileName)
        if let destinationUrl = destinationUrl {
            isDownloaded = FileManager().fileExists(atPath: destinationUrl.path)
        } else {
            isDownloaded = false
        }
    }

    // MARK: - Get Methods
    
    func getFile(fileType: String, fileName: String) -> Any? {
        let docsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let destinationUrl = docsUrl?.appendingPathComponent(fileName)

        if let destinationUrl = destinationUrl, let fileData = try? Data(contentsOf: destinationUrl) {
            if fileType == "pdf" {
                return fileData
            } else if fileType == "image" {
                return UIImage(data: fileData)
            } else {
                return nil
            }
        } else {
            return nil
        }
    }

    func getFileURL(fileName: String) -> URL? {
        let docsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let destinationUrl = docsUrl?.appendingPathComponent(fileName)
        print(destinationUrl ?? "")
        return destinationUrl
    }
}

/*
final class DownloadManager: ObservableObject {
    @Published var isDownloading = false
    @Published var isDownloaded = false
    
    func downloadImage() {
        print("downloadImage")
        isDownloading = true
        
        let docsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        
        let destinationUrl = docsUrl?.appendingPathComponent("MyPhoto.jpg")
        if let destinationUrl = destinationUrl {
            if (FileManager().fileExists(atPath: destinationUrl.path)) {
                print("\(destinationUrl.path)")
                print("File already exists")
                isDownloading = false
                isDownloaded = true
            } else {
                let urlRequest = URLRequest(url: URL(string: "https://ik.imagekit.io/getflytechnologies/leave_proof_4KZn8R7ie.jpg")!)
                
                let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
                    
                    if let error = error {
                        print("Request error: ", error)
                        self.isDownloading = false
                        return
                    }
                    
                    guard let response = response as? HTTPURLResponse else { return }
                    
                    if response.statusCode == 200 {
                        guard let data = data else {
                            self.isDownloading = false
                            return
                        }
                        DispatchQueue.main.async {
                            do {
                                try data.write(to: destinationUrl, options: Data.WritingOptions.atomic)
                                
                                DispatchQueue.main.async {
                                    self.isDownloading = false
                                    self.isDownloaded = true
                                }
                            } catch let error {
                                print("Error saving image: ", error)
                                self.isDownloading = false
                            }
                        }
                    }
                }
                dataTask.resume()
            }
        }
    }
    
    func deleteImage() {
        let docsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        
        let destinationUrl = docsUrl?.appendingPathComponent("MyPhoto.jpg")
        if let destinationUrl = destinationUrl {
            guard FileManager().fileExists(atPath: destinationUrl.path) else { return }
            do {
                try FileManager().removeItem(atPath: destinationUrl.path)
                print("Image deleted successfully")
                isDownloaded = false
            } catch let error {
                print("Error while deleting image file: ", error)
            }
        }
    }
    
    func checkImageExists() {
        let docsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        
        let destinationUrl = docsUrl?.appendingPathComponent("MyPhoto.jpg")
        if let destinationUrl = destinationUrl {
            isDownloaded = FileManager().fileExists(atPath: destinationUrl.path)
        } else {
            isDownloaded = false
        }
    }
    
    func getImage() -> UIImage? {
        let docsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        
        let destinationUrl = docsUrl?.appendingPathComponent("MyPhoto.jpg")
        if let destinationUrl = destinationUrl, let imageData = try? Data(contentsOf: destinationUrl) {
            return UIImage(data: imageData)
        } else {
            return nil
        }
    }
    func getImageFileURL() -> URL? {
        let docsUrl = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        let destinationUrl = docsUrl?.appendingPathComponent("MyPhoto.jpg")
        print(destinationUrl ?? "")
        return destinationUrl
    }
}
*/
