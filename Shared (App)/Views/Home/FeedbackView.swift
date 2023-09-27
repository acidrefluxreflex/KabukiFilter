//
//  FeedbackView.swift
//  Eveki
//
//  Created by Kabuki Iwashita on 2023/01/16.
//

import StoreKit
import SwiftUI

struct FeedbackView: View {

    private let lc = LocalizeCodes()
    @StateObject private var model = FeedBackModel()

    @State private var isShowAlert = false
    @StateObject private var repo = FireStoreRepositry()

    var body: some View {
        VStack {
            FeedbackStar(rating: $model.rating)
                .font(.title)
                .padding()
            VStack(alignment: .leading) {
                DaisyTextField(
                    text: $model.name,
                    placeholder: "Title")
            }.padding(.bottom)
            VStack(alignment: .leading) {

                DaisyTextField(
                    text: $model.text,
                    placeholder: "Body",
                    height: 150)
            }
            Button(action: {
                pushButton()
            }) {
                DaisyButtonStyle(text: lc.text(.Send))
            }.padding()
                .alert(
                    lc.text(.ThanksReport),
                    isPresented: $isShowAlert
                ) {
                    Button(lc.text(.Close)) {
                        pleaseReview()
                    }
                } message: {
                    Text("Thank you!")
                }
                .disabled(model.text.isEmpty)
        }.padding(.horizontal)
            .padding()
            .navigationTitle("Feedback")
    }

    func pushButton() {
        repo.sendFeefback(model)
        isShowAlert.toggle()
    }

    func pleaseReview() {
        if model.rating >= 4 {
            if let scene = UIApplication.shared.connectedScenes.first(where: {
                $0.activationState == .foregroundActive
            }) as? UIWindowScene {
                SKStoreReviewController.requestReview(in: scene)
            }
        }
    }
}

struct FeedbackView_Previews: PreviewProvider {
    static var previews: some View {
        FeedbackView()
    }
}
