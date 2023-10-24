//
//  TutorialView.swift
//  BlockBadBook (iOS)
//
//  Created by Kabuki Iwashita on 2023/03/26.
//

import SwiftUI

struct TutorialView: View {

    @Environment(\.dismiss) private var dismiss: DismissAction
    @ObservedObject var manager = LoginManeger()

    var body: some View {
        ScrollView {
            HelpView()
                .padding(.bottom)
            Button("Skip") {
                dismiss()
            }.padding(.bottom)
            AppleAuthButton(manager: manager)
                .padding(.horizontal)
                .padding(.horizontal)

            GoogleAuthButton(manager: manager)
                .padding()
                .padding(.horizontal)
            PrivacyText()
                .padding(.horizontal)
            Spacer()
        }.onChange(of: manager.isLogin) { _ in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                manager.registerUser()
            }
            dismiss()
        }

    }
}

struct TutorialView_Previews: PreviewProvider {
    static var previews: some View {
        TutorialView()
    }
}
