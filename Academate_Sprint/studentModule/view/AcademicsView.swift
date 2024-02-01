//
//  AcademicsView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 27/01/24.
//

import SwiftUI
import MobileCoreServices
import PDFKit
struct AcademicsView: View {
    @ObservedObject var downloadManager = DownloadManager()
    @ObservedObject var academicsViewModel = StudentAcademicsViewModel()
    @State private var isShareSheetPresented = false
    @State private var isNavigate = false
    @State private var selectedItem: DocumentItem?
    @State private var isFavorite = true
    let dataList = [DocumentItem(name: "Aadhar Card", url: "https://ik.imagekit.io/getflytechnologies/leave_proof_n5xbl4dPU.jpg",type: "JPEG"), DocumentItem(name: "CAP Allotment Letter", url: "https://ik.imagekit.io/getflytechnologies/leave_proof_wqZNjMAEZ.jpg",type: "JPEG")]
    var body: some View {
        VStack{
            Text("Documents:")
                .bold()
                .underline()
                .font(.title2)
                .frame(maxWidth: .infinity,alignment: .leading)
                .foregroundStyle(Color("toolbar"))
            ScrollView(.vertical) {
                LazyVStack(alignment: .leading, spacing: 10) {
                    // MARK : This is where List need to insert
                    //                        ForEach(academicsViewModel.academicsDataModel.documentList, id: \.id) { item in
                    ForEach(academicsViewModel.academicsDataModel.documentList, id: \.id) { item in
                        Button(action: {
                            isNavigate.toggle()
                            selectedItem = item
                        }, label: {
                            VStack{
                                HStack{
                                    Text("\(item.name)")
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                    Image(systemName: "doc.richtext")
                                }
                                Divider()
                            }
                            .modifier(CardModifier(paddingValue: 10, backgroundColor: .white, cornerRadius: 15, foregroundColor: Color("toolbar"), font: .title2))
                            .navigationDestination(isPresented: $isNavigate) {
                                DocumentViewerView(item: $selectedItem)
                            }
                        })
                    }
                }
            }
        }
    }
}
#Preview {
    AcademicsView()
}
//extension Binding {
//     func toUnwrapped<T>(defaultValue: T) -> Binding<T> where Value == Optional<T>  {
//        Binding<T>(get: { self.wrappedValue ?? defaultValue }, set: { self.wrappedValue = $0 })
//    }
//}
/*
 VStack {
 Button("Download Image") {
 downloadManager.downloadFile(fileURL: "https://ik.imagekit.io/getflytechnologies/leave_proof_4KZn8R7ie.jpg", fileName: "MyPhoto.jpg")
 }
 
 Button("Download PDF") {
 downloadManager.downloadFile(fileURL: "https://www.vidyalankar.org/engineering/assets/docs/te/computer-engineering-syllabus-sem-vi-mumbai-university.pdf", fileName: "MyDocument.pdf")
 }
 
 Button("Delete File") {
 downloadManager.deleteFile(fileName: "MyPhoto.jpg")
 downloadManager.deleteFile(fileName: "MyDocument.pdf")
 }
 
 Button("Check Image Existence") {
 downloadManager.checkFileExists(fileName: "MyPhoto.jpg")
 }
 
 Button("Check PDF Existence") {
 downloadManager.checkFileExists(fileName: "MyDocument.pdf")
 }
 
 if let file = downloadManager.getFile(fileType: "image", fileName: "MyPhoto.jpg") as? UIImage {
 Image(uiImage: file)
 .resizable()
 .aspectRatio(contentMode: .fit)
 .frame(width: 200, height: 200)
 Button("Share Image") {
 isShareSheetPresented.toggle()
 }.actionSheet(isPresented: $isShareSheetPresented) {
 ActionSheet(title: Text("Share Image"), buttons: [
 .default(Text("Share")) {
 shareImage(file)
 },
 .cancel()
 ])
 }
 }
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
 }
 /*
  @State private var documentPickerPresented = false
  @State private var isShareSheetPresented = false
  //    @State private var image : UIImage
  var body: some View {
  VStack {
  Text("Image Download Example")
  .font(.title)
  
  if downloadManager.isDownloading {
  ProgressView("Downloading...")
  } else {
  if downloadManager.isDownloaded {
  if let image = downloadManager.getImage() {
  VStack{
  Image(uiImage: image)
  .resizable()
  .scaledToFit()
  .frame(width: 200, height: 200)
  Button("Share Image") {
  isShareSheetPresented.toggle()
  }.actionSheet(isPresented: $isShareSheetPresented) {
  ActionSheet(title: Text("Share Image"), buttons: [
  .default(Text("Share")) {
  shareImage(image)
  },
  .cancel()
  ])
  }
  }
  } else {
  Text("Error loading image")
  }
  } else {
  Button("Download Image") {
  downloadManager.downloadImage()
  }
  }
  }
  }
  .padding()
  }
  */
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
 */

/*
 func downloadImage() {
 let url = URL(string: "https://cdn.arstechnica.net/wp-content/uploads/2018/06/macOS-Mojave-Dynamic-Wallpaper-transition.jpg")!
 
 URLSession.shared.dataTask(with: url) { data, _, _ in
 if let data = data, let uiImage = UIImage(data: data) {
 let downloadedImage = Image(uiImage: uiImage)
 DispatchQueue.main.async {
 self.downloadedImage = downloadedImage
 }
 }
 }.resume()
 }
 func shareImage() {
 guard let uiImage = UIImage(named: "your_image_name_here"), let imageData = uiImage.pngData() else {
 return
 }
 let activityViewController = UIActivityViewController(activityItems: [imageData], applicationActivities: nil)
 UIApplication.shared.windows.first?.rootViewController?.present(activityViewController, animated: true, completion: nil)
 }
 */
