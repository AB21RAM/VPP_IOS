//
//  year_data.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 15/01/24.
//

import SwiftUI

struct RoundedRectBox: View {
    var year : String
    var count : String
    var width : CGFloat
    var height : CGFloat
    var body : some View {
        RoundedRectangle(cornerRadius: 20)
                   .fill(Color.white)
                   .frame(width: width, height: height)
                   .overlay(
                       VStack {
                           Text(year)
                               .font(.title2)
                               .foregroundColor(Color.black)
                               .frame(maxWidth: CGFloat.infinity,alignment: .leading)
                               .padding(.leading,20)
                           Text(count)
                               .font(.title)
                               .foregroundColor(Color.black)
                               .frame(maxWidth: CGFloat.infinity,alignment: .leading)
                               .padding(.leading,20)
                               .padding(.top,10)
                       }
                   )
                   .shadow(radius: 10)

    }
}

struct year_data_Previews: PreviewProvider {
    static var previews: some View {
        RoundedRectBox(year: "first",count: "20",width: 50,height: 50)
    }
}
