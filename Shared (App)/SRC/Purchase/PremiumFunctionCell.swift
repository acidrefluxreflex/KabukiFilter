//
//  PremiumFunctionCell.swift
//  Eveki
//
//  Created by Kabuki Iwashita on 2023/02/21.
//

import SwiftUI

struct PremiumFunctionCell: View {

    @State private var color: Color
    @State private var title: String
    @State private var text: String
    @State private var systemName: String

    private let size: CGFloat = 40

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
                Image(systemName: systemName)
                    .font(.title2)
                    .foregroundColor(.theme(.BackGround))
                    .frame(width: size, height: size)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(color)
                            .opacity(0.7)
                            .shadow(radius: 3)
                            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10))
                            .overlay(
                                color.opacity(0.5),
                                in: RoundedRectangle(cornerRadius: 10).stroke(style: .init())
                            )

                    )

                Text(title)
                    .font(.title2)
                    .bold()

            }
            Text(text.getAttributedString())
                .font(.caption)
                .foregroundColor(.secondary)

        }
    }
}

struct PremiumFunctionCell_Previews: PreviewProvider {
    static var previews: some View {
        VStack(alignment: .leading) {
            Text(
                "You can use **bold text**, an *italic* text, a [link](apple.com), or `a piece of code`."
            )
            PremiumFunctionCell(
                title: "再設定",
                text:
                    "You can use **bold text**, an *italic* text, a [link](apple.com), or `a piece of code`."
            )
            PremiumFunctionCell(
                title: "キャラを追加",
                text: "関西弁やひかえめ、などより多くのカスタマイズを使用できます")
            PremiumFunctionCell(
                title: "会話を記憶",
                text: "以前行った会話の記憶を保存して引き継ぐ事ができます")
        }.padding()
    }
}
