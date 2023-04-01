//
//  RestoreButton.swift
//  AppleSample (iOS)
//
//  Created by Kabuki Iwashita on 2022/06/30.
//

import SwiftUI

struct RestoreButton: View {

    let lc = LocalizeCodes()
    @State private var isShowConfirm: Bool = false
    @StateObject private var model = PaymentModel()

    var body: some View {
        Button("RESTORE") {
            isShowConfirm.toggle()
        }.confirmationDialog(
            "RESTORE",
            isPresented: $isShowConfirm
        ) {
            Button(lc.text(.MasterPlan)) {
                model.masterRestore()
            }

        }
    }
}

struct RestoreButton_Previews: PreviewProvider {
    static var previews: some View {
        RestoreButton()
    }
}
