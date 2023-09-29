//
//  CircleButtonStyle.swift
//  KabukiFilter
//
//  Created by Kabuki Iwashita on 2023/09/29.
//

import SwiftUI

struct CircleButtonStyle: View {
    
    @State private var color: Color
    @State private var text: String
    @State private var systemName: String
   
    private let size: CGFloat = 65

    init(
        color: Color = .accentColor,
        text: String = "Hello",
        systemName: String = "key.fill"
    ) {
        self.color = color
        self.text = text
        self.systemName = systemName
    }
    
    
    var body: some View {
        VStack {
            Image(systemName: systemName)
                .foregroundColor(color)
                .font(.title)
                .frame(width: size - 30, height: size - 30)
                .foregroundColor(.white)
                .background(
                    Circle()
                        .frame(width: size, height: size)
                        .foregroundColor(.theme(.ThemeGray))
                )
                .frame(width: size, height: size)
            Text(text)
                .font(.caption)
        }
    }
}

struct CircleButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                CircleButtonStyle(text: "Contact", systemName: "envelope")
                CircleButtonStyle(text: "Hint", systemName: "questionmark")
                CircleButtonStyle(text: "Web", systemName: "globe")
                CircleButtonStyle(text: "Web", systemName: "globe")
                CircleButtonStyle(text: "Web", systemName: "globe")
            }.padding()
        }
    }
}
