//
//  DocumentViewer.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 17/01/24.
//


import SwiftUI
import Foundation
import QuickLook
struct DocumentViewer: UIViewControllerRepresentable {
    var url: URL
    
    func makeUIViewController(context: Context) -> UIViewController {
        let previewController = QLPreviewController()
        previewController.dataSource = context.coordinator
        previewController.delegate = context.coordinator
        context.coordinator.previewController = previewController
        return previewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, QLPreviewControllerDataSource, QLPreviewControllerDelegate {
        var parent: DocumentViewer
        var previewController: QLPreviewController?
        var zoomedIndex: Int?
        
        init(_ parent: DocumentViewer) {
            self.parent = parent
        }
        
        // MARK: - QLPreviewControllerDataSource
        
        func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
            return 1
        }
        
        func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
            return parent.url as QLPreviewItem
        }
        
        // MARK: - QLPreviewControllerDelegate
        
        func previewController(_ controller: QLPreviewController, willDismissWithPreviewItem index: Int) {
            // Reset the zoomedIndex when the preview is dismissed
            zoomedIndex = nil
        }
        
        func previewController(_ controller: QLPreviewController, transitionViewFor previewItem: QLPreviewItem) -> UIView? {
            if let zoomedIndex = zoomedIndex, zoomedIndex == controller.currentPreviewItemIndex {
                // Return the view that you want to zoom in on
                // You might need to customize this based on your document content
                return controller.view
            }
            return nil
        }
        
        // Implement other QLPreviewControllerDelegate methods as needed
        
    }
}
