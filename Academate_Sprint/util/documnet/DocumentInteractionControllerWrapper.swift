//
//  DocumentInteractionControllerWrapper.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 21/01/24.
//

import Foundation
import SwiftUI
import UIKit

struct DocumentInteractionControllerWrapper: UIViewControllerRepresentable {
    let url: URL

    class Coordinator: NSObject, UIDocumentInteractionControllerDelegate {
        // Add any delegate methods if needed
    }

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        let documentInteractionController = UIDocumentInteractionController(url: url)
        documentInteractionController.delegate = context.coordinator
        documentInteractionController.presentOpenInMenu(from: .zero, in: viewController.view, animated: true)
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        // Update the view controller if needed
    }

    func makeCoordinator() -> Coordinator {
        return Coordinator()
    }
}
