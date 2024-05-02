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
                            ScrollView{
                                PersonalDetailsView()
                                Divider()
                                ParentDetailsView()
                                Divider()
                                AddressDetailsView()
                                Divider()
                                NavigationLink {
                                    EducationDetailsView()
                                } label: {
                                        Label("Education Details",systemImage: "graduationcap")
                                }
                            }
                        }
                        .frame(maxWidth: .infinity)
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
    @State var isExpanded : Bool = false
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
                    Text("Personal")
                        .bold()
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .font(.title)
                    
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
        .frame(alignment: .topLeading)
        
    }
}
struct ParentDetailsView : View {
    @State var firstNameFather : String = ""
    @State var middleNameFather : String = ""
    @State var lastNameFather : String = ""
    @State var fullNameFather : String = ""
    @State var emailFather : String = ""
    @State var occupationFather : String = ""
    @State var designationFather : String = ""
    @State var AnnualIncomeFather : String = ""
    @State var phonenumberFather : String = ""
    
    @State var firstNameMother : String = ""
    @State var middleNameMother : String = ""
    @State var lastNameMother : String = ""
    @State var fullNameMother : String = ""
    @State var emailMother : String = ""
    @State var occupationMother : String = ""
    @State var designationMother : String = ""
    @State var AnnualIncomeMother : String = ""
    @State var phonenumberMother : String = ""
    
    @State var firstNameGuardian : String = ""
    @State var middleNameGuardian : String = ""
    @State var lastNameGuardian : String = ""
    @State var fullNameGuardian : String = ""
    @State var emailGuardian : String = ""
    @State var occupationGuardian : String = ""
    @State var designationGuardian : String = ""
    @State var AnnualIncomeGuardian : String = ""
    @State var phonenumberGuardian : String = ""
    
    @State var otpFather : String = ""
    @State var otpMother : String = ""
    @State var otpGuardian : String = ""
    
    @State var isAvailable : Bool = false
    @State var isExpanded : Bool = false
    @State var isExpandedFater : Bool = false
    @State var isExpandedMother : Bool = false
    @State var isExpandedGuardian : Bool = false
    
    @State var isOTPSentFather : Bool = false
    @State var isOTPSentMother : Bool = false
    @State var isOTPSentGuardian : Bool = false
    
