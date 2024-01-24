//
//  StudentHomeView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 25/01/24.
//

import SwiftUI

struct StudentHomeView: View {
    @ObservedObject var viewmodel = StudentHomeViewModel()
    let userDefaultsManager = UserDefaultsManager.shared
    var body: some View {
        VStack{
            Text("Student Name : \(viewmodel.homeDataModel.Name)")
            Text("Student Contact : \(viewmodel.homeDataModel.ContactNumber)")
            Button(
                action: {
                    // do something
                    userDefaultsManager.setIsLoggedIn(false)
                },
                label: { Image(systemName: "rectangle.portrait.and.arrow.right")
                        .resizable()
                        .frame(width: 50,height: 50)
                    .foregroundColor(.black) }
            )
        }
        
    }
}

#Preview {
    StudentHomeView()
}
