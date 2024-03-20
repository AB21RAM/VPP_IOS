//
//  facultyNavigation.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 15/03/24.
//

import SwiftUI

struct facultyNavigation: View {
    var body: some View {
        NavigationView(content: {
            List{
                NavigationLink {
                    FacultyMainScreen()
                } label: {
                    Label("Profile",systemImage: "person.crop.circle")
                }
                NavigationLink {
                    FacultyLeaveAppView()
                } label: {
                        Label("Apply Leave",systemImage: "calendar.badge.checkmark")
                }
                NavigationLink {
                    FacultyTakeChargeView()
                } label: {
                        Label("Take Charge",systemImage: "shared.with.you")
                }
                /*
                NavigationLink {
                    HODNoDuesMainScreen()
                } label: {
                        Label("No Dues",systemImage: "nosign.app.fill")
                }
                 */
                
                .navigationTitle("Faculty")
                
                
            }
            
        })
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
        .background(Color("background"))
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    facultyNavigation()
}
