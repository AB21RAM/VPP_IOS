//
//  AlumniApplicationCard.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 13/03/24.
//

import SwiftUI

struct AlumniApplicationStatusCard: View {
    var name : String
    var ID : String
    var passing_year : String
    var Email : String
    var body: some View {
        HStack{
            
            // Display placeholder when URL string is empty
            Image(systemName: "person.crop.rectangle.stack")
                .resizable()
                .frame(width: 110, height: 120)
                .shadow(radius: 10)
                .frame(maxWidth: .infinity, alignment: .leading)
                .aspectRatio(contentMode: .fit)
                .padding(.trailing, 10)
            
            
            VStack{
                Text("Name"/*viewmodel.profileDataModel.Name*/)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                //                            .font(.custom("new", fixedSize: 20))
                    .bold()
                Text("ID"/*viewmodel.profileDataModel.idNo*/)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                Text("Passing Year "/*viewmodel.profileDataModel.year*/)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                    .bold()
                Text("Email")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.caption)
            }
            .foregroundStyle(Color("toolbar"))
            .frame(maxWidth: .infinity, alignment: .leading)
            //                    .background(.blue)
        }
        .modifier(CardModifier(paddingValue: 15, backgroundColor: Color(.white), cornerRadius: 10, foregroundColor: Color("toolbar"), font: .title3))
        .frame(maxWidth: .infinity, alignment: .leading)
        //                .frame(width: 390,height: 200)
        .shadow(radius: 5)
    }
}

#Preview {
    AlumniApplicationStatusCard(name: "Name", ID: "ID", passing_year: "1212", Email: "jwbkjb")
}
