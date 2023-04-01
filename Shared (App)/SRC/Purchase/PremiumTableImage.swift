//
//  PremiumTableImage.swift
//  Eveki
//
//  Created by Kabuki Iwashita on 2023/02/22.
//

import SwiftUI


struct PremiumTableImage: View {

    @State private var size: CGFloat
    private let radius: CGFloat = 10

    private let lc = LocalizeCodes()

    init(size: CGFloat = 300) {
        self.size = size
    }

    var body: some View {
        Image(lc.text(.PremiumTableImage))
            .resizable()
            .frame(width: size, height: size * 1.334)
            .cornerRadius(radius)
            //.shadow(radius: 5)
            .overlay(
                RoundedRectangle(cornerRadius: radius)
                    .stroke(.primary, lineWidth: 3)
            )

    }
}

struct PremiumTableImage_Previews: PreviewProvider {
    static var previews: some View {
        PremiumTableImage()
    }
}

