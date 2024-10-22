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
    @State var pob : String = ""
    @State var dob : Date =  Date.now
    @State var isAvailable : Bool = false
    @State var isExpanded : Bool = false
    private func formattedDOB() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: dob)
    }
    private func dateFromISOString(isoString: String) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        return dateFormatter.date(from: isoString)
    }
    @State private var gender = ""
    let genders = ["Male" , "Female"]
    @State private var maritialStatus = ""
    let status = ["Single" , "Married"]
    let userDefaultsManager = UserDefaultsManager.shared
    var uid: Int {
        print(userDefaultsManager.getUid() ?? "no uid found")
        return userDefaultsManager.getUid() ?? 0
    }
    @StateObject var viewmodel = AdmissionFormMainViewModel()
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
                    if viewmodel.personalDataModel.isDataAvailable{
                        HStack{
                            Text("Full Name : ")
                                .bold()
                                .font(.title3)
                                .frame(width: .infinity , alignment: .leading)
                            TextField("Full Name", text: $fullName)
                                .keyboardType(.alphabet).autocapitalization(.none)
                                .padding(15)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color("toolbar"))
                                )
                            
                        }
                    }else{
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
                            }
                            .task {
                                fullName = "\(lastName.uppercased()) \(firstName.uppercased()) \(middleName.uppercased())"
                            }
                        }
                        Divider()
                    }
                    
                    DatePicker( selection: $dob, in: ...Date.now, displayedComponents: .date){
                        Text("DOB :")
                            .bold()
                            .font(.title2)
                            .frame(maxWidth: .infinity,alignment: .leading)
                    }
                    Divider()
                    HStack{
                        Text("*Place Of Birth : ")
                            .bold()
                            .font(.title3)
                            .frame(width: .infinity , alignment: .leading)
                        TextField("Place Of Birth", text: $pob)
                            .keyboardType(.alphabet).autocapitalization(.none)
                            .padding(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("toolbar"))
                            )
                        
                    }
                    .padding(.bottom,5)
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
//    //                        withAnimation{
//                                isExpanded.toggle()
//    //                        }
                            if !viewmodel.personalDataModel.isDataAvailable{
                                fullName = "\(lastName.uppercased()) \(firstName.uppercased()) \(middleName.uppercased())"
                            }
                            viewmodel.personalDataModel.fullName = fullName
//                            @State var religion : String = ""
                            viewmodel.personalDataModel.religion = religion
//                            @State var caste : String = ""
                            viewmodel.personalDataModel.caste = caste
//                            @State var subCaste : String = ""
                            viewmodel.personalDataModel.subCaste = subCaste
//                            @State var community : String = ""
                            viewmodel.personalDataModel.community = community
//                            @State var minority : String = ""
                            viewmodel.personalDataModel.minority = minority
//                            @State var nationality : String = ""
                            viewmodel.personalDataModel.nationality = nationality
//                            @State var phonenumber : String = ""
                            viewmodel.personalDataModel.contact = phonenumber
//                            @State var childnumber : String = ""
                            viewmodel.personalDataModel.childNumber = Int(childnumber) ?? 0
//                            @State var aadharnumber : String = ""
                            viewmodel.personalDataModel.aadharNumber = aadharnumber
//                            @State var lastcollege : String = ""
                            viewmodel.personalDataModel.lastCollege = lastcollege
//                            @State var bankAccnumber : String = ""
                            viewmodel.personalDataModel.bankAccountNumber = bankAccnumber
//                            @State var bankname : String = ""
                            viewmodel.personalDataModel.bankName = bankname
//                            @State var dob : Date =  Date.now
                            viewmodel.personalDataModel.dob = formattedDOB()
                            viewmodel.personalDataModel.pob = pob
                            viewmodel.personalDataModel.status = maritialStatus == "Single" ? 0 : 1
                            viewmodel.personalDataModel.gender = gender == "Male" ? 0 : 1
                            viewmodel.personalDataModel.uid = uid
                            viewmodel.postPersonalDetails()
                            if viewmodel.personalDataModel.NavigateParentDetails{
                                withAnimation{
                                    isExpanded.toggle()
                                }
                            }

                        }, label: {
                            Text("Submit and Next")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .foregroundStyle(Color.white)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.indigo)
                                )
