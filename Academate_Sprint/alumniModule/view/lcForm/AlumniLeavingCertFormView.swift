//
//  AlumniLeavingCertFormView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 13/03/24.
//

import SwiftUI
import PhotosUI
struct AlumniLeavingCertFormView: View {
    @State var isAvailable : Bool = false
    @State private var avatarItem: PhotosPickerItem?
    @State var email : String = ""
    var body: some View {
        
        ScrollView(showsIndicators: false){
            VStack{
                Text("LC Application")
                    .font(.title)
                Divider()
                Text("Basic Info")
                    .bold()
                    .frame(maxWidth: .infinity,alignment: .leading)
                Divider()
                HStack{
                    Text("Name : ")
                        .bold()
                        .font(.title2)
                        .frame(width: .infinity , alignment: .leading)
                    if isAvailable{
                        Text("Name Value")
                        //                            .font(.title3)
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
                HStack{
                    Text("Name : ")
                        .bold()
                        .font(.title2)
                        .frame(width: .infinity , alignment: .leading)
                    if isAvailable{
                        Text("Name Value")
                        //                            .font(.title3)
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
                HStack{
                    Text("Name : ")
                        .bold()
                        .font(.title2)
                        .frame(width: .infinity , alignment: .leading)
                    if isAvailable{
                        Text("Name Value")
                        //                            .font(.title3)
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
                HStack{
                    Text("Name : ")
                        .bold()
                        .font(.title2)
                        .frame(width: .infinity , alignment: .leading)
                    if isAvailable{
                        Text("Name Value")
                        //                            .font(.title3)
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
                HStack{
                    Text("Name : ")
                        .bold()
                        .font(.title2)
                        .frame(width: .infinity , alignment: .leading)
                    if isAvailable{
                        Text("Name Value")
                        //                            .font(.title3)
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
                HStack{
                    Text("Name : ")
                        .bold()
                        .font(.title2)
                        .frame(width: .infinity , alignment: .leading)
                    if isAvailable{
                        Text("Name Value")
                        //                            .font(.title3)
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
                Divider()
                Text("Documents ")
                    .bold()
                    .frame(maxWidth: .infinity,alignment: .leading)
                Divider()
                HStack{
                    Text("Image : ")
                        .bold()
                        .font(.title2)
                        .frame(maxWidth: .infinity , alignment: .leading)
                    // Link For More Ref : https://www.hackingwithswift.com/quick-start/swiftui/how-to-let-users-select-pictures-using-photospicker
                    Button(action: {
                        PhotosPicker(selection:  $avatarItem,
                                     matching: .images,
                                     photoLibrary: .shared()) {
                            Image(systemName: "pencil.circle.fill")
                                .symbolRenderingMode(.multicolor)
                                .font(.system(size: 30))
                                .foregroundColor(.accentColor)
                        }
                    }, label: {
                        Text("Select")
                            .foregroundStyle(Color.white)
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.indigo)
                            )
                    }) // X 5
                    
                    
                }
                .padding(.bottom,5)
                
                Divider()
                Text("Details  ")
                    .bold()
                    .frame(maxWidth: .infinity,alignment: .leading)
                Divider()
                VStack{
                    Text("Seat Number : ")
                        .underline()
                        .font(.headline)
                        .frame(maxWidth: .infinity , alignment: .leading)
                    TextField("Seat Number", text: $email)
                        .keyboardType(.emailAddress).autocapitalization(.none)
                        .padding(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("toolbar"))
                        )
                }.padding(.bottom,10)
                VStack{
                    Text("Academic year : ")
                        .underline()
                        .font(.headline)
                        .frame(maxWidth: .infinity , alignment: .leading)
                    TextField("Academic year", text: $email)
                        .keyboardType(.emailAddress).autocapitalization(.none)
                        .padding(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("toolbar"))
                        )
                }.padding(.bottom,10)
                VStack{
                    Text("Religion : ")
                        .underline()
                        .font(.headline)
                        .frame(maxWidth: .infinity , alignment: .leading)
                    TextField("Religion", text: $email)
                        .keyboardType(.emailAddress).autocapitalization(.none)
                        .padding(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("toolbar"))
                        )
                }.padding(.bottom,10)
                VStack{
                    Text("Cast : ")
                        .underline()
                        .font(.headline)
                        .frame(maxWidth: .infinity , alignment: .leading)
                    TextField("Cast", text: $email)
                        .keyboardType(.emailAddress).autocapitalization(.none)
                        .padding(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("toolbar"))
                        )
                }.padding(.bottom,10)
                VStack{
                    Text("Nationality : ")
                        .underline()
                        .font(.headline)
                        .frame(maxWidth: .infinity , alignment: .leading)
                    TextField("Nationality", text: $email)
                        .keyboardType(.emailAddress).autocapitalization(.none)
                        .padding(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("toolbar"))
                        )
                }.padding(.bottom,10)
                VStack{
                    Text("Place of Birth : ")
                        .underline()
                        .font(.headline)
                        .frame(maxWidth: .infinity , alignment: .leading)
                    TextField("Place of Birth", text: $email)
                        .keyboardType(.emailAddress).autocapitalization(.none)
                        .padding(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("toolbar"))
                        )
                }.padding(.bottom,10)
                VStack{
                    Text("Date of Birth : ")
                        .underline()
                        .font(.headline)
                        .frame(maxWidth: .infinity , alignment: .leading)
                    // date Picker
                    TextField("Place of Birth", text: $email)
                        .keyboardType(.emailAddress).autocapitalization(.none)
                        .padding(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("toolbar"))
                        )
                }.padding(.bottom,10)
                VStack{
                    Text("Place of Birth(in words) : ")
                        .underline()
                        .font(.headline)
                        .frame(maxWidth: .infinity , alignment: .leading)
                    TextField("Place of Birth", text: $email)
                        .keyboardType(.emailAddress).autocapitalization(.none)
                        .padding(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("toolbar"))
                        )
                }.padding(.bottom,10)
                VStack{
                    Text("Last School Attended : ")
                        .underline()
                        .font(.headline)
                        .frame(maxWidth: .infinity , alignment: .leading)
                    TextField("Last School Attended", text: $email)
                        .keyboardType(.emailAddress).autocapitalization(.none)
                        .padding(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("toolbar"))
                        )
                }.padding(.bottom,10)
                VStack{
                    Text("Date of First Admission in College : ")
                        .underline()
                        .font(.headline)
                        .frame(maxWidth: .infinity , alignment: .leading)
                    // datepicker
                    TextField("Name", text: $email)
                        .keyboardType(.emailAddress).autocapitalization(.none)
                        .padding(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("toolbar"))
                        )
                }.padding(.bottom,10)
                VStack{
                    Text("Last Class Attended (eg: B.E I.T : ")
                        .underline()
                        .font(.headline)
                        .frame(maxWidth: .infinity , alignment: .leading)
                    TextField("Class", text: $email)
                        .keyboardType(.emailAddress).autocapitalization(.none)
                        .padding(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("toolbar"))
                        )
                }.padding(.bottom,10)
                VStack{
                    Text("Date of Leaving College : ")
                        .underline()
                        .font(.headline)
                        .frame(maxWidth: .infinity , alignment: .leading)
                    TextField("College", text: $email)
                        .keyboardType(.emailAddress).autocapitalization(.none)
                        .padding(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("toolbar"))
                        )
                }.padding(.bottom,10)
                VStack{
                    Text("Last University Exam Attended (Month , Year) : ")
                        .underline()
                        .font(.headline)
                        .frame(maxWidth: .infinity , alignment: .leading)
                    TextField("University", text: $email)
                        .keyboardType(.emailAddress).autocapitalization(.none)
                        .padding(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("toolbar"))
                        )
                }.padding(.bottom,10)
                VStack{
                    Text("Start Date of Last Year : ")
                        .underline()
                        .font(.headline)
                        .frame(maxWidth: .infinity , alignment: .leading)
                    TextField("Name", text: $email)
                        .keyboardType(.emailAddress).autocapitalization(.none)
                        .padding(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("toolbar"))
                        )
                }.padding(.bottom,10)
                VStack{
                    Text("Reason For Leaving (eg: Passed BE : )")
                        .underline()
                        .font(.headline)
                        .frame(maxWidth: .infinity , alignment: .leading)
                    TextField("Name", text: $email)
                        .keyboardType(.emailAddress).autocapitalization(.none)
                        .padding(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("toolbar"))
                        )
                }.padding(.bottom,10)
                VStack{
                    Text("CGPA Scored : ")
                        .underline()
                        .font(.headline)
                        .frame(maxWidth: .infinity , alignment: .leading)
                    TextField("Name", text: $email)
                        .keyboardType(.emailAddress).autocapitalization(.none)
                        .padding(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color("toolbar"))
                        )
                }.padding(.bottom,10)
                Button {
                    
                } label: {
                    Text("Submit")
                        .bold()
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.indigo)
                        )
                        .foregroundStyle(Color.white)
                }.padding(10)
            }
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity,alignment: .top)
        .padding()
    }
}

#Preview {
    AlumniLeavingCertFormView()
}
