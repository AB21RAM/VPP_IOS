//
//  DashboardView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 29/04/24.
//

import SwiftUI

struct DashboardView: View {
    @State var isPersonalCompleted = true
    @State var isParentCompleted = true    
    @State var isAddressCompleted = true
    @State var isPreviousCompleted = false
    @State var isEntranceCompleted = false
    @State var isDocumentCompleted = false
    @State var isNavigateMenu = false
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
                                
                                Text("Dashboard")
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.largeTitle)
                                Button(
                                    action: {
                                        // do something
                                        userDefaultsManager.setIsLoggedIn(false)
                                        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.collegeID)
                                    },
                                    label: {
                                        VStack{
                                            Image(systemName: "rectangle.portrait.and.arrow.right")
                                                .foregroundColor(.white)
                                            Text("Logout")
                                                .font(.caption)
                                        }
                                        
                                    }
                                )
                            }
                            
                        }
                        .foregroundStyle(Color.white)
                        .padding(.bottom,10)
                        .padding(.leading,5)
                        .padding(.trailing,5)
                        .background(Color("toolbar"))
                        VStack(){
                            Text("Basic Details:")
                                .font(.title)
                                .frame(maxWidth: .infinity,alignment : .leading)
                                .padding(.leading,15)
                                .padding(.top,15)
                                .padding(.trailing,15)
                            
                            
                            VStack{
                                HStack{
                                    if isPersonalCompleted {
                                        Text("Personal Completed")
                                        Spacer()
                                        Image(systemName: "checkmark.seal")
                                            .foregroundStyle(Color.green)
                                    }else{
                                        Text("Personal Pending")
                                        Spacer()
                                        Image(systemName: "xmark.seal")
                                            .foregroundStyle(Color.red)
                                    }
                                }
                                .padding(15)
                                HStack{
                                    if isParentCompleted {
                                        Text("Parent Completed")
                                        Spacer()
                                        Image(systemName: "checkmark.seal")
                                            .foregroundStyle(Color.green)
                                    }else{
                                        Text("Parent Pending")
                                        Spacer()
                                        Image(systemName: "xmark.seal")
                                            .foregroundStyle(Color.red)
                                    }
                                }
                                .padding(.leading,15)
                                .padding(.trailing,15)
                                .padding(.bottom,15)
                                HStack{
                                    if isAddressCompleted {
                                        Text("Address Completed")
                                        Spacer()
                                        Image(systemName: "checkmark.seal")
                                            .foregroundStyle(Color.green)
                                    }else{
                                        Text("Address Pending")
                                        Spacer()
                                        Image(systemName: "xmark.seal")
                                            .foregroundStyle(Color.red)
                                    }
                                }
                                .padding(.leading,15)
                                .padding(.bottom,15)
                                .padding(.trailing,15)
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 10.0)
                                    .fill(.white)
                                    .shadow(radius: 10)
                                
                            )
                            .padding(.leading,15)
                            .padding(.trailing,15)
                            
                            
                            Text("Education Details:")
                                .font(.title)
                                .frame(maxWidth: .infinity,alignment : .leading)
                                .padding(.leading,15)
                                .padding(.trailing,15)
                            
                            VStack{
                                HStack{
                                    if isPreviousCompleted {
                                        Text("Previous Completed")
                                        Spacer()
                                        Image(systemName: "checkmark.seal")
                                            .foregroundStyle(Color.green)
                                    }else{
                                        Text("Previous Pending")
                                        Spacer()
                                        Image(systemName: "xmark.seal")
                                            .foregroundStyle(Color.red)
                                    }
                                }
                                .padding(15)
                                HStack{
                                    if isEntranceCompleted {
                                        Text("Entrance Completed")
                                        Spacer()
                                        Image(systemName: "checkmark.seal")
                                            .foregroundStyle(Color.green)
                                    }else{
                                        Text("Entrance Pending")
                                        Spacer()
                                        Image(systemName: "xmark.seal")
                                            .foregroundStyle(Color.red)
                                    }
                                }
                                .padding(.leading,15)
                                .padding(.trailing,15)
                                .padding(.bottom,15)
                            }
                            
                            .background(
                                RoundedRectangle(cornerRadius: 10.0)
                                    .fill(.white)
                                    .shadow(radius: 10)
                                
                            )
                            .padding(.leading,15)
                            .padding(.trailing,15)
                            
                            Text("Documensts Upload:")
                                .font(.title)
                                .frame(maxWidth: .infinity,alignment : .leading)
                                .padding(.leading,15)
                                .padding(.trailing,15)
                            
                            VStack{
                                HStack{
                                    if isDocumentCompleted {
                                        Text("Completed")
                                        Spacer()
                                        Image(systemName: "checkmark.seal")
                                            .foregroundStyle(Color.green)
                                    }else{
                                        Text("Pending")
                                        Spacer()
                                        Image(systemName: "xmark.seal")
                                            .foregroundStyle(Color.red)
                                    }
                                }
                                .padding(15)
                            }
                            
                            .background(
                                RoundedRectangle(cornerRadius: 10.0)
                                    .fill(.white)
                                    .shadow(radius: 10)
                                
                            )
                            .padding(.leading,15)
                            .padding(.trailing,15)
                            
                        }
                        .frame(maxWidth:  .infinity, maxHeight: .infinity,alignment: .topLeading)
                    }
                }
            }
            
        }.navigationBarBackButtonHidden(true)
    }
    
}

#Preview {
    DashboardView()
}
