//
//  EmailCheck.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 13/03/24.
//

import SwiftUI

struct EmailCheck: View {
    @State var email : String = ""
    @State var available : Bool = false
    var body: some View {
        VStack{
            Text("Check Your Email")
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
                .padding(.top,10)
            Button {
//                if available{
//                    NavigationLink("") {
//                        AlumniRegistrationForm()
//                    }
//                }else{
//                    NavigationLink("") {
//                        AlumniRegistrationForm()
//                    }
//                }
            } label: {
                Text("Check Email").bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.indigo)
                    )
                    .foregroundStyle(Color.white)
                   
            }
            .padding(.top,10)
//            .frame(maxWidth: .infinity)
            
        }
        .padding(15)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color("background"))
//        .edgesIgnoringSafeArea(.top)
//        .toolbar(content: {
//            Text("Tetx")
//        })
        
    }
}

#Preview {
    EmailCheck()
}
