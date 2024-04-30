//
//  BasicDetailsView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 29/04/24.
//

import SwiftUI

struct BasicDetailsView: View {
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
                                
                                Text("Basic Details")
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
                        VStack{
                            PersonalDetailsView()
                            Divider()
                        }
                    }
                }
            }
            
        }.navigationBarBackButtonHidden(true)
    }
}

struct PersonalDetailsView : View {
    @State var firstName : String = ""
    @State var middleName : String = ""
    @State var lastName : String = ""
    @State var fullName : String = ""
    @State var religion : String = ""
    @State var caste : String = ""
    @State var subCaste : String = ""
    @State var community : String = ""
    @State var minority : String = ""
    @State var nationality : String = ""
    @State var phonenumber : String = ""
    @State var childnumber : String = ""
    @State var aadharnumber : String = ""
    @State var lastcollege : String = ""
    @State var bankAccnumber : String = ""
    @State var bankname : String = ""
    @State var dob : Date =  Date.now
    @State var isAvailable : Bool = false
    @State var isExpanded : Bool = true
    private func formattedDOB() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: dob)
    }
    @State private var gender = ""
    let genders = ["Male" , "Female"]
    @State private var maritialStatus = ""
    let status = ["Single" , "Married"]
    var body: some View {
        ScrollView(showsIndicators : false){
            VStack{
                HStack{
                    Text("Perosonal Details")
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .font(.title2)
                    
                    Button(action: {
                        withAnimation{
                            isExpanded.toggle()
                        }
                    }, label: {
                        if isExpanded{
                            Image(systemName: "arrow.down.forward.and.arrow.up.backward")
                                .foregroundStyle(Color.black)
                        }else{
                            Image(systemName: "arrow.up.backward.and.arrow.down.forward")
                                .foregroundStyle(Color.black)
                        }
                        
                    })
                    
                }
               
                
                /*
                 HStack{
                 Text("Name : ")
                 .bold()
                 .font(.title2)
                 .frame(width: .infinity , alignment: .leading)
                 if isAvailable{
                 Text("Name Value")
                 .padding(15)
                 .overlay(
                 RoundedRectangle(cornerRadius: 10)
                 .stroke(Color("toolbar"))
                 )
                 .frame(maxWidth: .infinity,alignment: .leading)
                 }else{
                 TextField("Name", text: $email)
                 .keyboardType(.emailAddress).autocapitalization(.none)
                 .padding(15)
                 .overlay(
                 RoundedRectangle(cornerRadius: 10)
                 .stroke(Color("toolbar"))
                 )
                 }
                 
                 }
                 .padding(.bottom,5)
                 */
                if isExpanded{
                    Divider()
                    HStack{
                        Text("Fisrt Name : ")
                            .bold()
                            .font(.title3)
                            .frame(width: .infinity , alignment: .leading)
                        TextField("First Name", text: $firstName)
                            .keyboardType(.alphabet).autocapitalization(.none)
                            .padding(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("toolbar"))
                            )
                        
                    }
                    .padding(.bottom,5)
                    HStack{
                        Text("Middle Name : ")
                            .bold()
                            .font(.title3)
                            .frame(width: .infinity , alignment: .leading)
                        TextField("Middle Name", text: $middleName)
                            .keyboardType(.alphabet).autocapitalization(.none)
                            .padding(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("toolbar"))
                            )
                        
                    }
                    .padding(.bottom,5)
                    HStack{
                        Text("Last Name : ")
                            .bold()
                            .font(.title3)
                            .frame(width: .infinity , alignment: .leading)
                        TextField("Last Name", text: $lastName)
                            .keyboardType(.alphabet).autocapitalization(.none)
                            .padding(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("toolbar"))
                            )
                        
                    }
                    .padding(.bottom,5)
                    if !firstName.isEmpty || !middleName.isEmpty || !lastName.isEmpty{
                        VStack{
                            Text("Full Name : ")
                                .bold()
                                .font(.title2)
                                .frame(maxWidth: .infinity , alignment: .leading)
                            Text("\(lastName.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()) \(firstName.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()) \(middleName.trimmingCharacters(in: .whitespacesAndNewlines).uppercased())")
                                .padding(10)
                                .frame(maxWidth: .infinity,alignment: .leading)
                        }.task {
                            fullName = "\(lastName.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()) \(firstName.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()) \(middleName.trimmingCharacters(in: .whitespacesAndNewlines).uppercased())"
                        }
                    }
                    Divider()
                    DatePicker( selection: $dob, in: ...Date.now, displayedComponents: .date){
                        Text("DOB :")
                            .bold()
                            .font(.title2)
                            .frame(maxWidth: .infinity,alignment: .leading)
                    }
                    Divider()
                    HStack{
                        Text("Gender :")
                            .bold()
                            .font(.title2)
                            .frame(maxWidth: .infinity,alignment: .leading)
                        Picker("Gender ", selection: $gender) {
                            ForEach(genders, id: \.self) {
                                Text($0)
                            }
                        }
                        .frame(maxWidth: .infinity,alignment: .trailing)
                    }
                    Divider()
                    HStack{
                        Text("*Religion : ")
                            .bold()
                            .font(.title3)
                            .frame(width: .infinity , alignment: .leading)
                        TextField("Religion", text: $religion)
                            .keyboardType(.alphabet).autocapitalization(.none)
                            .padding(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("toolbar"))
                            )
                        
                    }
                    .padding(.bottom,5)
                    HStack{
                        Text("*Caste : ")
                            .bold()
                            .font(.title3)
                            .frame(width: .infinity , alignment: .leading)
                        TextField("Caste", text: $caste)
                            .keyboardType(.alphabet).autocapitalization(.none)
                            .padding(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("toolbar"))
                            )
                        
                    }
                    .padding(.bottom,5)
                    HStack{
                        Text("*Sub-Caste : ")
                            .bold()
                            .font(.title3)
                            .frame(width: .infinity , alignment: .leading)
                        TextField("Sub-Caste", text: $subCaste)
                            .keyboardType(.alphabet).autocapitalization(.none)
                            .padding(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("toolbar"))
                            )
                        
                    }
                    .padding(.bottom,5)
                    HStack{
                        Text("*Community : ")
                            .bold()
                            .font(.title3)
                            .frame(width: .infinity , alignment: .leading)
                        TextField("Community", text: $community)
                            .keyboardType(.alphabet).autocapitalization(.none)
                            .padding(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("toolbar"))
                            )
                        
                    }
                    .padding(.bottom,5)
                    HStack{
                        Text("*Minority : ")
                            .bold()
                            .font(.title3)
                            .frame(width: .infinity , alignment: .leading)
                        TextField("Minority", text: $minority)
                            .keyboardType(.alphabet).autocapitalization(.none)
                            .padding(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("toolbar"))
                            )
                        
                    }
                    .padding(.bottom,5)
                    HStack{
                        Text("*Nationality : ")
                            .bold()
                            .font(.title3)
                            .frame(width: .infinity , alignment: .leading)
                        TextField("Nationality", text: $nationality)
                            .keyboardType(.alphabet).autocapitalization(.none)
                            .padding(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("toolbar"))
                            )
                        
                    }
                    .padding(.bottom,5)
                    HStack{
                        Text("*Phone No. : ")
                            .bold()
                            .font(.title3)
                            .frame(width: .infinity , alignment: .leading)
                        TextField("Phone No.", text: $phonenumber)
                            .keyboardType(.phonePad).autocapitalization(.none)
                            .padding(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("toolbar"))
                            )
                        
                    }
                    .padding(.bottom,5)
                    HStack{
                        Text("*Child Number : ")
                            .bold()
                            .font(.title3)
                            .frame(width: .infinity , alignment: .leading)
                        TextField("Child Number", text:$childnumber)
                            .keyboardType(.numberPad).autocapitalization(.none)
                            .padding(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("toolbar"))
                            )
                        
                    }
                    .padding(.bottom,5)
                    HStack{
                        Text("*Aadhar Card Number :")
                            .bold()
                            .font(.title3)
                            .frame(width: .infinity , alignment: .leading)
                        TextField("Child Number", text: $aadharnumber)
                            .keyboardType(.numberPad).autocapitalization(.none)
                            .padding(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("toolbar"))
                            )
                        
                    }
                    .padding(.bottom,5)
                    HStack{
                        Text("*Last College Attended :")
                            .bold()
                            .font(.title3)
                            .frame(width: .infinity , alignment: .leading)
                        TextField("Last College Attended", text: $lastcollege)
                            .keyboardType(.alphabet).autocapitalization(.none)
                            .padding(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("toolbar"))
                            )
                        
                    }
                    .padding(.bottom,5)
                    HStack{
                        Text("Bank Account Number :")
                            .bold()
                            .font(.title3)
                            .frame(width: .infinity , alignment: .leading)
                        TextField("Bank Account Number", text: $bankAccnumber)
                            .keyboardType(.default).autocapitalization(.none)
                            .padding(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("toolbar"))
                            )
                        
                    }
                    .padding(.bottom,5)
                    HStack{
                        Text("Bank Name :")
                            .bold()
                            .font(.title3)
                            .frame(width: .infinity , alignment: .leading)
                        TextField("Bank Name", text: $bankname)
                            .keyboardType(.alphabet).autocapitalization(.none)
                            .padding(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("toolbar"))
                            )
                        
                    }
                    .padding(.bottom,5)
                    HStack{
                        Text("Maritial Status :")
                            .bold()
                            .font(.title2)
                            .frame(maxWidth: .infinity,alignment: .leading)
                        Picker("Status ", selection: $maritialStatus) {
                            ForEach(status, id: \.self) {
                                Text($0)
                            }
                        }
                        .frame(maxWidth: .infinity,alignment: .trailing)
                    }
                    if fullName.isEmpty || religion.isEmpty || caste.isEmpty || subCaste.isEmpty || community.isEmpty || nationality.isEmpty || phonenumber.isEmpty || childnumber.isEmpty || aadharnumber.isEmpty || lastcollege.isEmpty{
                        Text("All fields are Required")
                            .bold()
                            .padding(5)
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(Color.white)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.yellow)
                            )
                            
                    }else{
                        Button(action: {
    //                        withAnimation{
                                isExpanded.toggle()
    //                        }
                        }, label: {
                            Text("Submit and Next")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .foregroundStyle(Color.white)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.indigo)
                                )
                                .padding()
                            
                        })
                    }
                    
                }
            }
        }
        .padding(10)
        .frame(maxHeight: .infinity, alignment: .topLeading)
        
    }
}
#Preview {
    BasicDetailsView()
//    PersonalDetailsView()
}
