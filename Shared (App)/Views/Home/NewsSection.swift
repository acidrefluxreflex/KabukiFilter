//
//  NewsSection.swift
//  BlockBadBook (iOS)
//
//  Created by Kabuki Iwashita on 2023/03/28.
//

import SwiftUI

struct NewsSection: View {
    var body: some View {
        VStack {
           NewsContent()
                .padding()
        }
    }
}

struct NewsSection_Previews: PreviewProvider {
    static var previews: some View {
        NewsSection()
    }
}
