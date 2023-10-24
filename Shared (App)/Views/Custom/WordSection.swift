//
//  WordSection.swift
//  BlockBadBook
//
//  Created by Kabuki Iwashita on 2023/03/28.
//

import SwiftUI

struct WordSection: View {

    @StateObject private var model = CustomFilterModel()
    @State private var text = ""
    @State private var isShowAlert = false

    private let lc = LocalizeCodes()

    var body: some View {
        VStack {
            DaisyTextField(text: $text, placeholder: "New Word")
                .padding()
            Button("save") {
                if text.count <= 2 {
                    isShowAlert = true
                } else {
                    save()
                }
            }

            List {
                ForEach(model.blockWords, id: \.self) { word in
                    Text(word)
                }.onDelete(perform: delete)
            }.listStyle(.plain)
        }
        .alert("Error", isPresented: $isShowAlert) {
            Text("The word should have at least 3 characters.")
        }
        .navigationTitle(lc.text(.PremiumFunctionSectionTitle1))
    }

    private func save() {
        model.blockWords.append(text)
        text.removeAll()
    }

    private func delete(at offsets: IndexSet) {
        model.blockWords.remove(atOffsets: offsets)
    }

}

struct WordSection_Previews: PreviewProvider {
    static var previews: some View {
        WordSection()
    }
}
