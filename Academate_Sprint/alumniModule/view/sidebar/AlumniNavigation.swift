//
//  AlumniNavigation.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 13/03/24.
//

import SwiftUI

struct AlumniNavigation: View {
    var body: some View {
        NavigationView(content: {
            List{
                NavigationLink {
                    AlumniLeavingCertFormView()
                } label: {
                        Label("Apply For LC",systemImage: "book")
                }
                NavigationLink {
                    AlumniMainScreen()
                } label: {
                        Text("Main Screen")
                }
                .navigationTitle("Alumni")
                
                
            }
            
        })
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
        .background(Color("background"))
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    AlumniNavigation()
}
