//
//  SwiftUIView.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 14/03/24.
//

import SwiftUI

struct HODCountView: View {
    var body: some View {
        VStack{
            Text("Present Faculty Count : ")
                .bold()
                .frame(maxWidth : .infinity,alignment: .leading)
            Text("00") // add the count Here
                .font(.title)
                .frame(maxWidth : .infinity,alignment: .leading)
        }.modifier(CardModifier(paddingValue: 15, backgroundColor: Color(.white), cornerRadius: 10, foregroundColor: Color("toolbar"), font: .title2))
            .frame(maxWidth: .infinity, alignment: .leading)
            //                .frame(width: 390,height: 200)
            .shadow(radius: 5)
    }
}

#Preview {
    HODCountView()
}
