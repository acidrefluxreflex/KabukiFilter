//
//  HelpView.swift
//  AppleSample (iOS)
//
//  Created by Kabuki Iwashita on 2021/10/05.
//

import SwiftUI

struct HelpView: View {

    private let videoSize: CGFloat = 3.5

    @Environment(\.presentationMode) var presentationMode

    private let keys = [

        HelpKeys(
            name: "gearshape.fill",
            color: .gray,
            text: "Open the Settings app"),

        HelpKeys(
            name: "safari.fill",
            color: .blue,
            text: "Select Safari"),

        HelpKeys(
            name: "puzzlepiece.extension.fill",
            color: .purple,
            text: "Select Extensions"),

        HelpKeys(
            name: "switch.2",
            color: .green,
            text: "Turn PureFilter On"),

        HelpKeys(
            name: "checkmark",
            color: .red,
            text: "Turn on “All Websites”"),
    ]

    var body: some View {
        VStack {

            VideoPlayer()
                .frame(
                    width: 100 * videoSize,
                    height: 70 * videoSize
                )

                .padding()

            ForEach(keys) { keys in
                HelpText(
                    name: keys.name,
                    color: keys.color,
                    text: keys.text
                )
                .padding(.bottom, 5)
                .padding(.leading)
            }

        }.frame(width: 350)
    }
}

struct HelpView_Previews: PreviewProvider {
    static var previews: some View {
        HelpView()
    }
}

private struct VideoInFrame: View {
    var body: some View {
        VideoPlayer()
            .clipped()
            .frame(width: 200, height: 140)
        //.frame(width: 300,height: 300)
    }
}

private struct HelpKeys: Identifiable {
    let name: String
    let color: Color
    let text: String
    var id: String { name }
}

private struct HelpText: View {

    let name: String
    let color: Color
    let text: String

    @State private var bodyText: String = ""
    @State private var boldText: String = ""

    var body: some View {
        HStack {
            Image(systemName: name)
                .foregroundColor(color)
                .font(.title3)
                .frame(width: 30, alignment: .center)
            Text(text.localized)
            Spacer()
        }
    }

}