//                                .padding()
                            
                        })
                    }
                        
                    
                }
            }
        }
        .padding(10)
        .frame(alignment: .topLeading)
        .task {
            viewmodel.getPersonalDetails { data in
                if let data = data {
                    // Handle the case where data is available
                    print("Retrieved RaddNew object: \(data)")
                    // Assuming you want to do something with the retrieved data
                    // Here you can update your UI or perform other operations
//                    let name = data.name.components(separatedBy: " ")
//                    firstName = name[1]
//                    middleName = name[2]
//                    lastName = name[0]
                    fullName = data.name // inputString.split(separator: " ")
                    firstName = data.name
                    dob = dateFromISOString(isoString: data.dob) ?? Date.now
                    pob = data.placeOfBirth
                    gender = data.genderID == 0 ? "Male" : "Female"
                    religion = data.religion
                    caste = data.caste
                    subCaste = data.subCaste
                    community = data.communitee
                    minority = data.minority
                    nationality = data.nationality
                    phonenumber = data.contact
                    childnumber = String(data.childNumber)
                    aadharnumber = data.aadharNumber
                    lastcollege = data.lastCollegeAttended
                    bankAccnumber = data.bankAccountNumber ?? "NA"
                    bankname = data.bankName
                    maritialStatus = data.marriedStatus == "0" ? "Single" : "Married"
                } else {
                    // Handle the case where data retrieval failed
                    print("Failed to retrieve RaddNew object")
                    // You might want to display an error message or take other actions
                }
            }

        }
        
    }
}
struct ParentDetailsView : View {
//    @State var firstNameFather : String = ""
//    @State var middleNameFather : String = ""
//    @State var lastNameFather : String = ""
    @State var fullNameFather : String = ""
    @State var emailFather : String = ""
    @State var occupationFather : String = ""
    @State var designationFather : String = ""
    @State var AnnualIncomeFather : String = ""
    @State var phonenumberFather : String = ""
    
//    @State var firstNameMother : String = ""
//    @State var middleNameMother : String = ""
//    @State var lastNameMother : String = ""
    @State var fullNameMother : String = ""
    @State var emailMother : String = ""
    @State var occupationMother : String = ""
    @State var designationMother : String = ""
    @State var AnnualIncomeMother : String = ""
    @State var phonenumberMother : String = ""
    
//    @State var firstNameGuardian : String = ""
//    @State var middleNameGuardian : String = ""
//    @State var lastNameGuardian : String = ""
    @State var fullNameGuardian : String = "NA"
    @State var emailGuardian : String = "NA"
    @State var occupationGuardian : String = "NA"
    @State var designationGuardian : String = "NA"
    @State var AnnualIncomeGuardian : String = "NA"
    @State var phonenumberGuardian : String = "NA"
    
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
    let userDefaultsManager = UserDefaultsManager.shared
    var uid: Int {
        print(userDefaultsManager.getUid() ?? "no uid found")
        return userDefaultsManager.getUid() ?? 0
    }
    @StateObject var viewmodel = AdmissionFormMainViewModel()
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
                                        Text("Full Name : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("Full Name", text: $fullNameFather)
                                            .keyboardType(.alphabet).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
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
                                            .disabled(isOTPSentFather)
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
                                        
                                        if !isOTPSentFather{
                                            Button(action: {
                                                //                                            viewmodel.getOPTDetails(phone: phonenumberFather)
                                                // otp sent logic
                                                viewmodel.getOPTDetails(phone: phonenumberFather)
                                                isOTPSentFather = true
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
                                                        
                                                        if viewmodel.parentDataModel.OTP == otpFather{
                                                            isOTPVerifyFather = true
                                                        }
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
                                        Text("Full Name : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("Full Name", text: $fullNameMother)
                                            .keyboardType(.alphabet).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
                                    
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
                                            .disabled(isOTPSentMother)
                                            .background(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .fill(Color.yellow)
                                            )
                                        
                                    }else{
                                        if !isOTPSentMother{
                                            Button(action: {
                                                //                                            viewmodel.getOPTDetails(phone: phonenumberFather)
                                                // otp sent logic
                                                viewmodel.getOPTDetails(phone: phonenumberMother)
                                                isOTPSentMother = true
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
                                                        
                                                        if viewmodel.parentDataModel.OTP == otpMother{
                                                            isOTPVerifyMother = true
                                                        }
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
                            HStack{
                                Text("Is Guardian ?")
                                    .bold()
                                    .frame(maxWidth: .infinity,alignment: .center)
                                Button(action: {
                                    withAnimation{
                                        isExpandedGuardian = true
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
                                        isExpandedGuardian = false
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
                                        Text("Full Name : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("Full Name", text: $fullNameGuardian)
                                            .keyboardType(.alphabet).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
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
                                    
                                   
                                }
                            }
                            Button(action: {
//                                @State var fullNameFather : String = ""
                                viewmodel.parentDataModel.fatherFullName = fullNameFather
                                viewmodel.parentDataModel.motherFullName = fullNameMother
                                viewmodel.parentDataModel.guardianFullname = fullNameGuardian
//                                @State var emailFather : String = ""
                                viewmodel.parentDataModel.fatherEmail = emailFather
                                viewmodel.parentDataModel.motherEmail = emailMother
                                viewmodel.parentDataModel.guardianEmail = emailGuardian
//                                @State var occupationFather : String = ""
                                viewmodel.parentDataModel.fatherOccupation = occupationFather
                                viewmodel.parentDataModel.motherOccupation = occupationMother
                                viewmodel.parentDataModel.guardianOccupation = occupationGuardian
//                                @State var designationFather : String = ""
                                viewmodel.parentDataModel.fatherDesignation = designationFather
                                viewmodel.parentDataModel.motherDesignation = designationMother
                                viewmodel.parentDataModel.guardianDesignation = designationGuardian
//                                @State var AnnualIncomeFather : String = ""
                                viewmodel.parentDataModel.fatherIncome = AnnualIncomeFather
                                viewmodel.parentDataModel.motherIncome = AnnualIncomeMother
                                viewmodel.parentDataModel.guardianIncome = AnnualIncomeGuardian
//                                @State var phonenumberFather : String = ""
                                viewmodel.parentDataModel.fatherCont = phonenumberFather
                                viewmodel.parentDataModel.motherCont = phonenumberMother
                                viewmodel.parentDataModel.guardianCont = phonenumberGuardian
                                viewmodel.parentDataModel.uid = String(uid)
                                viewmodel.postParentDetails()
                                if viewmodel.parentDataModel.NavigateAddressDetails{
                                    withAnimation{
                                        isExpanded.toggle()
                                    }
                                }
                                
                            }, label: {
                                Text("Submit and Next")
                                    .padding()
                                    .frame(maxWidth: .infinity)
                                    .foregroundStyle(Color.white)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color.indigo)
                                    )
                            })
                        }
                    }
                }
            }
        }
        .padding(10)
        .frame(maxHeight: .infinity, alignment: .topLeading)
        .task {
            viewmodel.getIsFinalSubmit()
            if viewmodel.mainDataModel.isFinalSubmit{
                isOTPSentFather = true
                isOTPSentMother = true
                isOTPSentGuardian = true
            }
            viewmodel.getParentDetails { data in
                if let data = data {
                    // Handle the case where data is available
                    print("Retrieved RaddNew object: \(data)")
                   
                    fullNameFather = data[0].fullname ?? ""
                    emailFather = data[0].email ?? ""
                    occupationFather = data[0].occupation ?? ""
                    designationFather = data[0].designation ?? ""
                    AnnualIncomeFather = data[0].income ?? ""
                    phonenumberFather = data[0].contact ?? ""
                    if data[0].contact != nil && data[0].contact?.count == 10{
                        isOTPSentFather = true
                    }
                    fullNameMother = data[1].fullname ?? ""
                    emailMother = data[1].email ?? ""
                    occupationMother = data[1].occupation ?? ""
                    designationMother = data[1].designation ?? ""
                    AnnualIncomeMother = data[1].income ?? ""
                    phonenumberMother = data[1].contact ?? ""
                    if data[0].contact != nil && data[0].contact?.count == 10{
                        isOTPSentMother = true
                    }
                    fullNameGuardian = data[2].fullname ?? "NA"
                    emailGuardian = data[2].email ?? "NA"
                    occupationGuardian = data[2].occupation ?? "NA"
                    designationGuardian = data[2].designation ?? "NA"
                    AnnualIncomeGuardian = data[2].income ?? "NA"
                    phonenumberGuardian = data[2].contact ?? "NA"
                
                } else {
                    // Handle the case where data retrieval failed
                    print("Failed to retrieve RaddNew object")
                    // You might want to display an error message or take other actions
                }
            }

        }
    }
}
struct AddressDetailsView : View {
    @State var residentialAddress : String = ""
    @State var permanentAddress : String = ""
    @State var isAvailable : Bool = false
    @State var isExpanded : Bool = false
    @State var checked : Bool = false
    let userDefaultsManager = UserDefaultsManager.shared
    var uid: Int {
        print(userDefaultsManager.getUid() ?? "no uid found")
        return userDefaultsManager.getUid() ?? 0
    }
    @StateObject var viewmodel = AdmissionFormMainViewModel()
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
                            checked = true
                            permanentAddress = residentialAddress
                        }, label: {
                            Text("Same as Residential Address")
                                .padding()
                                .bold()
                        })
                        Button(action: {
                            checked = false
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
                    
                    // MARK: - based on the above selection need to decide whether to display or not
                    if !checked{
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
                    }
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
                            viewmodel.addressDataModel.address = residentialAddress
                            viewmodel.addressDataModel.pAddress = permanentAddress
                            viewmodel.addressDataModel.checked = String(checked)
                            viewmodel.addressDataModel.uid = String(uid)
                            viewmodel.postAddressDetails()
                            if viewmodel.addressDataModel.NavigateEduDetails{
                                withAnimation {
                                    isExpanded.toggle()
                                }
                            }
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
        .task {
            viewmodel.getAddressDetails { data in
                if let data = data {
                    // Handle the case where data is available
                    print("Retrieved address object: \(data)")
                    permanentAddress = data.padd.address
                    residentialAddress = data.radd.address
                    
                } else {
                    // Handle the case where data retrieval failed
                    print("Failed to retrieve RaddNew object")
                    // You might want to display an error message or take other actions
                }
            }
        }
    }
}
#Preview {
    BasicDetailsView()
//    PersonalDetailsView()
}

