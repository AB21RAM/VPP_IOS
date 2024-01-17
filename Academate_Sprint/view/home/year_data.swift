//
//  year_data.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 15/01/24.
//

import SwiftUI

struct year_data: View {
    var year : String
    var count : String
    var body : some View {
        RoundedRectangle(cornerRadius: 10)
                   .fill(Color.white)
                   .frame(width: 200, height: 150)
                   .overlay(
                       VStack {
                           Text(year)
                               .font(.headline)
                               .padding()

                           Spacer()

                           Text(count)
                               .foregroundColor(Color.black)
                               .padding()

                           Spacer()
                       }
                   )
                   .shadow(radius: 5)

    }
}

struct year_data_Previews: PreviewProvider {
    static var previews: some View {
        year_data(year: "first",count: "20")
    }
}
