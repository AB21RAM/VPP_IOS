//
//  EducationDetailsView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 29/04/24.
//

import SwiftUI

struct EducationDetailsView: View {
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
                                
                                Text("Education Details")
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
                                VStack{
                                    Text("Note")
                                        .bold()
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                    Text("1. The Diploma Feilds are only for those students who had done diploma. Those who had only done hsc can ignore diploma section.")
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                    Text("2. Do not mention NA in the KT fields if you don't have kt then enter 0 in the feild.")
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                }
                                
                                .foregroundStyle(Color.red)
                                .padding()
                                .frame(maxWidth: .infinity,alignment: .leading)
                                Divider()
                                PreviousCourseDetailsView()
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

struct PreviousCourseDetailsView : View {
    @State var SSCPassingYear : String = ""
    @State var SSCSeatNo : String = ""
    @State var SSCBoardName : String = ""
    @State var SSCMarks : String = ""
    @State var SSCPercentage : String = ""
    
    @State var HSCPassingYear : String = ""
    @State var HSCSeatNo : String = ""
    @State var HSCBoardName : String = ""
    @State var HSCMarks : String = ""
    @State var HSCPercentage : String = ""
    @State var HSCPhysicsMarks : String = ""
    @State var HSCChemistryMarks : String = ""
    @State var HSCBiologyMarks : String = ""
    @State var HSCMathsMarks : String = ""
    @State var HSCVocationalMarks : String = ""
    @State var HSCVocationalName : String = ""
    

    
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
    @State var isExpanded : Bool = true
    @State var isExpandedSSC : Bool = false
    @State var isExpandedHSC : Bool = true
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
                    Text("Previous Course Details")
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
                                Text("SSC Details ")
                                    .bold()
                                    .frame(maxWidth: .infinity,alignment: .center)
                                    .font(.title2)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color("background"))
                                    )
                                
                                Button(action: {
                                    withAnimation{
                                        isExpandedSSC.toggle()
                                    }
                                }, label: {
                                    if isExpandedSSC{
                                        Image(systemName: "arrow.down.forward.and.arrow.up.backward")
                                            .foregroundStyle(Color.black)
                                    }else{
                                        Image(systemName: "arrow.up.backward.and.arrow.down.forward")
                                            .foregroundStyle(Color.black)
                                    }
                                    
                                })
                                
                            }
                            if isExpandedSSC{
                                VStack{
                                    HStack{
                                        Text("SSC Passing Year : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("SSC Passing Year", text: $SSCPassingYear)
                                            .keyboardType(.alphabet).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
                                    HStack{
                                        Text("SSC Seat No : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("SSC Seat No", text: $SSCSeatNo)
                                            .keyboardType(.alphabet).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
                                    HStack{
                                        Text("Name of \nthe board : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("Name of the board", text: $SSCBoardName)
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
                                        Text("SSC Marks :")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("SSC Marks", text: $SSCMarks)
                                            .keyboardType(.alphabet).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
                                    HStack{
                                        Text("SSC Percentage/CGPA : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("SSC Percentage/CGPA", text: $SSCPercentage)
                                            .keyboardType(.alphabet).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
                                    
                                    
                                    if SSCMarks.isEmpty || SSCPercentage.isEmpty || SSCSeatNo.isEmpty || SSCBoardName.isEmpty || SSCPassingYear.isEmpty{
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
//                                            isOTPSentFather.toggle()
                                        }, label: {
                                            Text("Submit & Next")
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
                            HStack{
                                Text("HSC Details ")
                                    .bold()
                                    .frame(maxWidth: .infinity,alignment: .center)
                                    .font(.title2)
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color("background"))
                                    )
                                
                                Button(action: {
                                    withAnimation{
                                        isExpandedHSC.toggle()
                                    }
                                }, label: {
                                    if isExpandedHSC{
                                        Image(systemName: "arrow.down.forward.and.arrow.up.backward")
                                            .foregroundStyle(Color.black)
                                    }else{
                                        Image(systemName: "arrow.up.backward.and.arrow.down.forward")
                                            .foregroundStyle(Color.black)
                                    }
                                    
                                })
                                
                            }
                            if isExpandedHSC{
                                VStack{
                                    VStack{
                                        Text("Note")
                                            .bold()
                                            .frame(maxWidth: .infinity,alignment: .leading)
                                        Text("1. If not a Bifocal student, Select Vocational Subject as Computer Science and Enter Marks as 0.")
                                            .frame(maxWidth: .infinity,alignment: .leading)
                                        Text("2. If a Bifocal student, Enter Biology marks as 0.")
                                            .frame(maxWidth: .infinity,alignment: .leading)
                                    }
                                    .foregroundStyle(Color.red)
                                    .padding(4)
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                    HStack{
                                        Text("HSC Passing Year : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("HSC Passing Year", text: $HSCPassingYear)
                                            .keyboardType(.alphabet).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
                                    HStack{
                                        Text("HSC Seat No : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("HSC Seat No", text: $HSCSeatNo)
                                            .keyboardType(.alphabet).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
                                    HStack{
                                        Text("Name of \nthe board : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("Name of the board", text: $HSCBoardName)
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
                                        Text("HSC Marks :")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("HSC Marks", text: $HSCMarks)
                                            .keyboardType(.alphabet).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
                                    HStack{
                                        Text("HSC Percentage/CGPA : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("HSC Percentage/CGPA", text: $HSCPercentage)
                                            .keyboardType(.alphabet).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
                                    
                                    
                                    if HSCMarks.isEmpty || HSCPercentage.isEmpty || HSCSeatNo.isEmpty || HSCBoardName.isEmpty || HSCPassingYear.isEmpty{
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
//                                            isOTPSentFather.toggle()
                                        }, label: {
                                            Text("Submit & Next")
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

#Preview {
    EducationDetailsView()
}
