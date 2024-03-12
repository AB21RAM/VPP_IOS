//
//  FacultyMenuView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 07/03/24.
//

import SwiftUI

struct FacultyMenuView: View {
    @State var isNavigateApplyLeave = false
    @State var isNavigateAlternate = false
    var body: some View {
        NavigationStack{
            
            Text("Menu")
            VStack{
                Button {
                    isNavigateApplyLeave.toggle()
                } label: {
                    VStack{
                        Text("Apply Leave")
                            .modifier(CardModifier(paddingValue: 10, backgroundColor: .blue, cornerRadius: 10, foregroundColor: Color("toolbar"), font: .title2))
                    }
                }
                
                Button {
                    isNavigateAlternate.toggle()
                } label: {
                    VStack{
                        Text("Take Charge")
                            .modifier(CardModifier(paddingValue: 10, backgroundColor: .blue, cornerRadius: 10, foregroundColor: Color("toolbar"), font: .title2))
                    }
                }
                
                
                
            }
            .navigationDestination(isPresented: $isNavigateAlternate) {
                FacultyTakeChargeView()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .navigationDestination(isPresented: $isNavigateApplyLeave) {
                FacultyLeaveAppView()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(UIColor(hex:0xEEEAF4, alpha: 1.0)))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
    
}
#Preview {
    FacultyMenuView()
}
