//
//  HomeView.swift
//  PureFilter
//
//  Created by Kabuki Iwashita on 2023/03/29.
//

import SwiftUI

struct HomeView: View {

    private let lc = LocalizeCodes()

    var body: some View {

        VStack {
            TimerView()
                .frame(height: 200)
            VStack {
                ScrollView(.horizontal) {
                    HStack(spacing: 20) {
                        CircleButtonStyle(text: "Contact", systemName: "envelope")
                        CircleButtonStyle(text: "Hint", systemName: "lightbulb")
                        CircleButtonStyle(text: "Web", systemName: "globe")
                        CircleButtonStyle(text: "Web", systemName: "list.clipboard")
                        CircleButtonStyle(text: "Web", systemName: "star")
                    }.padding()
                }
                HStack {
                    Text("Info")
                        .font(.title)
                        .bold()

                    Spacer()
                }.padding(.horizontal)
                    .padding(.top)
            
                PremiumButton()
                    
                    .padding(.horizontal)

                NewsView()

                

                Spacer()
            }

        }
    }

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