    @State var isOTPVerifyFather : Bool = false
    @State var isOTPVerifyMother : Bool = false
    @State var isOTPVerifyGuardian : Bool = false
    var body: some View {
        ScrollView(showsIndicators : false){
            VStack{
                HStack{
                    Text("Parent")
                        .bold()
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .font(.title)
                    
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
                    VStack{
                        ScrollView{
                            HStack{
                                Text("Father Details ")
                                    .bold()
                                    .frame(maxWidth: .infinity,alignment: .center)
                                    .font(.title2)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color("background"))
                                    )
                                
                                Button(action: {
                                    withAnimation{
                                        isExpandedFater.toggle()
                                    }
                                }, label: {
                                    if isExpandedFater{
                                        Image(systemName: "arrow.down.forward.and.arrow.up.backward")
                                            .foregroundStyle(Color.black)
                                    }else{
                                        Image(systemName: "arrow.up.backward.and.arrow.down.forward")
                                            .foregroundStyle(Color.black)
                                    }
                                    
                                })
                                
                            }
                            if isExpandedFater{
                                VStack{
                                    HStack{
                                        Text("Fisrt Name : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("First Name", text: $firstNameFather)
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
                                        TextField("Middle Name", text: $middleNameFather)
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
                                        TextField("Last Name", text: $lastNameFather)
                                            .keyboardType(.alphabet).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
                                    if !firstNameFather.isEmpty || !middleNameFather.isEmpty || !lastNameFather.isEmpty{
                                        VStack{
                                            Text("Full Name : ")
                                                .bold()
                                                .font(.title2)
                                                .frame(maxWidth: .infinity , alignment: .leading)
                                            Text("\(lastNameFather.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()) \(firstNameFather.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()) \(middleNameFather.trimmingCharacters(in: .whitespacesAndNewlines).uppercased())")
                                                .padding(10)
                                                .frame(maxWidth: .infinity,alignment: .leading)
                                        }.task {
                                            fullNameFather = "\(lastNameFather.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()) \(firstNameFather.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()) \(middleNameFather.trimmingCharacters(in: .whitespacesAndNewlines).uppercased())"
                                        }
                                    }
                                    Divider()
                                    HStack{
                                        Text("*Email : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("Email", text: $emailFather)
                                            .keyboardType(.alphabet).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
                                    HStack{
                                        Text("*Occupation : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("Occupation", text: $occupationFather)
                                            .keyboardType(.alphabet).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
                                    HStack{
                                        Text("*Designation : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("Designation", text: $designationFather)
                                            .keyboardType(.alphabet).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
                                    HStack{
                                        Text("*Annual Income : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("Annual Income", text: $AnnualIncomeFather)
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
                                        TextField("Phone No.", text: $phonenumberFather)
                                            .keyboardType(.phonePad).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
                                    
                                    if fullNameFather.isEmpty || emailFather.isEmpty || occupationFather.isEmpty || designationFather.isEmpty || AnnualIncomeFather.isEmpty || phonenumberFather.isEmpty{
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
                                           // otp sent logic
                                            isOTPSentFather.toggle()
                                        }, label: {
                                            Text("Send OTP")
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
                                    if isOTPSentFather && !isOTPVerifyFather{
                                        HStack{
                                            Text("*OTP. : ")
                                                .bold()
                                                .font(.title3)
                                                .frame(width: .infinity , alignment: .leading)
                                            TextField("OTP.", text: $otpFather)
                                                .keyboardType(.phonePad).autocapitalization(.none)
                                                .padding(15)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .stroke(Color("toolbar"))
                                                )
                                            Button(action: {
                                                // Otp Verifiaction Logic
                                                isOTPVerifyFather.toggle()
                                                // is verified then hide the sent opt button and otp section
                                            }, label: {
                                                Text("Verify OTP")
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
                                        .padding(.bottom,5)
                                    }
                                    
                                }
                            }
                            HStack{
                                Text("Mother Details ")
                                    .bold()
                                    .frame(maxWidth: .infinity,alignment: .center)
                                    .font(.title2)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color("background"))
                                    )
                                
                                Button(action: {
                                    withAnimation{
                                        isExpandedMother.toggle()
                                    }
                                }, label: {
                                    if isExpandedMother{
                                        Image(systemName: "arrow.down.forward.and.arrow.up.backward")
                                            .foregroundStyle(Color.black)
                                    }else{
                                        Image(systemName: "arrow.up.backward.and.arrow.down.forward")
                                            .foregroundStyle(Color.black)
                                    }
                                    
                                })
                                
                            }
                            if isExpandedMother{
                                VStack{
                                    HStack{
                                        Text("Fisrt Name : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("First Name", text: $firstNameMother)
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
                                        TextField("Middle Name", text: $middleNameMother)
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
                                        TextField("Last Name", text: $lastNameMother)
                                            .keyboardType(.alphabet).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
                                    if !firstNameMother.isEmpty || !middleNameMother.isEmpty || !lastNameMother.isEmpty{
                                        VStack{
                                            Text("Full Name : ")
                                                .bold()
                                                .font(.title2)
                                                .frame(maxWidth: .infinity , alignment: .leading)
                                            Text("\(lastNameMother.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()) \(firstNameMother.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()) \(middleNameMother.trimmingCharacters(in: .whitespacesAndNewlines).uppercased())")
                                                .padding(10)
                                                .frame(maxWidth: .infinity,alignment: .leading)
                                        }.task {
                                            fullNameMother = "\(lastNameMother.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()) \(firstNameMother.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()) \(middleNameMother.trimmingCharacters(in: .whitespacesAndNewlines).uppercased())"
                                        }
                                    }
                                    Divider()
                                    HStack{
                                        Text("*Email : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("Email", text: $emailMother)
                                            .keyboardType(.alphabet).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
                                    HStack{
                                        Text("*Occupation : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("Occupation", text: $occupationMother)
                                            .keyboardType(.alphabet).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
                                    HStack{
                                        Text("*Designation : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("Designation", text: $designationMother)
                                            .keyboardType(.alphabet).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
                                    HStack{
                                        Text("*Annual Income : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("Annual Income", text: $AnnualIncomeMother)
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
                                        TextField("Phone No.", text: $phonenumberMother)
                                            .keyboardType(.phonePad).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
                                    
                                    if fullNameMother.isEmpty || emailMother.isEmpty || occupationMother.isEmpty || designationMother.isEmpty || AnnualIncomeMother.isEmpty || phonenumberMother.isEmpty{
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
                                           // otp sent logic
                                            isOTPSentMother.toggle()
                                        }, label: {
                                            Text("Send OTP")
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
                                    if isOTPSentMother && !isOTPVerifyMother{
                                        HStack{
                                            Text("*OTP. : ")
                                                .bold()
                                                .font(.title3)
                                                .frame(width: .infinity , alignment: .leading)
                                            TextField("OTP.", text: $otpMother)
                                                .keyboardType(.phonePad).autocapitalization(.none)
                                                .padding(15)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .stroke(Color("toolbar"))
                                                )
                                            Button(action: {
                                                // Otp Verifiaction Logic
                                                isOTPVerifyMother.toggle()
                                                // is verified then hide the sent opt button and otp section
                                            }, label: {
                                                Text("Verify OTP")
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
                                        .padding(.bottom,5)
                                    }
                                    
                                }
                            }
                            HStack{
                                Text("Is Guardian ?")
                                    .bold()
                                    .frame(maxWidth: .infinity,alignment: .center)
                                Button(action: {
                                    withAnimation{
                                        isExpandedGuardian.toggle()
                                    }
                                }, label: {
                                    Text("Yes")
                                        .padding()
                                        .bold()
//                                        .frame(maxWidth: .infinity,alignment: .center)
                                        .font(.title2)
                                        
                                    
                                })
                                Button(action: {
                                    withAnimation{
                                        isExpandedGuardian.toggle()
                                    }
                                }, label: {
                                    Text("No")
                                        .padding()
                                        .bold()
//                                        .frame(maxWidth: .infinity,alignment: .center)
                                        .font(.title2)
                                       
                                    
                                })
                                
                            }
                            .frame(maxWidth: .infinity,alignment: .center)
                            .font(.title2)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color("background"))
                            )
                            
                            if isExpandedGuardian{
                                VStack{
                                    HStack{
                                        Text("Guardian Details ")
                                            .bold()
                                            .frame(maxWidth: .infinity,alignment: .center)
                                            .font(.title2)
                                            .background(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .fill(Color("background"))
                                            )
                                        
                                        Button(action: {
                                            withAnimation{
                                                isExpandedGuardian.toggle()
                                            }
                                        }, label: {
                                            if isExpandedGuardian{
                                                Image(systemName: "arrow.down.forward.and.arrow.up.backward")
                                                    .foregroundStyle(Color.black)
                                            }else{
                                                Image(systemName: "arrow.up.backward.and.arrow.down.forward")
                                                    .foregroundStyle(Color.black)
                                            }
                                            
                                        })
                                        
                                    }
                                    HStack{
                                        Text("Fisrt Name : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("First Name", text: $firstNameGuardian)
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
                                        TextField("Middle Name", text: $middleNameGuardian)
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
                                        TextField("Last Name", text: $lastNameGuardian)
                                            .keyboardType(.alphabet).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
                                    if !firstNameGuardian.isEmpty || !middleNameGuardian.isEmpty || !lastNameGuardian.isEmpty{
                                        VStack{
                                            Text("Full Name : ")
                                                .bold()
                                                .font(.title2)
                                                .frame(maxWidth: .infinity , alignment: .leading)
                                            Text("\(lastNameGuardian.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()) \(firstNameGuardian.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()) \(middleNameGuardian.trimmingCharacters(in: .whitespacesAndNewlines).uppercased())")
                                                .padding(10)
                                                .frame(maxWidth: .infinity,alignment: .leading)
                                        }.task {
                                            fullNameGuardian = "\(lastNameGuardian.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()) \(firstNameGuardian.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()) \(middleNameGuardian.trimmingCharacters(in: .whitespacesAndNewlines).uppercased())"
                                        }
                                    }
                                    Divider()
                                    HStack{
                                        Text("*Email : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("Email", text: $emailGuardian)
                                            .keyboardType(.alphabet).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
                                    HStack{
                                        Text("*Occupation : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("Occupation", text: $occupationGuardian)
                                            .keyboardType(.alphabet).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
                                    HStack{
                                        Text("*Designation : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("Designation", text: $designationGuardian)
                                            .keyboardType(.alphabet).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
                                    HStack{
                                        Text("*Annual Income : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("Annual Income", text: $AnnualIncomeGuardian)
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
                                        TextField("Phone No.", text: $phonenumberGuardian)
                                            .keyboardType(.phonePad).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
                                    
                                    if fullNameGuardian.isEmpty || emailGuardian.isEmpty || occupationGuardian.isEmpty || designationGuardian.isEmpty || AnnualIncomeGuardian.isEmpty || phonenumberGuardian.isEmpty{
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
                                           // otp sent logic
                                            isOTPSentGuardian.toggle()
                                        }, label: {
                                            Text("Send OTP")
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
                                    if isOTPSentGuardian && !isOTPVerifyGuardian{
                                        HStack{
                                            Text("*OTP. : ")
                                                .bold()
                                                .font(.title3)
                                                .frame(width: .infinity , alignment: .leading)
                                            TextField("OTP.", text: $otpGuardian)
                                                .keyboardType(.phonePad).autocapitalization(.none)
                                                .padding(15)
                                                .overlay(
                                                    RoundedRectangle(cornerRadius: 10)
                                                        .stroke(Color("toolbar"))
                                                )
                                            Button(action: {
                                                // Otp Verifiaction Logic
                                                isOTPVerifyGuardian.toggle()
                                                // is verified then hide the sent opt button and otp section
                                            }, label: {
                                                Text("Verify OTP")
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
                                        .padding(.bottom,5)
                                    }
                                    
                                }
                            }
                        }
                    }
                }
            }
        }
        .padding(10)
        .frame(maxHeight: .infinity, alignment: .topLeading)
        
    }
}
struct AddressDetailsView : View {
    @State var residentialAddress : String = ""
    @State var permanentAddress : String = ""
    @State var isAvailable : Bool = false
    @State var isExpanded : Bool = false
    
    var body: some View {
        ScrollView(showsIndicators : false){
            VStack{
                HStack{
                    Text("Address")
                        .bold()
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .font(.title)
                    
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
                if isExpanded{
                    
                    HStack{
                        Text("Residential Address : ")
                            .bold()
                            .font(.title3)
                            .frame(width: .infinity , alignment: .leading)
                        TextEditor(text: $residentialAddress)
                                .keyboardType(.alphabet)
                                .autocapitalization(.none)
                                .padding(15)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color("toolbar"))
                                )
                                .frame(height: 150) // Adjust height as needed
                        
                    }
                    .padding(.bottom,5)
                    Divider()
                    HStack{
                        Text("Permanent Address Info")
                            .bold()
                            .frame(maxWidth: .infinity,alignment: .center)
                        Button(action: {
                            withAnimation{
//                                isExpandedGuardian.toggle()
                            }
                        }, label: {
                            Text("Same as Residential Address")
                                .padding()
                                .bold()
                        })
                        Button(action: {
                            withAnimation{
//                                isExpandedGuardian.toggle()
                            }
                        }, label: {
                            Text("Different Address")
                                .padding()
                                .bold()
                        })
                        
                    }
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color("background"))
                    )
                    
                    // MARK : based on the above selection need to decide whether to display or not
                    HStack{
                        Text("Permanent Address : ")
                            .bold()
                            .font(.title3)
                            .frame(width: .infinity , alignment: .leading)
                        TextEditor(text: $permanentAddress)
                                .keyboardType(.alphabet)
                                .autocapitalization(.none)
                                .padding(15)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color("toolbar"))
                                )
                                .frame(height: 150) // Adjust height as needed
                        
                    }
                    .padding(.bottom,5)
                    
                    Divider()
                    
                    if permanentAddress.isEmpty || residentialAddress.isEmpty{
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
#Preview{
    PersonalDetailsView()
}
