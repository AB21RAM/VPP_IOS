//
//  HODVisitorView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 14/03/24.
//

import SwiftUI

struct HODVisitorView: View {
    @State private var isExpanded = false
    var facultyList : [HODFacultyLeavesList] = [HODFacultyLeavesList( facultyName: "", alternateName: "", leaveAppID: 0, leaveID: 0, no_of_days: 1.0, fromDate: "", toDate: "", reason: "", facultyID: 0)]
    var body: some View {
        ScrollView{
            LazyVStack(alignment: .center, content: {
                ForEach(facultyList) { count in
                    VStack{
                        HStack{
                            VStack{
                                Text("Faculty ID ")
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
                                        self.isExpanded.toggle()
                                    }
                                }) {
                                    if !isExpanded{
//                                        Label("More", systemImage: "plus")
                                        Image(systemName: "arrow.down.backward.and.arrow.up.forward.square.fill")
                                            .padding(2)
                                            .foregroundStyle(Color.blue)
//                                            .transition(.opacity)
                                    }else{
                                        Image(systemName: "arrow.down.right.and.arrow.up.left.square.fill")
//                                            .padding(.top ,8)
                                            .padding(2)
                                            .foregroundStyle(Color.orange)
                                    }
                                   
                                }
                            }
                        }
                        if  isExpanded{
                            HStack{
                                Image(systemName: "person.crop.rectangle.stack")
                                    .resizable()
                                    .frame(width: 110, height: 120)
                                    .shadow(radius: 10)
                                    .frame(maxWidth: .infinity, alignment: .center)
                                    .aspectRatio(contentMode: .fit)
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
    HODVisitorView()
}
