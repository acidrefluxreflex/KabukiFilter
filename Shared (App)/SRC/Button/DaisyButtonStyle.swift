//
//  DaisyButtonStyle.swift
//  PureFilter (iOS)
//
//  Created by Kabuki Iwashita on 2023/03/29.
//

import SwiftUI

enum CustomButtonType {
    case none
    case left
    case right
}


struct DaisyButtonStyle: View {
    @State private var color: Color
    @State private var text: String
    @State private var systemName: String
    @State private var type: CustomButtonType

    init(
        color: Color = .accentColor,
        title: String = "Title",
        text: String = "Hello, World.",
        systemName: String = "",
        type: CustomButtonType = .none
    ) {
        self.color = color
        self.text = text
        self.systemName = systemName
        self.type = type
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .shadow(radius: 5)
                .foregroundColor(color)
                .frame(height: 50)
            HStack {
                switch type {
                case .none:
                    Text(text).bold()
                case .left:
                    Image(systemName: systemName)
                    Text(text).bold()
                case .right:
                    Text(text)
                        .bold()
                        .padding(.horizontal)
                    Image(systemName: systemName)
                }
            }
        }.foregroundColor(.white)
           

    }
}


struct DaisyButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        DaisyButtonStyle()
    }
}
