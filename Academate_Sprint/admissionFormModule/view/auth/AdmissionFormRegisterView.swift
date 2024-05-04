//
//  AdmissionFormRegisterView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 03/05/24.
//

import SwiftUI

struct AdmissionFormRegisterView: View {
    @State var email : String = ""
    @State private var SeatType = ""
    let seatTypes = ["CAP" , "Institute Level", "Against CAP"]
    
    @State private var Program = ""
    let ProgramType = ["First Year (F.Y B.E)" ,"Direct Second Year (D.S.Y. B.E.)", "Second Year (S.Y. B.E.)", "Third Year (T.Y. B.E.)","Final Year (B.E. Final Year)"]
    
    @State private var branch = ""
    let branchTypes = ["Computer Engineering" ,"Artificial Intelligence And Data Science", "Information technology"]
    
    @State var CollegeID : String = ""
    @State var grNumber : String = ""
    @State var Password : String = ""
    @State var ConfirmPassword : String = ""
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    HStack{
                        Text("Email : ")
                            .bold()
                            .font(.title3)
                            .frame(width: .infinity , alignment: .leading)
                        TextField("Email", text: $email)
                            .keyboardType(.alphabet).autocapitalization(.none)
                            .padding(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("toolbar"))
                            )
                        
                    }
                    .padding(.bottom,5)
                    
                    
                    HStack{
                        Text("Seat Type :")
                            .bold()
                            .font(.title2)
                            .frame(maxWidth: .infinity,alignment: .leading)
                        Picker("Seat Type  ", selection: $SeatType) {
                            ForEach(seatTypes, id: \.self) {
                                Text($0)
                            }
                        }
                        .frame(maxWidth: .infinity,alignment: .trailing)
                    }
                    Divider()
                    HStack{
                        Text("Selected Programme :")
                            .bold()
                            .font(.title2)
                            .frame(maxWidth: .infinity,alignment: .leading)
                        Picker("Selected Programme  ", selection: $Program) {
                            ForEach(ProgramType, id: \.self) {
                                Text($0)
                            }
                        }
                        .frame(maxWidth: .infinity,alignment: .trailing)
                    }
                    Divider()
                    HStack{
                        Text("Selected Branch :")
                            .bold()
                            .font(.title2)
                            .frame(maxWidth: .infinity,alignment: .leading)
                        Picker("Selected Branch", selection: $branch) {
                            ForEach(branchTypes, id: \.self) {
                                Text($0)
                            }
                        }
                        .frame(maxWidth: .infinity,alignment: .trailing)
                    }
                    Divider()
                    HStack{
                        Text("College ID : ")
                            .bold()
                            .font(.title3)
                            .frame(width: .infinity , alignment: .leading)
                        TextField("College ID", text: $CollegeID)
                            .keyboardType(.alphabet).autocapitalization(.none)
                            .padding(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("toolbar"))
                            )
                        
                    }
                    .padding(.bottom,5)
                    HStack{
                        Text("Gr Number : ")
                            .bold()
                            .font(.title3)
                            .frame(width: .infinity , alignment: .leading)
                        TextField("Gr Number", text: $grNumber)
                            .keyboardType(.alphabet).autocapitalization(.none)
                            .padding(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("toolbar"))
                            )
                        
                    }
                    .padding(.bottom,5)
                    HStack{
                        Text("Password : ")
                            .bold()
                            .font(.title3)
                            .frame(width: .infinity , alignment: .leading)
                        TextField("Password", text: $Password)
                            .keyboardType(.alphabet).autocapitalization(.none)
                            .padding(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("toolbar"))
                            )
                        
                    }
                    .padding(.bottom,5)
                    HStack{
                        Text("Confirm Password : ")
                            .bold()
                            .font(.title3)
                            .frame(width: .infinity , alignment: .leading)
                        TextField("Confirm Password", text: $ConfirmPassword)
                            .keyboardType(.alphabet).autocapitalization(.none)
                            .padding(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("toolbar"))
                            )
                        
                    }
                    .padding(.bottom,5)
                    Button(action: {
                        //                        withAnimation{
                        //                        isExpanded.toggle()
                        //                        }
                    }, label: {
                        Text("SignUp")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(Color.white)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.indigo)
                            )
                            .padding()
                        
                    })
                }.padding()
            }
        }.navigationTitle(
            Text("Signup")
                .font(.title)
                .bold()
        )
    }
}

#Preview {
    AdmissionFormRegisterView()
}
