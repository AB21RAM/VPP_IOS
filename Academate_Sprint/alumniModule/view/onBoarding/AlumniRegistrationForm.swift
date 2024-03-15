//
//  AlumniRegistrationForm.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 13/03/24.
//

import SwiftUI

struct AlumniRegistrationForm: View {
    @State var email : String = ""
    var body: some View {
        VStack{
            Text("Registration")
                .font(.largeTitle)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("toolbar"))
                )
            TextField("Email", text: $email)
                .keyboardType(.emailAddress).autocapitalization(.none)
                .padding(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("toolbar"))
                )
            TextField("College ID", text: $email)
                .keyboardType(.emailAddress).autocapitalization(.none)
                .padding(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("toolbar"))
                )
            TextField("Name", text: $email)
                .keyboardType(.emailAddress).autocapitalization(.none)
                .padding(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("toolbar"))
                )
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("toolbar"))
                )
            TextField("Contact", text: $email)
                .keyboardType(.emailAddress).autocapitalization(.none)
                .padding(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("toolbar"))
                )
            TextField("Branch", text: $email)
                .keyboardType(.emailAddress).autocapitalization(.none)
                .padding(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("toolbar"))
                )
            TextField("Year Of passing", text: $email)
                .keyboardType(.emailAddress).autocapitalization(.none)
                .padding(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("toolbar"))
                )
            TextField("Password", text: $email)
                .keyboardType(.emailAddress).autocapitalization(.none)
                .padding(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("toolbar"))
                )
            Button {
                
            } label: {
                Text("Register")
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
        
        .padding(15)
        .frame(maxWidth: .infinity, maxHeight: .infinity,alignment: .top)
        .background(Color("background"))
//        .edgesIgnoringSafeArea(.all)
//        .toolbar(content: {
//            Text("Registration")
//        })
    }
}

#Preview {
    AlumniRegistrationForm()
}
