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
                        
                        NavigationLink(destination: HelpView()) {
                            CircleButtonStyle(text: "Hint", systemName: "lightbulb")
                        }

                        NavigationLink(destination: MeditateView()) {
                            CircleButtonStyle(text: "Contact", systemName: "envelope")
                        }

                        NavigationLink(destination: SettingView()) {
                            CircleButtonStyle(text: "Survey", systemName: "list.clipboard")
                        }
                        
                       

                        NavigationLink(destination: NewsView()) {
                            CircleButtonStyle(text: "WebSite", systemName: "globe")
                        }

                        

                        NavigationLink(destination: SettingView()) {
                            CircleButtonStyle(text: "Review", systemName: "star")
                        }

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
        NavigationView {
            HomeView()
        }
    }
}
