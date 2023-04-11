//
//  PrivacyText.swift
//  Eveki
//
//  Created by Kabuki Iwashita on 2022/11/08.
//

import SwiftUI

struct PrivacyText: View {

    var body: some View {
        VStack(alignment: .center) {

            if let url: URL = URL(string: "https://sites.google.com/view/eveki-termsconditions") {
                Link("TERMS_OF_USE", destination: url)
                    .foregroundColor(.blue)
            }

            if let url: URL = URL(
                string: "https://sites.google.com/view/purefilter/%E3%83%9B%E3%83%BC%E3%83%A0")
            {
                Link("PRIVACY_POLICY", destination: url).foregroundColor(.blue)
            }
            Text("AGREE_POLICY").foregroundColor(.secondary)
        }.font(.caption)
    }
}

struct PrivacyText_Previews: PreviewProvider {
    static var previews: some View {
        PrivacyText()
    }
}
