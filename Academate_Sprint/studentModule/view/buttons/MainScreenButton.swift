//
//  MainScreenButton.swift
//  Academate_Sprint
//
//  Created by Sanjaykumar Bhosale  on 28/01/24.
//

import SwiftUI

struct MainScreenButton: View {
    var image : String
    var text : String
    var cardbackground : Color
    var textColor : Color
    var imageBackground : Color
    var body: some View {
        VStack{
            Image(image)
                .padding(10)
                .background(imageBackground)
                .clipShape(.rect(cornerRadius: 15))
            Text(text)
//                .multilineTextAlignment(.center)
                .foregroundStyle(textColor)
                .font(.caption)
        }
        .frame(width: 85,height: 75)
        .padding(10)
        .background(cardbackground)
        .clipShape(.rect(cornerRadius: 15))
    }
}

#Preview {
    MainScreenButton(image: "profile_dark", text: "All Applications", cardbackground: Color("toolbar"), textColor: .white, imageBackground: .white)
}
