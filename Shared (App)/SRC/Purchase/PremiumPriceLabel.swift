//
//  PremiumPriceLabel.swift
//  Eveki
//
//  Created by Kabuki Iwashita on 2023/02/21.
//

import SwiftUI

struct PremiumPriceLabel: View {

    private let lc = LocalizeCodes()
    @State private var color: Color = .secondary

    var body: some View {
        ZStack {

            VStack {

                HStack {
                    Text(lc.text(.MasterPrice))
                        .bold()
                        .font(.title2)
                    Spacer()
                    Text(lc.text(.PlanEnjoy))
                        .font(.caption)
                        .bold()
                        .foregroundColor(.accentColor)
                        .padding(.top)
                }.padding()
                    .background(
                        backgroundShape()
                    )
            }
            Image("2cup")
                .resizable()
                .shadow(radius: 4)
                .frame(width: 130, height: 130)
                .offset(x: 100, y: -50)
        }.frame(height: 100)

    }

    private func backgroundShape() -> some View {
        RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.theme(.ThemeGray))
            .opacity(0.7)
            .shadow(radius: 3)
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 10))
            .overlay(
                color.opacity(0.5),
                in: RoundedRectangle(cornerRadius: 10)
                    .stroke(style: .init())
            )

    }
}

struct PremiumPriceLabel_Previews: PreviewProvider {
    static var previews: some View {
        PremiumPriceLabel()
            .padding()
    }
}
