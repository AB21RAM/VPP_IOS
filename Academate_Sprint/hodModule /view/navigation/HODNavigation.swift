//
//  HODNavigation.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 14/03/24.
//

import SwiftUI

struct HODNavigation: View {
    var body: some View {
        NavigationView(content: {
            List{
                NavigationLink {
                    HODMainScreen()
                } label: {
                    Label("Profile",systemImage: "person.crop.circle")
                }
                NavigationLink {
                    HODApprovedLeaveView()
                } label: {
                        Label("Approved Leaves",systemImage: "calendar.badge.checkmark")
                }
                NavigationLink {
                    HODVisitorView()
                } label: {
                        Label("My Visitors",systemImage: "shared.with.you")
                }
                NavigationLink {
                    HODNoDuesMainScreen()
                } label: {
                        Label("No Dues",systemImage: "nosign.app.fill")
                }
                
                .navigationTitle("HOD")
                
                
            }
            
        })
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
        .background(Color("background"))
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HODNavigation()
}
