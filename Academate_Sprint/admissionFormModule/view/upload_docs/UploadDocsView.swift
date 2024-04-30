//
//  UploadDocsView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 29/04/24.
//

import SwiftUI

struct UploadDocsView: View {
    @State var isNavigateMenu  = false
    let userDefaultsManager = UserDefaultsManager.shared
    var body: some View {
        NavigationStack{
            GeometryReader { geometry in
                ZStack{
                    VStack(spacing: 0){
                        VStack{
                            //                            Image(systemName: "text.justifyright")
                            HStack{
                                Button {
                                    isNavigateMenu.toggle()
                                } label: {
                                    Image(systemName: "text.justifyright")
                                        .padding(.leading,5)
                                }
                                .navigationDestination(isPresented: $isNavigateMenu) {
                                    AdmissionFormNavigation()
                                }
                                
                                Text("Upload Docs")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.largeTitle)
                            }
                            
                        }
                        .foregroundStyle(Color.white)
                        .padding(.bottom,10)
                        .padding(.leading,5)
                        .padding(.trailing,5)
                        .background(Color("toolbar"))
                        // main Content here
                        
                    }
                }
            }
            
        }.navigationBarBackButtonHidden(true)
    }
}

#Preview {
    UploadDocsView()
}
