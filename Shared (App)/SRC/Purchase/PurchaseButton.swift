//
//  PurchaseButton.swift
//  Eveki
//
//  Created by Kabuki Iwashita on 2023/02/22.
//

import SwiftUI

struct PurchaseButton: View {

    private let lc = LocalizeCodes()

    @State private var action: () -> Void

    init(action: @escaping () -> Void = {}) {
        self.action = action
    }

    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Rectangle()
                    .foregroundColor(.theme(.BackGround))
                    .frame(height: 230)
                    .opacity(0.9)
                    .shadow(radius: 3)

                VStack {
                    Button(
                        action:
                            action
                    ) {
                        DaisyButtonStyle(
                            color: .orange,
                            text: lc.text(.Subscribe)
                        )
                        .bold()
                        .padding(.horizontal)
                    }
                    PremiumPrivacyText()
                        .padding(.horizontal)
                }.padding(.bottom)

            }
        }.ignoresSafeArea()
    }
}

struct PurchaseButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            ScrollView {
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(height: 900)
                    .ignoresSafeArea()
            }
            PurchaseButton()
        }
    }
}
