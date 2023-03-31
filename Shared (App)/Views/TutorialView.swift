//
//  TutorialView.swift
//  BlockBadBook (iOS)
//
//  Created by Kabuki Iwashita on 2023/03/26.
//

import SwiftUI

struct TutorialView: View {
    var body: some View {
        VStack {
            AppleAuthButton()
                .padding()
            GoogleAuthButton()
                .padding()
        }
    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
