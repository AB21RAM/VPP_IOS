//
//  PunchRecordCard.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 05/03/24.
//

import SwiftUI

struct PunchRecordCard: View {
    var date : String
    var pIn : String
    var pOut : String
    // Parameters To Be Add
    var body: some View {
        HStack{
            Text(date)
                
                .frame(width: 50,height: 50)
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .padding(.leading,10)
            
            
            VStack{
                Text("Punch In")
                    .bold()
                Text(pIn)
            }.padding()
            
            VStack{
                Text("Punch Out")
                    .bold()
                Text(pOut)
            }.padding()
        }
        .frame(maxWidth: 350)
        .frame(height: 100)
        .frame(alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 20).fill(Color("grayLight")))
    }
}

#Preview {
    PunchRecordCard(date: "1", pIn: "1", pOut: "11")
}
