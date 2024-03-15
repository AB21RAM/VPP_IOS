//
//  SwiftUIView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 14/03/24.
//

import SwiftUI

struct HODFacultyListView: View {
    var facultyList : [HODFacultyLeavesList] = [HODFacultyLeavesList( facultyName: "", alternateName: "", leaveAppID: 0, leaveID: 0, no_of_days: 1.0, fromDate: "", toDate: "", reason: "", facultyID: 0)]
    var body: some View {
        ScrollView{
            LazyVStack(alignment: .center, content: {
                ForEach(facultyList) { count in
                    SingleFacultyView()
                    
                }
            })
        }
    }
}
struct SingleFacultyView : View {
    let phoneNumber = "1234567890"
    var body: some View {
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
            
            Button(action: {
                            guard let url = URL(string: "tel://\(phoneNumber)") else { return }
                            UIApplication.shared.open(url)
                        }) {
                            Image(systemName: "phone")
                                .frame(width: 100, height: 100)
                                .frame(alignment: .center)
                        }
        }
        .modifier(CardModifier(paddingValue: 15, backgroundColor: Color(.white), cornerRadius: 10, foregroundColor: Color("toolbar"), font: .title2))
        .shadow(radius: 5)
    }
}
#Preview {
    HODFacultyListView()
}
