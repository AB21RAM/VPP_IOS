//
//  DocumentViewerView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 28/01/24.
//

import SwiftUI
import PDFKit

/// Bug -- if need to add the user name before the file name beacause if same file exists then it is showing previous file
/// Need to add isLoading for Better UI
struct DocumentViewerView: View {
    @State private var documentPickerPresented = false
    @State private var isShareSheetPresented = false
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var downloadManager = DownloadManager()
    @Binding var item : DocumentItem?
    @State var btnVisibility : Bool = true
    private let userDefaults = UserDefaultsManager()
    var body: some View {
        VStack{
            if let item = item {
                if item.type == "JPEG" {
                    Text("\(item.name)")
                        .font(.title)
                        .onAppear {
                            downloadManager.checkFileExists(fileName: sanitizeFileName("My\(item.name)\(userDefaults.getEmail() ?? "Name").jpg"))
                        }
                        .modifier(ResizableCardModifier(paddingValue: 10, backgroundColor: Color("background"), cornerRadius: 10, foregroundColor: Color("toolbar"), font: .title2))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(20)
                    //                    if btnVisibility{
                    //                        Button("Download \(item.name)") {
                    //                            downloadManager.downloadFile(fileURL: "\(item.url)", fileName: sanitizeFileName("My\(item.name).jpg"))
                    //                            btnVisibility.toggle()
                    //                        }
                    //                    }
                    if downloadManager.isDownloaded {
                        if let file = downloadManager.getFile(fileType: "image", fileName: sanitizeFileName("My\(item.name)\(userDefaults.getEmail() ?? "Name").jpg")) as? UIImage {
                            Image(uiImage: file)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 500, height: 500)
                            Button(action: {
                                isShareSheetPresented.toggle()
                            }, label: {
                                HStack{
                                    Image(systemName: "arrowshape.turn.up.right.fill")
                                    Text("Share Image")
                                }.modifier(ResizableCardModifier(paddingValue: 10, backgroundColor: Color("background"), cornerRadius: 10, foregroundColor: Color("toolbar"), font: .title2))
                            }).actionSheet(isPresented: $isShareSheetPresented) {
                                ActionSheet(title: Text("Share Image"), buttons: [
                                    .default(Text("Share")) {
                                        shareImage(file)
                                    },
                                    .cancel()
                                ])
                            }
                        }
                    }
                    else{
                        Button("Download \(item.name)") {
                            downloadManager.downloadFile(fileURL: "\(item.url)", fileName: sanitizeFileName("My\(item.name)\(userDefaults.getEmail() ?? "Name").jpg"))
                            btnVisibility.toggle()
                        }
                    }
                }
                else if item.type == "PDF" {
                    Text("\(item.name)")
                        .font(.title)
                        .onAppear {
                            downloadManager.checkFileExists(fileName: sanitizeFileName("My\(item.name)\(userDefaults.getEmail() ?? "Name").jpg"))
                        }
                    if btnVisibility{
                        Button("Download \(item.name)") {
                            downloadManager.downloadFile(fileURL: "\(item.url)", fileName: sanitizeFileName("My\(item.name)\(userDefaults.getEmail() ?? "Name").pdf"))
                            btnVisibility.toggle()
                        }
                    }
                    if downloadManager.isDownloaded {
                        if let fileData = downloadManager.getFile(fileType: "pdf", fileName: sanitizeFileName("My\(item.name)\(userDefaults.getEmail() ?? "Name").pdf")) as? Data {
                            if let pdfDocument = PDFDocument(data: fileData) {
                                PDFKitView(showing: pdfDocument)
                                    .scaledToFit()
                                Button(action: {
                                    isShareSheetPresented.toggle()
                                }, label: {
                                    HStack{
                                        Image(systemName: "arrowshape.turn.up.right.fill")
                                        Text("Share PDF")
                                    }
                                }).actionSheet(isPresented: $isShareSheetPresented) {
                                    ActionSheet(title: Text("Share PDF"), buttons: [
                                        .default(Text("Share")) {
                                            sharePDF(downloadManager.getFileURL(fileName: sanitizeFileName("My\(item.name)\(userDefaults.getEmail() ?? "Name").pdf"))!)
                                        },
                                        .cancel()
                                    ])
                                }
                            }
                        }
                        
                    }
                }
            }
            
        }.foregroundStyle(Color("toolbar"))
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: CustomBackButton(action: {
                // Handle back button action
                self.presentationMode.wrappedValue.dismiss()
            }, button_color: Color("toolbar")))
        /*
         VStack {
         
         
         Button("Download PDF") {
         downloadManager.downloadFile(fileURL: "https://www.vidyalankar.org/engineering/assets/docs/te/computer-engineering-syllabus-sem-vi-mumbai-university.pdf", fileName: "MyDocument.pdf")
         }
         
         //            Button("Delete File") {
         //                downloadManager.deleteFile(fileName: "MyPhoto.jpg")
         //                downloadManager.deleteFile(fileName: "MyDocument.pdf")
         //            }
         
         Button("Check Image Existence") {
         downloadManager.checkFileExists(fileName: "MyPhoto.jpg")
         }
         //
         //            Button("Check PDF Existence") {
         //                downloadManager.checkFileExists(fileName: "MyDocument.pdf")
         //            }
         
         
         //                else
         if let fileData = downloadManager.getFile(fileType: "pdf", fileName: "MyDocument.pdf") as? Data {
         if let pdfDocument = PDFDocument(data: fileData) {
         PDFKitView(showing: pdfDocument)
         .scaledToFit()
         
         Button("Share PDf") {
         isShareSheetPresented.toggle()
         }.actionSheet(isPresented: $isShareSheetPresented) {
         ActionSheet(title: Text("Share PDF"), buttons: [
         .default(Text("Share")) {
         sharePDF(downloadManager.getFileURL(fileName: "MyDocument.pdf")!)
         },
         .cancel()
         ])
         }
         }
         }
         Spacer()
         }
         */
    }
    private func sanitizeFileName(_ fileName: String) -> String {
        return fileName.replacingOccurrences(of: " ", with: "_")
    }
    private func shareImage(_ image: UIImage) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first
        else {
            return
        }
        
        let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        window.rootViewController?.present(activityViewController, animated: true, completion: nil)
    }
    private func sharePDF(_ pdfURL: URL) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first
        else {
            return
        }
        
        let activityViewController = UIActivityViewController(activityItems: [pdfURL], applicationActivities: nil)
        window.rootViewController?.present(activityViewController, animated: true, completion: nil)
    }
    
}

