//
//  NewsView.swift
//  Eveki
//
//  Created by Kabuki Iwashita on 2023/03/22.
//

import SwiftUI

struct NewsView: View {

    @StateObject private var controller = NewsViewController()
    private let lc = LocalizeCodes()

    var body: some View {
        VStack(alignment: .leading, spacing: 1) {
            if !filterByLanguage().isEmpty {
                Text("News")

                    .bold()
                    .font(.title2)

                VStack {

                    NewsContent(model: filterByLanguage().first!)
                        .transition(.opacity)
                }
            } else {
                EmptyView()
            }

        }.onAppear {
            withAnimation {
                print("load")
                controller.load()
            }
        }.padding()

    }

    private func filterByLanguage() -> [NewsModel] {
        let language = lc.text(.Language)
        let data = controller.data
        return data.filter { $0.language == language }
    }

}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}
