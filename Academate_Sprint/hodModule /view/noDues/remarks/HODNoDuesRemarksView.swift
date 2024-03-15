//
//  HODNoDuesRemarksView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 15/03/24.
//

import SwiftUI

struct HODNoDuesRemarksView: View {
    var facultyList : [HODFacultyLeavesList] = [HODFacultyLeavesList( facultyName: "", alternateName: "", leaveAppID: 0, leaveID: 0, no_of_days: 1.0, fromDate: "", toDate: "", reason: "", facultyID: 0)]
    var body: some View {
        Text("Remarks :")
            .font(.title)
            .frame(maxWidth: .infinity,alignment: .leading)
            .underline()
            
        ScrollView{
            LazyVStack(alignment: .center, content: {
                ForEach(facultyList) { count in
                    HStack{
                        VStack{
                            Text("Student ID ")
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
                        
                        Button(action: {
                            
                        }) {
                            Image(systemName: "phone")
                                .frame(width: 100, height: 100)
                                .frame(alignment: .center)
                        }
                    }
                    .modifier(CardModifier(paddingValue: 5, backgroundColor: Color(.white), cornerRadius: 10, foregroundColor: Color("toolbar"), font: .title2))
                    .shadow(radius: 5)
                    
                }
            })
        }
    }
}

#Preview {
    HODNoDuesRemarksView()
}
