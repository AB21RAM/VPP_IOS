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
    func dateFormatter(date : String) -> String {
        let isoDateFormatter = ISO8601DateFormatter()
        isoDateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        let date = isoDateFormatter.date(from: date)
        let formattedDate = DateFormatter.localizedString(from: date ?? Date(), dateStyle: .medium, timeStyle: .none)
        let substring = String(formattedDate.prefix(12))
        return substring
    }
    var body: some View {
        HStack{
            Text(dateFormatter(date: date))
                .font(.caption2)
                .frame(width: 50,height: 50)
                .padding(10)
                .background(RoundedRectangle(cornerRadius: 20).fill(Color.white))
                .padding(.leading,10)
            
            if pIn == pOut{
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
                    .hidden()
            }else{
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
            
        }
        .frame(maxWidth: 350)
        .frame(height: 100)
        .frame(alignment: .leading)
        .background(RoundedRectangle(cornerRadius: 20)
            .fill(LinearGradient(gradient: Gradient(colors: [Color.indigo, Color("grayLight")]), startPoint: .leading, endPoint: .trailing)))
    }
}

#Preview {
    PunchRecordCard(date: "1", pIn: "1", pOut: "11")
}
