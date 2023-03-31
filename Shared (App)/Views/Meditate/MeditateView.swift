//
//  MeditateView.swift
//  BlockBadBook
//
//  Created by Kabuki Iwashita on 2023/03/28.
//

import SwiftUI

struct MeditateView: View {
    var body: some View {
        NavigationStack {
            NavigationLink(destination: PanicView()) {
              Text("Panic")
            }
            NavigationLink(destination: ChatView()) {
              Text("Chat")
            }
        }
    }
}

struct MeditateView_Previews: PreviewProvider {
    static var previews: some View {
        MeditateView()
    }
}
