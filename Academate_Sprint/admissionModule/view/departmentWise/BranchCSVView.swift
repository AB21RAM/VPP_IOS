//
//  BranchCSVView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 22/01/24.
//

import SwiftUI

struct BranchCSVView: View {
    var branch : String
    @State private var refreshView = false
    @State private var showIt = true
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var departmentViewModel = DepartMentViewModel()
    var body: some View {
        
            VStack(alignment: .center) {
                if showIt{
                    Button("Open the Document") {
                        departmentViewModel.downloadBranchApp(brach: branch)
                        DispatchQueue.main.async {
                            refreshView.toggle()
                            showIt.toggle()// Trigger view update on the main thread
                        }
                    }
                    .frame(alignment: .top)
                    .modifier(CardModifier(paddingValue: 10, backgroundColor: Color.blue, cornerRadius: 10, foregroundColor: .white, font: .title))
                }
                
                if let documentURL = departmentViewModel.documentURL {
                    
                        DocumentViewer(url: documentURL)
                            .id(refreshView)
                    
                     // Ensure DocumentViewer is recreated when refreshView changes
//                    DocumentInteractionControllerWrapper(url: documentURL)
//                                .edgesIgnoringSafeArea(.all)
                } else if let downloadError = departmentViewModel.downloadError {
                    Text("Download failed with error: \(downloadError.localizedDescription)")
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: CustomBackButton(action: {
                // Handle back button action
                self.presentationMode.wrappedValue.dismiss()
            }, button_color: Color.black))
    }
}

//#Preview {
//    BranchCSVView()
//}
