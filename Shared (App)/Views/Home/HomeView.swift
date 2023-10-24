//
//  HomeView.swift
//  PureFilter
//
//  Created by Kabuki Iwashita on 2023/03/29.
//

import SwiftUI

struct HomeView: View {

    private let lc = LocalizeCodes()

    @State private var contactFlag = false
    @State private var surveyFlag = false
    @State private var webSiteFlag = false

    var body: some View {

        VStack {
            TimerView()
                .frame(height: 200)
            VStack {
                ScrollView(.horizontal) {
                    HStack(spacing: 20) {

                        NavigationLink(destination: HelpView()) {
                            CircleButtonStyle(
                                text: lc.text(.Hint),
                                systemName: "lightbulb")
                        }

                        Button(action: {
                            contactFlag.toggle()
                        }) {
                            CircleButtonStyle(text: lc.text(.Contact), systemName: "envelope")
                        }.sheet(isPresented: $contactFlag) {
                            SafariWebView(url: contactURL)
                        }

                        Button(action: {
                            surveyFlag.toggle()
                        }) {
                            CircleButtonStyle(text: lc.text(.Survey), systemName: "list.clipboard")
                        }.sheet(isPresented: $surveyFlag) {
                            SafariWebView(url: surveyURL)
                        }

                        Button(action: {
                            webSiteFlag.toggle()
                        }) {
                            CircleButtonStyle(text: lc.text(.WebSite), systemName: "globe")
                        }.sheet(isPresented: $webSiteFlag) {
                            SafariWebView(url: webSiteURL)
                        }

                        NavigationLink(destination: FeedbackView()) {
                            CircleButtonStyle(text: lc.text(.Review), systemName: "star")
                        }

                    }.padding()
                }
                HStack {
                    Text(lc.text(.Info))
                        .font(.title)
                        .bold()
                    Spacer()
                }.padding(.horizontal)
                    .padding(.top)

                PremiumButton()
                    .padding(.horizontal)
     

                Spacer()
            }

        }.navigationTitle("")
            .navigationBarTitleDisplayMode(.inline)
    }

    private let surveyURL = URL(
        string:
            "https://docs.google.com/forms/d/e/1FAIpQLSewSwAbDeyamHylh8JtY7xBP3V76TidRRaT6tEfIp5BrSilOg/viewform?usp=sf_link"
    )!

    private let contactURL = URL(
        string:
            "https://docs.google.com/forms/d/e/1FAIpQLSdOTFqKlouaXhtFZsuit3LrpKBrafMUlOHH1h1Uisg0D48O6w/viewform?usp=sf_link"
    )!

    private let webSiteURL = URL(string: "https://zeboot.net")!

}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
        }
    }
}
