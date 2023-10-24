//
//  TextButtonStyle.swift
//  KabukiFilter
//
//  Created by Kabuki Iwashita on 2023/04/01.
//

import SwiftUI

struct TextButtonStyle: View {

    @State private var color: Color
    @State private var title: String
    @State private var text: String
    @State private var systemName: String

    init(
        color: Color = .accentColor,
        title: String = "Title",
        text: String = "Hello, World.",
        systemName: String = "key.fill"
    ) {
        self.color = color
        self.title = title
        self.text = text
        self.systemName = systemName
    }

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 5)
                        .frame(width: 30, height: 30)
                        .foregroundColor(color)
                    Image(systemName: systemName)
                        .font(.body)
                        .foregroundColor(.white)

                }
                Text(title)
                    .bold()
                    .font(.title3)
                
                Spacer()
            }
            Text(text)
                .font(.caption)
                .foregroundColor(.gray)

        }  //.padding()
        .buttonStyle(.plain)
    }
}

struct TextButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        TextButtonStyle()
            .padding()
    }
}
