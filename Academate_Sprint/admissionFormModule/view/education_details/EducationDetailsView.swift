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
    @StateObject var viewmodel = AdmissionFormMainViewModel()
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
                                if viewmodel.dashboardDataModel.data.last?.programmID ?? 0 == 1{
                                    EntranceDetailsView()
                                }else if viewmodel.dashboardDataModel.data.last?.programmID ?? 0 > 1{
                                    SemDetailsView()
                                }
                                Divider()
                                PresentCourseDetailsView()
                                Divider()
                                NavigationLink {
                                    UploadDocumentView()
                                } label: {
                                        Label("Upload Documents",systemImage: "doc.badge.arrow.up")
                                }
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            
        }.navigationBarBackButtonHidden(true)
            .task {
                viewmodel.getStudentDashBoard()
                print(" Programm ID \(String(viewmodel.dashboardDataModel.data.last?.programmID ?? 0))")
            }
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
//    @State var HSCPCMMarks : String = ""
    @State var HSCVocationalMarks : String = ""
    @State var HSCVocationalName : String = ""
    let HSCVocationalSubjects = ["Computer Science" , "Information Technology" , "Electronics"]

    
    @State var DiplomaPassingYear : String = ""
    @State var DiplomaSeatNo : String = ""
    @State var DiplomaBoardName : String = ""
    @State var DiplomaCollegeName : String = ""
    @State var DiplomaMarks : String = ""
    @State var DiplomaPercentage : String = ""
    @State var DiplomaCGPI : String = ""
    
    @State var isAvailable : Bool = false
    @State var isExpanded : Bool = false
    @State var isExpandedSSC : Bool = false
    @State var isExpandedHSC : Bool = false
    @State var isExpandedDiploma : Bool = false
    
    let userDefaultsManager = UserDefaultsManager.shared
    var uid: Int {
        print(userDefaultsManager.getUid() ?? "no uid found")
        return userDefaultsManager.getUid() ?? 0
    }
    @StateObject var viewmodel = AdmissionFormMainViewModel()
    // Need to Add : validation that all the fields in the form is filled then go to next section
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
                                    .padding()
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
                                            viewmodel.previousCourseDataModel.sscPass = SSCPassingYear
                                            viewmodel.previousCourseDataModel.sscSeat = SSCSeatNo
                                            viewmodel.previousCourseDataModel.boardName = SSCBoardName
                                            viewmodel.previousCourseDataModel.sscMarks = SSCMarks
                                            viewmodel.previousCourseDataModel.sscPercentage = SSCPercentage
                                            viewmodel.previousCourseDataModel.uid = String(uid)
                                            viewmodel.postSSCDetails()
                                            isExpandedSSC.toggle()
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
                            Divider()
                            HStack{
                                Text("HSC Details ")
                                    .bold()
                                    .frame(maxWidth: .infinity,alignment: .center)
                                    .font(.title2)
                                    .padding()
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
                                    HStack{
                                        Text("HSC Maths Marks : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("HSC Maths Marks", text: $HSCMathsMarks)
                                            .keyboardType(.alphabet).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
                                    HStack{
                                        Text("HSC Chemistry Marks : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("HSC Chemistry Marks", text: $HSCChemistryMarks)
                                            .keyboardType(.alphabet).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
                                    HStack{
                                        Text("HSC Physics Marks : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("HSC Physics Marks", text: $HSCPhysicsMarks)
                                            .keyboardType(.alphabet).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
                                    HStack{
                                        Text("HSC Biology Marks : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("HSC Biology Marks", text: $HSCBiologyMarks)
                                            .keyboardType(.alphabet).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
                                    HStack{
                                        Text("Vocational Subject :")
                                            .bold()
                                            .font(.title2)
                                            .frame(maxWidth: .infinity,alignment: .leading)
                                        Picker("Subject ", selection: $HSCVocationalName) {
                                            ForEach(HSCVocationalSubjects, id: \.self) {
                                                Text($0)
                                            }
                                        }
                                        .frame(maxWidth: .infinity,alignment: .trailing)
                                    }
                                    HStack{
                                        Text("HSC Vocational Marks : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("HSC Vocational Marks", text: $HSCVocationalMarks)
                                            .keyboardType(.alphabet).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
//                                    HStack{
//                                        Text("PCM Percentage : ")
//                                            .bold()
//                                            .font(.title3)
//                                            .frame(width: .infinity , alignment: .leading)
//                                        TextField("PCM Percentage", text: $HSCPCMMarks)
//                                            .keyboardType(.alphabet).autocapitalization(.none)
//                                            .padding(15)
//                                            .overlay(
//                                                RoundedRectangle(cornerRadius: 10)
//                                                    .stroke(Color("toolbar"))
//                                            )
//                                        
//                                    }
//                                    .padding(.bottom,5)
                                    
                                    if HSCMarks.isEmpty || HSCPercentage.isEmpty || HSCSeatNo.isEmpty || HSCBoardName.isEmpty || HSCPassingYear.isEmpty || HSCMathsMarks.isEmpty || HSCPhysicsMarks.isEmpty || HSCChemistryMarks.isEmpty || HSCBiologyMarks.isEmpty || HSCVocationalMarks.isEmpty {
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
                                            viewmodel.previousCourseDataModel.hscPass = HSCPassingYear
                                            viewmodel.previousCourseDataModel.hscSeat = HSCSeatNo
                                            viewmodel.previousCourseDataModel.hscBoardName = HSCBoardName
                                            viewmodel.previousCourseDataModel.hscMarks = HSCMarks
                                            viewmodel.previousCourseDataModel.hscPercentage = HSCPercentage
                                            viewmodel.previousCourseDataModel.phyMarks = HSCPhysicsMarks
                                            viewmodel.previousCourseDataModel.cheMarks = HSCChemistryMarks
                                            viewmodel.previousCourseDataModel.bioMarks = HSCBiologyMarks
                                            viewmodel.previousCourseDataModel.mathMarks = HSCMathsMarks
                                            viewmodel.previousCourseDataModel.vocationalMarks = HSCVocationalMarks
                                            viewmodel.previousCourseDataModel.vocationalSubject = HSCVocationalName
                                            viewmodel.previousCourseDataModel.uid = String(uid)
                                            viewmodel.postHSCDetails()
                                            isExpandedHSC.toggle()
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
                            Divider()
                            HStack{
                                Text("Diploma Details ")
                                    .bold()
                                    .frame(maxWidth: .infinity,alignment: .center)
                                    .font(.title2)
                                    .padding()
                                    .background(
                                        RoundedRectangle(cornerRadius: 10)
                                            .fill(Color("background"))
                                    )
                                
                                Button(action: {
                                    withAnimation{
                                        isExpandedDiploma.toggle()
                                    }
                                }, label: {
                                    if isExpandedDiploma{
                                        Image(systemName: "arrow.down.forward.and.arrow.up.backward")
                                            .foregroundStyle(Color.black)
                                    }else{
                                        Image(systemName: "arrow.up.backward.and.arrow.down.forward")
                                            .foregroundStyle(Color.black)
                                    }
                                    
                                })
                                
                            }
                            if isExpandedDiploma{
                                VStack{
                                    HStack{
                                        Text("Diploma Passing Year : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("Diploma Passing Year", text: $DiplomaPassingYear)
                                            .keyboardType(.alphabet).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
                                    HStack{
                                        Text("Diploma Seat No : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("Diploma Seat No", text: $DiplomaSeatNo)
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
                                        TextField("Name of the board", text: $DiplomaBoardName)
                                            .keyboardType(.alphabet).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
                                    HStack{
                                        Text("Name of \nthe College : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("Name of the College", text: $DiplomaCollegeName)
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
                                        Text("Diploma Marks :")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("Diploma Marks", text: $DiplomaMarks)
                                            .keyboardType(.alphabet).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
                                    HStack{
                                        Text("Diploma Percentage/CGPA : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("Diploma Percentage/CGPA", text: $DiplomaPercentage)
                                            .keyboardType(.alphabet).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
                                    HStack{
                                        Text("Diploma CGPI : ")
                                            .bold()
                                            .font(.title3)
                                            .frame(width: .infinity , alignment: .leading)
                                        TextField("Diploma CGPI", text: $DiplomaCGPI)
                                            .keyboardType(.alphabet).autocapitalization(.none)
                                            .padding(15)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .stroke(Color("toolbar"))
                                            )
                                        
                                    }
                                    .padding(.bottom,5)
                                    
                                    
                                        
                                    
                                        Button(action: {
                                            viewmodel.previousCourseDataModel.dipPass = DiplomaPassingYear
                                            viewmodel.previousCourseDataModel.dipSeat = DiplomaSeatNo
                                            viewmodel.previousCourseDataModel.dipBoard = DiplomaBoardName
                                            viewmodel.previousCourseDataModel.dipCollegeName = DiplomaCollegeName
                                            viewmodel.previousCourseDataModel.dipMarks = DiplomaMarks
                                            viewmodel.previousCourseDataModel.dipPercentage = DiplomaPercentage
                                            viewmodel.previousCourseDataModel.dipCgpi = DiplomaCGPI
                                            viewmodel.previousCourseDataModel.uid = String(uid)
                                            viewmodel.postDiplomaDetails()
                                            isExpandedDiploma.toggle()
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
                    }
                }
            }
        }
        .padding(10)
        .frame(maxHeight: .infinity, alignment: .topLeading)
        .task {
            viewmodel.getPreviousCourseDetails { data in
                if let data = data {
                    // SSC Details
                        SSCPassingYear = data.sscPassingYear
                        SSCSeatNo = data.sscSeatNumber
                        SSCBoardName = data.sscNameOfBoard
                        SSCMarks = data.sscMarks
                        SSCPercentage = data.sscPercentage
                        
                        // HSC Details
                        HSCPassingYear = data.hscPassingYear
                        HSCSeatNo = data.hscSeatYear
                        HSCBoardName = data.hscNameOfBoard
                        HSCMarks = data.hscMarks
                        HSCPercentage = data.hscPercentage
                        HSCPhysicsMarks = data.physicsScoreInHsc
                        HSCChemistryMarks = data.chemistryScoreInHsc
                        HSCBiologyMarks = data.bioMarks
                        HSCMathsMarks = data.mathsScoreHsc
                        
                        // HSC Vocational Details
                        HSCVocationalMarks = data.vocationalTotalScoreHsc
                        HSCVocationalName = data.vocationalSubject
                        
                        // Diploma Details
                        DiplomaPassingYear = data.depPassingYear ?? ""
                        DiplomaSeatNo = data.depSeat ?? ""
                        DiplomaBoardName = data.dipBoard ?? ""
                        DiplomaCollegeName = data.depClgName ?? ""
                        DiplomaMarks = data.depMarks ?? ""
                        DiplomaPercentage = data.depPer ?? ""
                        DiplomaCGPI = data.depCgpi ?? ""
                }else {
                    // Handle the case where data retrieval failed
                    print("Failed to retrieve RaddNew object")
                    // You might want to display an error message or take other actions
                }
            }
        }
    }
}
struct EntranceDetailsView : View {
    @State var isAvailable : Bool = false
    @State var isExpanded : Bool = false
    @State var EntranceExamName : String = ""
    @State var RollNo : String = ""
    @State var ApplicationNumber : String = ""
    @State var PhysicsScore : String = ""
    @State var ChemistryScore : String = ""
    @State var MathsScore : String = ""
    @State var OverallScore : String = ""
    let userDefaultsManager = UserDefaultsManager.shared
    var uid: Int {
        print(userDefaultsManager.getUid() ?? "no uid found")
        return userDefaultsManager.getUid() ?? 0
    }
    @StateObject var viewmodel = AdmissionFormMainViewModel()
    // Need to Add : Viewmodel Based List for the multiple entrance Examinations
    // Need to Add : validation that all the fields in the form is filled then go to next section
    var body: some View {
        ScrollView(showsIndicators : false){
            VStack{
                HStack{
                    Text("Entrance Details")
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
                        ScrollView(showsIndicators: false){
                            VStack{
                                HStack{
                                    Text("Entrance Exam Name : ")
                                        .bold()
                                        .font(.title3)
                                        .frame(width: .infinity , alignment: .leading)
                                    TextField("Entrance Exam Name", text: $EntranceExamName)
                                        .keyboardType(.alphabet).autocapitalization(.none)
                                        .padding(15)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color("toolbar"))
                                        )
                                    
                                }
                                .padding(.bottom,5)
                                HStack{
                                    Text("Roll No : ")
                                        .bold()
                                        .font(.title3)
                                        .frame(width: .infinity , alignment: .leading)
                                    TextField("Roll No", text: $RollNo)
                                        .keyboardType(.alphabet).autocapitalization(.none)
                                        .padding(15)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color("toolbar"))
                                        )
                                    
                                }
                                .padding(.bottom,5)
                                HStack{
                                    Text("Application Number : ")
                                        .bold()
                                        .font(.title3)
                                        .frame(width: .infinity , alignment: .leading)
                                    TextField("Application Number", text: $ApplicationNumber)
                                        .keyboardType(.alphabet).autocapitalization(.none)
                                        .padding(15)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color("toolbar"))
                                        )
                                    
                                }
                                .padding(.bottom,5)
                                HStack{
                                    Text("Physics Score :")
                                        .bold()
                                        .font(.title3)
                                        .frame(width: .infinity , alignment: .leading)
                                    TextField("Physics Score", text: $PhysicsScore)
                                        .keyboardType(.alphabet).autocapitalization(.none)
                                        .padding(15)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color("toolbar"))
                                        )
                                    
                                }
                                .padding(.bottom,5)
                                HStack{
                                    Text("Chemistry Score : ")
                                        .bold()
                                        .font(.title3)
                                        .frame(width: .infinity , alignment: .leading)
                                    TextField("Chemistry Score", text: $ChemistryScore)
                                        .keyboardType(.alphabet).autocapitalization(.none)
                                        .padding(15)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color("toolbar"))
                                        )
                                    
                                }
                                .padding(.bottom,5)
                                HStack{
                                    Text("Maths Score : ")
                                        .bold()
                                        .font(.title3)
                                        .frame(width: .infinity , alignment: .leading)
                                    TextField("Maths Score", text: $MathsScore)
                                        .keyboardType(.alphabet).autocapitalization(.none)
                                        .padding(15)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color("toolbar"))
                                        )
                                    
                                }
                                .padding(.bottom,5)
                                HStack{
                                    Text("Overall Score : ")
                                        .bold()
                                        .font(.title3)
                                        .frame(width: .infinity , alignment: .leading)
                                    TextField("Overall Score", text: $OverallScore)
                                        .keyboardType(.alphabet).autocapitalization(.none)
                                        .padding(15)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color("toolbar"))
                                        )
                                    
                                }
                                .padding(.bottom,5)
                                if EntranceExamName.isEmpty || RollNo.isEmpty || ApplicationNumber.isEmpty || PhysicsScore.isEmpty || ChemistryScore.isEmpty || MathsScore.isEmpty || OverallScore.isEmpty{
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
                                        // Add to entrance List Logic
                                        viewmodel.entranceDataModel.entranceName = EntranceExamName
                                        viewmodel.entranceDataModel.rollNumber = RollNo
                                        viewmodel.entranceDataModel.appNumber = ApplicationNumber
                                        viewmodel.entranceDataModel.phyPer = PhysicsScore
                                        viewmodel.entranceDataModel.chePer = ChemistryScore
                                        viewmodel.entranceDataModel.mathsPer = MathsScore
                                        viewmodel.entranceDataModel.overallPer = OverallScore
                                        viewmodel.entranceDataModel.uid = String(uid)
                                        
                                        viewmodel.postEntranceDetails()
                                        viewmodel.getEntranceData()
                                        EntranceExamName = ""
                                        RollNo = ""
                                        ApplicationNumber = ""
                                        PhysicsScore = ""
                                        ChemistryScore = ""
                                        MathsScore = ""
                                        OverallScore = ""
                                    }, label: {
                                        Text("Add")
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
                                Text("Entrance Data:")
                                    .bold()
                                    .font(.title2)
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                Divider()
                                LazyVStack{
                                    ForEach(viewmodel.entranceDataModel.EntranceDetailsList){data in
                                        VStack{
                                            HStack{
                                                Text("Entrance Name:")
                                                    .bold()
                                                    .frame(maxWidth: .infinity,alignment: .leading)
                                                Text(data.entranceName)
                                                    .frame(maxWidth: .infinity,alignment: .leading)
                                            }
                                            .padding(.leading , 10)
                                            .padding(.trailing , 10)
                                            .padding(.top, 10)
                                            HStack{
                                                Text("Roll Number:")
                                                    .bold()
                                                    .frame(maxWidth: .infinity,alignment: .leading)
                                                Text(data.rollNumber)
                                                    .frame(maxWidth: .infinity,alignment: .leading)
                                            }
                                            .padding(.leading , 10)
                                            .padding(.trailing , 10)
                                            .padding(.top, 10)
                                            HStack{
                                                Text("Application Number:")
                                                    .bold()
                                                    .frame(maxWidth: .infinity,alignment: .leading)
                                                Text(data.appNumber)
                                                    .frame(maxWidth: .infinity,alignment: .leading)
                                            }
                                            .padding(.leading , 10)
                                            .padding(.trailing , 10)
                                            .padding(.top, 10)
                                            HStack{
                                                Text("Physics Score:")
                                                    .bold()
                                                    .frame(maxWidth: .infinity,alignment: .leading)
                                                Text(data.phyPer)
                                                    .frame(maxWidth: .infinity,alignment: .leading)
                                            }
                                            .padding(.leading , 10)
                                            .padding(.trailing , 10)
                                            .padding(.top, 10)
                                            HStack{
                                                Text("Chemistry Scoore:")
                                                    .bold()
                                                    .frame(maxWidth: .infinity,alignment: .leading)
                                                Text(data.chePer)
                                                    .frame(maxWidth: .infinity,alignment: .leading)
                                            }
                                            .padding(.leading , 10)
                                            .padding(.trailing , 10)
                                            .padding(.top, 10)
                                            HStack{
                                                Text("Maths Scoore:")
                                                    .bold()
                                                    .frame(maxWidth: .infinity,alignment: .leading)
                                                Text(data.mathsPer)
                                                    .frame(maxWidth: .infinity,alignment: .leading)
                                            }
                                            .padding(.leading , 10)
                                            .padding(.trailing , 10)
                                            .padding(.top, 10)
                                            HStack{
                                                Text("Overall Scoore:")
                                                    .bold()
                                                    .frame(maxWidth: .infinity,alignment: .leading)
                                                Text(data.overallPer)
                                                    .frame(maxWidth: .infinity,alignment: .leading)
                                            }
                                            .padding(.leading , 10)
                                            .padding(.trailing , 10)
                                            .padding(.top, 10)
                                            .padding(.bottom, 10)
                                        }
                                        
                                        .background(
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color.white)
                                                .shadow(radius: 4)
                                        )
                                        .padding(10)
                                    }
                                }
                                
                            }
                            Divider()
                            
                        }
                    }
                }
            }
        }
        .padding(10)
        .frame(maxHeight: .infinity, alignment: .topLeading)
        .task {
            viewmodel.getEntranceData()
        }
    }
}
struct SemDetailsView : View {
    @State var isAvailable : Bool = false
    @State var isExpanded : Bool = false
    
    @State var SemNumber : String = ""
    @State var SemGradeObtained : String = ""
    @State var totalInternalKT : String = ""
    @State var totalExternalKT : String = ""
    @State var totalKT : String = ""
    @State var agggScrore : String = ""
    let userDefaultsManager = UserDefaultsManager.shared
    var uid: Int {
        print(userDefaultsManager.getUid() ?? "no uid found")
        return userDefaultsManager.getUid() ?? 0
    }
    @StateObject var viewmodel = AdmissionFormMainViewModel()
    // Need to Add : Viewmodel Based List for the multiple entrance Examinations
    // Need to Add : validation that all the fields in the form is filled then go to next section
    var body: some View {
        ScrollView(showsIndicators : false){
            VStack{
                HStack{
                    Text("Sem Details")
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
                        ScrollView(showsIndicators: false){
                            VStack{
                                HStack{
                                    Text("Semester No. : ")
                                        .bold()
                                        .font(.title3)
                                        .frame(width: .infinity , alignment: .leading)
                                    TextField("Semester No.", text: $SemNumber)
                                        .keyboardType(.alphabet).autocapitalization(.none)
                                        .padding(15)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color("toolbar"))
                                        )
                                    
                                }
                                .padding(.bottom,5)
                                HStack{
                                    Text("Semester Grade Obtained : ")
                                        .bold()
                                        .font(.title3)
                                        .frame(width: .infinity , alignment: .leading)
                                    TextField("Semester Grade Obtained", text: $SemGradeObtained)
                                        .keyboardType(.alphabet).autocapitalization(.none)
                                        .padding(15)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color("toolbar"))
                                        )
                                    
                                }
                                .padding(.bottom,5)
                                HStack{
                                    Text("Total Internal KT : ")
                                        .bold()
                                        .font(.title3)
                                        .frame(width: .infinity , alignment: .leading)
                                    TextField("Total Internal KT", text: $totalInternalKT)
                                        .keyboardType(.alphabet).autocapitalization(.none)
                                        .padding(15)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color("toolbar"))
                                        )
                                    
                                }
                                .padding(.bottom,5)
                                HStack{
                                    Text("Total External KT :")
                                        .bold()
                                        .font(.title3)
                                        .frame(width: .infinity , alignment: .leading)
                                    TextField("Total External KT", text: $totalExternalKT)
                                        .keyboardType(.alphabet).autocapitalization(.none)
                                        .padding(15)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color("toolbar"))
                                        )
                                    
                                }
                                .padding(.bottom,5)
                                HStack{
                                    Text("Total Internal + Total External KT : ")
                                        .bold()
                                        .font(.title3)
                                        .frame(width: .infinity , alignment: .leading)
                                    TextField("Chemistry Score", text: $totalKT)
                                        .keyboardType(.alphabet).autocapitalization(.none)
                                        .padding(15)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color("toolbar"))
                                        )
                                    
                                }
                                .padding(.bottom,5)
                                HStack{
                                    Text("Aggregate Score : ")
                                        .bold()
                                        .font(.title3)
                                        .frame(width: .infinity , alignment: .leading)
                                    TextField("Aggregate Score", text: $agggScrore)
                                        .keyboardType(.alphabet).autocapitalization(.none)
                                        .padding(15)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color("toolbar"))
                                        )
                                    
                                }
                                .padding(.bottom,5)
                                if SemNumber.isEmpty || SemGradeObtained.isEmpty || totalInternalKT.isEmpty || totalExternalKT.isEmpty || totalKT.isEmpty || agggScrore.isEmpty {
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
                                        // Add to entrance List Logic
                                        viewmodel.semDataModel.sem = SemNumber
                                        viewmodel.semDataModel.grade = SemGradeObtained
                                        viewmodel.semDataModel.internalKt = totalInternalKT
                                        viewmodel.semDataModel.externalKt = totalExternalKT
                                        viewmodel.semDataModel.totalKt = totalKT
                                        viewmodel.semDataModel.aggregate = agggScrore
                                        viewmodel.entranceDataModel.uid = String(uid)
                                        
                                        viewmodel.postSemDetails()
                                        viewmodel.getSemData()
                                        SemNumber = ""
                                        SemGradeObtained = ""
                                        totalInternalKT = ""
                                        totalExternalKT = ""
                                        totalKT = ""
                                        agggScrore = ""
                                    }, label: {
                                        Text("Add")
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

                                if !viewmodel.semDataModel.semDetailList.isEmpty{
                                    Text("Sem Data:")
                                        .bold()
                                        .font(.title2)
                                        .frame(maxWidth: .infinity,alignment: .leading)
                                    Divider()
                                    LazyVStack{
                                        ForEach(viewmodel.semDataModel.semDetailList){data in
                                            VStack{
                                                HStack{
                                                    Text("Semester :")
                                                        .bold()
                                                        .frame(maxWidth: .infinity,alignment: .leading)
                                                    Text(String(data.semNumber))
                                                        .frame(maxWidth: .infinity,alignment: .leading)
                                                }
                                                .padding(.leading , 10)
                                                .padding(.trailing , 10)
                                                .padding(.top, 10)
                                                HStack{
                                                    Text("Grade:")
                                                        .bold()
                                                        .frame(maxWidth: .infinity,alignment: .leading)
                                                    Text(data.gradeObtained)
                                                        .frame(maxWidth: .infinity,alignment: .leading)
                                                }
                                                .padding(.leading , 10)
                                                .padding(.trailing , 10)
                                                
                                                HStack{
                                                    Text("Total Internal KT:")
                                                        .bold()
                                                        .frame(maxWidth: .infinity,alignment: .leading)
                                                    Text(String(data.internalKt))
                                                        .frame(maxWidth: .infinity,alignment: .leading)
                                                }
                                                .padding(.leading , 10)
                                                .padding(.trailing , 10)
                                                
                                                HStack{
                                                    Text("Total External KT:")
                                                        .bold()
                                                        .frame(maxWidth: .infinity,alignment: .leading)
                                                    Text(String(data.externalKt))
                                                        .frame(maxWidth: .infinity,alignment: .leading)
                                                }
                                                .padding(.leading , 10)
                                                .padding(.trailing , 10)
                                                
                                                HStack{
                                                    Text("Total KT:")
                                                        .bold()
                                                        .frame(maxWidth: .infinity,alignment: .leading)
                                                    Text(String(data.totalKt))
                                                        .frame(maxWidth: .infinity,alignment: .leading)
                                                }
                                                .padding(.leading , 10)
                                                .padding(.trailing , 10)
                                                
                                                HStack{
                                                    Text("Aggregate:")
                                                        .bold()
                                                        .frame(maxWidth: .infinity,alignment: .leading)
                                                    Text(data.aggregatedScore)
                                                        .frame(maxWidth: .infinity,alignment: .leading)
                                                }
                                                .padding(.leading , 10)
                                                .padding(.trailing , 10)
                                                .padding(.bottom, 10)
                                            }
                                            
                                            .background(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .fill(Color.white)
                                                    .shadow(radius: 4)
                                            )
                                            .padding(10)
                                        }
                                    }
                                }
                            }
                            Divider()
                            
                        }
                    }
                }
            }
        }
        .padding(10)
        .frame(maxHeight: .infinity, alignment: .topLeading)
        .task {
            viewmodel.getSemData()
        }
    }
}
struct PresentCourseDetailsView : View {
    @State var isAvailable : Bool = false
    @State var isExpanded : Bool = false
    