//    func downloadImage() {
//        let url = URL(string: "https://cdn.arstechnica.net/wp-content/uploads/2018/06/macOS-Mojave-Dynamic-Wallpaper-transition.jpg")!
//
//        URLSession.shared.dataTask(with: url) { data, _, _ in
//            if let data = data, let uiImage = UIImage(data: data) {
//                let downloadedImage = Image(uiImage: uiImage)
//                DispatchQueue.main.async {
//                    self.downloadedImage = downloadedImage
//                }
//            }
//        }.resume()
//    }


//#Preview {
//    DocumentViewerView(docName: "Aadhar Card",)
//}

//    //    @State private var image : UIImage
//    var body: some View {
//        VStack {
//            Text("Image Download Example")
//                .font(.title)
//
//            if downloadManager.isDownloading {
//                ProgressView("Downloading...")
//            } else {
//                if downloadManager.isDownloaded {
//                    if let image = downloadManager.getImage() {
//                        VStack{
//                            Image(uiImage: image)
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 200, height: 200)
//                            Button("Share Image") {
//                                isShareSheetPresented.toggle()
//                            }.actionSheet(isPresented: $isShareSheetPresented) {
//                                ActionSheet(title: Text("Share Image"), buttons: [
//                                    .default(Text("Share")) {
//                                        shareImage(image)
//                                    },
//                                    .cancel()
//                                ])
//                            }
//                        }
//                    } else {
//                        Text("Error loading image")
//                    }
//                } else {
//                    Button("Download Image") {
//                        downloadManager.downloadImage()
//                    }
//                }
//            }
//        }
//        .padding()
//    }

