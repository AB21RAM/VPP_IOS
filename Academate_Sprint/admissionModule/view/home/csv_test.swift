//
//  csv_test.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 16/01/24.
//

import SwiftUI
import Foundation
import QuickLook
/*
 class DocumentViewerDelegate: NSObject, UIDocumentInteractionControllerDelegate {
 
 // MARK: - UIDocumentInteractionControllerDelegate
 
 // This method is called when the document interaction controller needs to determine the view controller to present from.
 func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
 // Access the current view controller in a SwiftUI app using UIWindowScene
 if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
 let topViewController = windowScene.windows.first?.rootViewController {
 return topViewController
 }
 
 // If the above method fails, you might need to keep a reference to your SwiftUI UIViewController.
 // return YourSwiftUIViewController
 fatalError("Unable to find the current view controller.")
 }
 
 // This method is called when the document interaction controller is about to dismiss the preview.
 func documentInteractionControllerDidEndPreview(_ controller: UIDocumentInteractionController) {
 // Perform any cleanup or additional actions after the preview is dismissed.
 }
 
 // You can implement other delegate methods as needed based on your requirements.
 }
 */
/*
 struct DocumentViewer: UIViewControllerRepresentable {
 var url: URL
 
 func makeUIViewController(context: Context) -> UIViewController {
 let documentController = UIDocumentInteractionController(url: url)
 documentController.delegate = context.coordinator
 return UIViewController()
 }
 
 func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
 
 func makeCoordinator() -> Coordinator {
 Coordinator()
 }
 
 class Coordinator: NSObject, UIDocumentInteractionControllerDelegate {
 // Implement delegate methods if needed
 // For example, you can instantiate DocumentViewerDelegate here and use it as the delegate.
 let delegate = DocumentViewerDelegate()
 
 // You can implement the delegate methods here or in a separate delegate class.
 }
 }
 */


struct csv_test: View {
    //    @State private var documentInteractionController: UIDocumentInteractionController?
    var branch: Int
    @State private var refreshView = false
    @ObservedObject var dashboardViewModel = DashBoardViewModel()
    
    var body: some View {
        /*
         Button("Open CSV") {
         downloadCSVFile { result in
         switch result {
         case .success(let url): self.documentURL = url
         case .failure(let error):print("Error: \(error)")
         }
         }
         Assuming csvData is the CSV response data you received
         let csvData = String(dashboardViewModel.dashboardDataModel.new_data).data(using: .utf8)!
         
         // Save the CSV data to a temporary file
         let tempDirectoryURL = FileManager.default.temporaryDirectory
         let tempFileURL = tempDirectoryURL.appendingPathComponent("data.csv")
         
         do {
         try csvData.write(to: tempFileURL)
         } catch {
         print("Error writing CSV data to file: \(error)")
         return
         }
         
         // Get the first window scene
         if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
         // Initialize the document interaction controller
         self.documentInteractionController = UIDocumentInteractionController(url: tempFileURL)
         self.documentInteractionController?.delegate = windowScene.windows.first?.rootViewController as? UIViewController as? any UIDocumentInteractionControllerDelegate
         
         // Present the options menu for the user to open the file
         self.documentInteractionController?.presentOptionsMenu(from: CGRect.zero, in: windowScene.windows.first?.rootViewController?.view ?? UIView(), animated: true)
         }
         
         }
         */
        Text("Test CSV")
        
        /*
        VStack {
            Button("Download and Open File") {
                
                dashboardViewModel.downloadCSVFile(brach: branch)
                DispatchQueue.main.async {
                    refreshView.toggle() // Trigger view update on the main thread
                }
            }
            Button("Download and Open File2") {
//                branch = 1
                dashboardViewModel.downloadCSVFile(brach: branch)
                DispatchQueue.main.async {
                    refreshView.toggle() // Trigger view update on the main thread
                }
            }
            
            if let documentURL = dashboardViewModel.documentURL {
                DocumentViewer(url: documentURL)
                    .id(refreshView) // Ensure DocumentViewer is recreated when refreshView changes
            } else if let downloadError = dashboardViewModel.downloadError {
                Text("Download failed with error: \(downloadError.localizedDescription)")
            } else {
                Text("Press the button to download and open the file.")
            }
        }
         */
        
        
        //                Button("Download and Open File") {
        //                    branch = 2
        //                    dashboardViewModel.downloadCSVFile(brach: branch)
        //                }
        //
        //                if let documentURL = dashboardViewModel.documentURL {
        //                    DocumentViewer(url: documentURL)
        //                } else if let downloadError = dashboardViewModel.downloadError {
        //                    Text("Download failed with error: \(downloadError.localizedDescription)")
        //                } else {
        //                    Text("Press the button to download and open the file.")
        //                }
    }
}


