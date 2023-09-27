//
//  NewsContent.swift
//  Eveki
//
//  Created by Kabuki Iwashita on 2023/03/22.
//

import SwiftUI

struct NewsContent: View {

    @State private var model: NewsModel

    private let size: CGFloat = 330

    init(model: NewsModel = NewsModel()) {
        self.model = model
    }

    var body: some View {

        VStack(alignment: .center, spacing: 5) {
            NewsImage(size: size)
                .padding(.bottom, 2)
                .cornerRadius(5)
                .shadowedStyle()
            HStack(spacing: 5) {
                Rectangle().frame(width: 5, height: 20)
                    .foregroundColor(.accentColor)
                Text(model.title)
                    .fontWeight(.medium)
                Spacer()
            }
            HStack {
                Text(model.body)
                    .font(.caption)
                Spacer()
            }
            HStack {
                Image(systemName: "clock")
                Text(model.date.dateValue().formatted(.dateTime.day().month()))
                Spacer()
            }.font(.caption)
                .foregroundColor(.secondary)

        }.padding()
            .background(
                Color.theme(.ThemeGray)
                    .cornerRadius(8)
            )
    }
}

struct NewsContent_Previews: PreviewProvider {
    static var previews: some View {
        NewsContent()
            .padding()
    }
}
