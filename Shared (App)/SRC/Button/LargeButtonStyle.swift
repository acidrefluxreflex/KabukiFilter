//
//  LargeButtonStyle.swift
//  KabukiFilter
//
//  Created by Kabuki Iwashita on 2023/09/29.
//

import SwiftUI

struct LargeButtonStyle: View {
    
    @State private var color: Color
    @State private var text: String
    @State private var systemName: String
   
    private let size: CGFloat = 100

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
            Text(text)
                .font(.callout)
            Image(systemName: systemName)
                .font(.largeTitle)
                .frame(width: size - 40, height: size - 40)
        }.frame(width: size, height: size * 1.12)
        .foregroundColor(.white)
        .background(
            RoundedRectangle(cornerRadius: 10)
        )
    }
}

struct LargeButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        LargeButtonStyle()
    }
}
