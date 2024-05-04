//
//  AdmissionFormNavigation.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 29/04/24.
//

import SwiftUI

struct AdmissionFormNavigation: View {
    var body: some View {
        NavigationView(content: {
            List{
                NavigationLink {
                    DashboardView()
                } label: {
                    Label("Dashboard",systemImage: "house.fill")
                }
                NavigationLink {
                    BasicDetailsView()
                } label: {
                        Label("Basic Details",systemImage: "info.circle")
                }
                NavigationLink {
                    EducationDetailsView()
                } label: {
                        Label("Education Details",systemImage: "graduationcap")
                }
                NavigationLink {
                    UploadDocumentView()
                } label: {
                        Label("Upload Documents",systemImage: "doc.badge.arrow.up")
                }
                /*
                NavigationLink {
                    HODNoDuesMainScreen()
                } label: {
                        Label("No Dues",systemImage: "nosign.app.fill")
                }
                 */
                
                .navigationTitle("Admission Form")
                
                
            }
            
        })
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
        .background(Color("background"))
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    AdmissionFormNavigation()
}
