//
//  PremiumButton.swift
//  Eveki
//
//  Created by Kabuki Iwashita on 2023/02/28.
//

import IrregularGradient
import SwiftUI

struct PremiumButton: View {

    private let lc = LocalizeCodes()
    @StateObject private var manager = PaymentStateManager()

    var body: some View {
        NavigationLink(destination: PurchaseView()) {
            ZStack {
                if manager.isUserSubscribed {
                    EmptyView()
                } else {
                    RoundedRectangle(cornerRadius: 15)
                        .shadow(radius: 5)
                        .foregroundColor(.theme(.ThemeBlack))
                        .frame(height: 100)
                    Text(lc.text(.UpgradePlan))
                        .font(.largeTitle)
                        .irregularGradient(
                            colors: [.orange, .pink, .yellow, .orange, .pink, .yellow],
                            background: Color.white
                        )
                        .fontWeight(.heavy)

                }
            }
        }.onAppear {
            manager.checkUserSubscribed()
        }
    }
}

struct PremiumButton_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            PremiumButton()
                .padding()
        }
    }
}

class PaymentStateManager: PaymentModel {

    let defaults = UserDefaults.standard

    func load() {
        if defaults.string(forKey: defaultsKey) != nil {
            self.isPurchase = true
        } else {
            self.isPurchase = false
        }
    }

}