    @State var studentID : String = ""
    @State var selectedProgram : String = ""
    @State var selectedBranch : String = ""
    @State var seatType : String = ""
    @State var grNumber : String = ""
    @State var category : String = ""
    let userDefaultsManager = UserDefaultsManager.shared
    var uid: Int {
        print(userDefaultsManager.getUid() ?? "no uid found")
        return userDefaultsManager.getUid() ?? 0
    }
    @StateObject var viewmodel = AdmissionFormMainViewModel()
    let reverseBranchIDMap: [Int: String] = [
        1: "Computer Engineering",
        2: "Artificial Intelligence And Data Science",
        4: "Information technology"
    ]
    let reverseProgramIDMap: [Int: String] = [
        1: "First Year (F.Y B.E)",
        2: "Direct Second Year (D.S.Y. B.E.)",
        3: "Second Year (S.Y. B.E.)",
        4: "Third Year (T.Y. B.E.)",
        5: "Final Year (B.E. Final Year)"
    ]
    let reverseSeatIDMap: [Int: String] = [
        1: "CAP",
        2: "Institute Level",
        3: "Against CAP"
    ]
    // Need to Add : Viewmodel Based List for the multiple entrance Examinations
    // Need to Add : validation that all the fields in the form is filled then go to next section
    var body: some View {
        ScrollView(showsIndicators : false){
            VStack{
                HStack{
                    Text("Present Course Details")
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
                        ScrollView(showsIndicators: false){
                            VStack{
                                HStack{
                                    Text("Student ID : ")
                                        .bold()
                                        .font(.title3)
                                        .frame(width: .infinity , alignment: .leading)
                                    TextField("Student ID", text: $viewmodel.presentCourseDatamodel.studentID)
                                        .keyboardType(.alphabet).autocapitalization(.none)
                                        .bold()
                                        .disabled(true)
                                        .padding(15)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color("toolbar"))
                                        )
                                    
                                }
                                .padding(.bottom,5)
                                HStack{
                                    Text("Selected Program : ")
                                        .bold()
                                        .font(.title3)
                                        .frame(width: .infinity , alignment: .leading)
                                    TextField("Selected Program", text: $viewmodel.presentCourseDatamodel.selectedProgram)
                                        .keyboardType(.alphabet).autocapitalization(.none)
                                        .bold()
                                        .disabled(true)
                                        .padding(15)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color("toolbar"))
                                        )
                                    
                                }
                                .padding(.bottom,5)
                                HStack{
                                    Text("Selected Branch : ")
                                        .bold()
                                        .font(.title3)
                                        .frame(width: .infinity , alignment: .leading)
                                    TextField("Selected Branch", text: $viewmodel.presentCourseDatamodel.selectedBranch)
                                        .keyboardType(.alphabet).autocapitalization(.none)
                                        .bold()
                                        .disabled(true)
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
                                        .font(.title3)
                                        .frame(width: .infinity , alignment: .leading)
                                    TextField("Seat Type", text: $viewmodel.presentCourseDatamodel.seatType)
                                        .keyboardType(.alphabet).autocapitalization(.none)
                                        .bold()
                                        .disabled(true)
                                        .padding(15)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color("toolbar"))
                                        )
                                    
                                }
                                .padding(.bottom,5)
                                HStack{
                                    Text("GR Number : ")
                                        .bold()
                                        .font(.title3)
                                        .frame(width: .infinity , alignment: .leading)
                                    TextField("GR Number", text: $viewmodel.presentCourseDatamodel.grNumber)
                                        .keyboardType(.alphabet).autocapitalization(.none)
                                        .bold()
                                        .disabled(true)
                                        .padding(15)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color("toolbar"))
                                        )
                                    
                                }
                                .padding(.bottom,5)
                                HStack{
                                    Text("Category : ")
                                        .bold()
                                        .font(.title3)
                                        .frame(width: .infinity , alignment: .leading)
                                    TextField("category", text: $viewmodel.presentCourseDatamodel.category)
                                        .keyboardType(.alphabet).autocapitalization(.none)
                                        .bold()
                                        .disabled(true)
                                        .padding(15)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color("toolbar"))
                                        )
                                    
                                }
                                .padding(.bottom,5)
                                
                               
                                    Button(action: {
                                        isExpanded.toggle()
                                    }, label: {
                                        Text("Confirm and Next")
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
                            Divider()
                            
                        }
                    }
                }
            }
        }
        .padding(10)
        .frame(maxHeight: .infinity, alignment: .topLeading)
        .task {
            viewmodel.getPresentData()
        }
    }
}

#Preview {
    EducationDetailsView()
}
