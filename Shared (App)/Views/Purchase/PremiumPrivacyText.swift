//
//  PremiumPrivacyText.swift
//  Eveki
//
//  Created by Kabuki Iwashita on 2023/02/22.
//

import SwiftUI

struct PremiumPrivacyText: View {

    private let infoHeader =
        "Subscriptions will automatically renew unless canceled within 24-hours before the end of the current period. You can cancel anytime with your iTunes account settings.For more information, see these pages"
        .localized

    private let lc = LocalizeCodes()

    private let info = "INFO"

    var body: some View {
        VStack(alignment: .center) {

            Text(lc.text(.SubscriptionInfo))
                .padding(.bottom, 4)
                .foregroundColor(.gray)

            if let url = URL(string: "https://sites.google.com/view/eveki-termsconditions") {
                Link("TERMS_OF_USE".localized, destination: url)
                    .foregroundColor(.blue)
            }

            if let url = URL(string: "https://medit.themedia.jp/pages/5574836/privacy") {
                Link("PRIVACY_POLICY".localized, destination: url).foregroundColor(.blue)
            }
        }.font(.caption)
    }
}

struct PremiumPrivacyText_Previews: PreviewProvider {
    static var previews: some View {
        PremiumPrivacyText()
    }
}
