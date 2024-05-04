//
//  AdmissionFormRegisterView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 03/05/24.
//

import SwiftUI

struct AdmissionFormRegisterView: View {
    @State var email : String = ""
    @State private var SeatType = "CAP"
    let seatTypes = ["CAP" , "Institute Level", "Against CAP"]
    
    @State private var Program = "First Year (F.Y B.E)"
    let ProgramType = ["First Year (F.Y B.E)" ,"Direct Second Year (D.S.Y. B.E.)", "Second Year (S.Y. B.E.)", "Third Year (T.Y. B.E.)","Final Year (B.E. Final Year)"]
    
    @State private var branch = "Computer Engineering"
    let branchTypes = ["Computer Engineering" ,"Artificial Intelligence And Data Science", "Information technology"]
    
    
    let branchIDMap: [String: Int] = [
        "Computer Engineering": 1,
        "Artificial Intelligence And Data Science": 2,
        "Information technology": 3
    ]

    let programIDMap: [String: Int] = [
        "First Year (F.Y B.E)": 1,
        "Direct Second Year (D.S.Y. B.E.)": 2,
        "Second Year (S.Y. B.E.)": 3,
        "Third Year (T.Y. B.E.)": 4,
        "Final Year (B.E. Final Year)": 5
    ]

    let seatIDMap: [String: Int] = [
        "CAP": 1,
        "Institute Level": 2,
        "Against CAP": 3
    ]
    @State var CollegeID : String = ""
    @State var grNumber : String = ""
    @State var Password : String = ""
    @State var ConfirmPassword : String = ""
    @StateObject var viewmodel = AdmissionRegisterViewmodel()
//    @State private var focusedFieldIndex: Int = 0
    @FocusState var focus : Int?
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    HStack{
                        Text("Email : ")
                            .bold()
                            .font(.title3)
                            .frame(alignment: .leading)
                        TextField("Email", text: $viewmodel.datamodel.email)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
                            .padding(15)
                            .onSubmit {
                                focus = 1
                            }
                            .focused($focus, equals: 0)
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
                            .frame(alignment: .leading)
                        Picker("Seat Type  ", selection: $SeatType) {
                            ForEach(seatTypes, id: \.self) {
                                Text($0)
                            }
                        }
                        .onSubmit {
                            focus = 2
                        }
                        .focused($focus, equals: 1)
                        .frame(maxWidth: .infinity,alignment: .trailing)
                    }
                    Divider()
                    HStack{
                        Text("Selected Programme :")
                            .bold()
                            .font(.title2)
                            .frame(alignment: .leading)
                        Picker("Selected Programme  ", selection: $Program) {
                            ForEach(ProgramType, id: \.self) {
                                Text($0)
                            }
                        }
                        .onSubmit {
                            focus = 3
                            print("\(Program)")
                        }
                        .focused($focus, equals: 2)
                        .frame(maxWidth: .infinity,alignment: .trailing)
                    }
                    Divider()
                    HStack{
                        Text("Selected Branch :")
                            .bold()
                            .font(.title2)
                            .frame(alignment: .leading)
                        Picker("Selected Branch", selection: $branch) {
                            ForEach(branchTypes, id: \.self) {
                                Text($0)
                            }
                        }
                        .onSubmit {
                            focus = 4
                            print("\(branch)")
                        }
                        .focused($focus, equals: 3)
                        .frame(maxWidth: .infinity,alignment: .trailing)
                    }
                    Divider()
                    HStack{
                        Text("College ID : ")
                            .bold()
                            .font(.title3)
                            .frame(alignment: .leading)
                        TextField("College ID", text: $viewmodel.datamodel.clgId)
                            .keyboardType(.alphabet).autocapitalization(.none)
                            .padding(15)
                            .onSubmit {
                                focus = 5
                            }
                            .focused($focus, equals: 4)
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
                            .frame(alignment: .leading)
                        TextField("Gr Number", text: $viewmodel.datamodel.grNumber)
                            .keyboardType(.numberPad).autocapitalization(.none)
                            .padding(15)
                            .onSubmit {
                                focus = 6
                            }
                            .focused($focus, equals: 5)
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
                            .frame(alignment: .leading)
                        SecureField("Password", text: $viewmodel.datamodel.password)
                            .keyboardType(.alphabet).autocapitalization(.none)
                            .padding(15)
                            .onSubmit {
                                focus = 7
                            }
                            .focused($focus, equals: 6)
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
                            .frame(alignment: .leading)
                        SecureField("Confirm Password", text: $viewmodel.datamodel.cnfpassword)
                            .keyboardType(.alphabet).autocapitalization(.none)
                            .padding(15)
//                            .onSubmit {
//                                focus = 1
//                            }
                            .focused($focus, equals: 7)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("toolbar"))
                            )
                        
                    }
                    .padding(.bottom,5)
                    Button(action: {
                        print(" Seat ID : \(seatIDMap[SeatType])")
                        viewmodel.datamodel.seatType = seatIDMap[SeatType] ?? 1
                        viewmodel.datamodel.selectedProgram = programIDMap[Program] ?? 1
                        viewmodel.datamodel.branch = branchIDMap[branch] ?? 1
                        viewmodel.signup()
                    }, label: {
                        Text("SignUp")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(Color.white)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.indigo)
                            )
                           
                        
                    })
                    
                    if viewmodel.datamodel.error{
                        Text("Your application is not allowed or alloted to this college!, \nPlease recheck the application number. ")
                        .bold()
                        .padding()
                            .foregroundStyle(Color.white)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.red)
                            )
                    }
                    if viewmodel.datamodel.nonMatchingPassword{
                        Text("Password and confirm Password should be same")
                        .bold()
                        .padding()
                            .foregroundStyle(Color.white)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.yellow)
                            )
                    }
                }.padding()
                
            }
            .navigationDestination(isPresented: $viewmodel.datamodel.navigateToLogin, destination: {
                AdmissionFormLoginView()
            })
        }
        
        .navigationTitle(
            Text("Signup")
        )
    
    }
}

#Preview {
    AdmissionFormRegisterView()
}
