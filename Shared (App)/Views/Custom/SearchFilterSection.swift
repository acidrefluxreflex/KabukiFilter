//
//  SearchFilterSection.swift
//  PureFilter (iOS)
//
//  Created by Kabuki Iwashita on 2023/03/30.
//

import SwiftUI

struct SearchFilterSection: View {
    
    @StateObject private var model = CustomFilterModel()
    @State private var text = ""
    @State private var isShowAlert = false
    
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
                ForEach(model.blurSites, id: \.self) { word in
                    Text(word)
                } .onDelete(perform: delete)
            }.listStyle(.plain)
        }
        .alert("Error", isPresented: $isShowAlert) {
            Text("The word should have at least 3 characters.")
        }
    }
    
    private func save() {
        model.blurSites.append(text)
        text.removeAll()
    }
    
    private func delete(at offsets: IndexSet) {
        model.blurSites.remove(atOffsets: offsets)
      }
}

struct SearchFilterSection_Previews: PreviewProvider {
    static var previews: some View {
        SearchFilterSection()
    }
}
