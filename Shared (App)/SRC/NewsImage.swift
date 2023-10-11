//
//  NewsImage.swift
//  Eveki
//
//  Created by Kabuki Iwashita on 2023/04/14.
//

import Kingfisher
import SwiftUI

struct NewsImage: View {

    @State private var image: String
    @State private var size: CGFloat

    init(
        image: String = "",
        size: CGFloat = 128
    ) {
        self.image = image
        self.size = size
    }

    var body: some View {
        if image.isEmpty {
            Image("Neat Work Desk Tumblr Banner")
                .resizable()
                .frame(width: size, height: size / 2.843)
                .cornerRadius(5)
        } else {
            KFImage.url(URL(string: image))
                .resizable()
                .frame(width: size, height: size / 2.843)
                .cornerRadius(5)
        }
    }
}

struct NewsImage_Previews: PreviewProvider {

    @State static var size: CGFloat = 350

    static var previews: some View {
        VStack {
            NewsImage(size: size)
            Slider(value: $size)
        }
    }
}
