//
//  HODNoDuesAllAppView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 15/03/24.
//

import SwiftUI

struct HODNoDuesAllAppView: View {
    @State private var isExpanded = false
    @State private var email = ""
    var facultyList : [HODFacultyLeavesList] = [HODFacultyLeavesList( facultyName: "", alternateName: "", leaveAppID: 0, leaveID: 0, no_of_days: 1.0, fromDate: "", toDate: "", reason: "", facultyID: 0),HODFacultyLeavesList( facultyName: "", alternateName: "", leaveAppID: 0, leaveID: 0, no_of_days: 1.0, fromDate: "", toDate: "", reason: "", facultyID: 0)]
    @State private var isExpandedArray: [Bool]
        // Common Method for expanding the Indexed item
    init() {
        // Here Need to add the direct Reponse coming form the viewmodel
        
            self.facultyList = [HODFacultyLeavesList( facultyName: "Atharv", alternateName: "", leaveAppID: 0, leaveID: 0, no_of_days: 1.0, fromDate: "", toDate: "", reason: "", facultyID: 0),HODFacultyLeavesList( facultyName: "Vishal", alternateName: "", leaveAppID: 0, leaveID: 0, no_of_days: 1.0, fromDate: "", toDate: "", reason: "", facultyID: 0)]
            let initialExpansionState = Array(repeating: false, count: facultyList.count)
            _isExpandedArray = State(initialValue: initialExpansionState)
        }
    
    var body: some View {
        ScrollView{
            LazyVStack(alignment: .center, content: {
                ForEach(facultyList.indices, id: \.self) { index in
                    VStack{
                        HStack{
                            VStack{
                                Text(facultyList[index].facultyName)
                                    .font(.headline)
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                Text("Name")
                                    .bold()
                                    .font(.title2)
                                    .multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity,alignment: .leading)
                                Text("Department ")
                                    .font(.headline)
                                    .frame(maxWidth: .infinity,alignment: .leading)
                            }
                            
                            .frame(maxWidth: .infinity,alignment: .leading)
                            VStack{
                                Button(action: {
                                    // Make Appropriate API call
                                }) {
                                    Text("Accept")
//                                        .frame(width: .infinity)
                                        .bold()
                                        .padding(10)
                                        .background(
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color.green)
                                        )
                                        .font(.callout)
                                        .foregroundStyle(Color.white)
                                }
                                Button(action: {
                                    // Make Appropriate API call
                                }) {
                                    Text("Decline")
//                                        .frame(width: .infinity)
                                        .bold()
                                        .padding(10)
                                        .background(
                                            RoundedRectangle(cornerRadius: 10)
                                                .fill(Color.red)
                                        )
                                        .font(.callout)
                                        .foregroundStyle(Color.white)
                                }
                                Button(action: {
                                    // Make Appropriate API call
                                    withAnimation {
                                        self.isExpandedArray[index].toggle()
                                    }
                                }) {
                                    if !isExpandedArray[index] {
                                        Image(systemName: "arrow.down.backward.and.arrow.up.forward.square.fill")
                                            .padding(2)
                                            .foregroundStyle(Color.blue)
                                    } else {
                                        Image(systemName: "arrow.down.right.and.arrow.up.left.square.fill")
                                            .padding(2)
                                            .foregroundStyle(Color.orange)
                                    }
                                }
                            }
                        }
                        if isExpandedArray[index] {
                            HStack{
                                Image(systemName: "person.crop.rectangle.stack")
                                    .resizable()
                                    .frame(width: 110, height: 120)
                                    .shadow(radius: 10)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .aspectRatio(contentMode: .fit)
                                VStack{
                                    Text("Remark : ")
                                        .underline()
                                        .font(.headline)
                                        .frame(maxWidth: .infinity , alignment: .leading)
                                    TextField("Remark", text: $email)
                                        .keyboardType(.emailAddress).autocapitalization(.none)
                                        .padding(15)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 10)
                                                .stroke(Color("toolbar"))
                                        )
                                    Button(action: {
                                        // Make Appropriate API call
                                    }) {
                                        Text("Submit")
                                            .frame(maxWidth: .infinity)
                                            .bold()
                                            .padding(10)
                                            .background(
                                                RoundedRectangle(cornerRadius: 10)
                                                    .fill(Color.blue)
                                            )
                                            .font(.callout)
                                            .foregroundStyle(Color.white)
                                    }
                                }.padding(.bottom,10)
                            }.transition(.scale)
                        }
                    }
                    .modifier(CardModifier(paddingValue: 15, backgroundColor: Color(.white), cornerRadius: 10, foregroundColor: Color("toolbar"), font: .title2))
                    .shadow(radius: 5)
                }
            })
        }
    }
}

#Preview {
    ScrollView{
        LazyVStack{
//            HODNoDuesAllAppView(facultyList: [HODFacultyLeavesList( facultyName: "", alternateName: "", leaveAppID: 0, leaveID: 0, no_of_days: 1.0, fromDate: "", toDate: "", reason: "", facultyID: 0),HODFacultyLeavesList( facultyName: "", alternateName: "", leaveAppID: 0, leaveID: 0, no_of_days: 1.0, fromDate: "", toDate: "", reason: "", facultyID: 0)])
            HODNoDuesAllAppView()
//            HODNoDuesAllAppView()
//            HODNoDuesAllAppView()
//            HODNoDuesAllAppView()
//            HODNoDuesAllAppView()
//            HODNoDuesAllAppView()
//            HODNoDuesAllAppView()
        }
    }
}
