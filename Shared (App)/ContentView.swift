//
//  ContentView.swift
//  BlockBadBook
//
//  Created by Kabuki Iwashita on 2021/10/28.
//

import AnimatedTabBar
import SwiftUI

struct ContentView: View {

    @State private var selection: Int = 0

    private let localizeCodes = LocalizeCodes()

    private let tabNames = ["house", "wrench.and.screwdriver", "heart", "gearshape"]
    private let tabTitles = ["Home", "Custom", "Meditate", "Setting"]

    @State var views: [AnyView] = [
        AnyView(HomeView()),
        AnyView(CustomView()),
        AnyView(MeditateView()),
        AnyView(SettingView()),
    ]

    var body: some View {
        NavigationStack {
            ZStack {
                views[selection]

                VStack {
                    Spacer()
                    AnimatedTabBar(selectedIndex: $selection) {
                        customDropletButton(at: 0)
                        customDropletButton(at: 1)
                        customDropletButton(at: 2)
                        customDropletButton(at: 3)
                    }
                    .cornerRadius(16)
                    .barColor(changeBarColor(selection))
                    .selectedColor(.gray.opacity(0.6))
                    .unselectedColor(.gray.opacity(0.6))
                    .ballColor(.accentColor)
                    .ballTrajectory(.straight)
                    .verticalPadding(15)
                    .padding()
                }
            }
        }
    }

    private func customDropletButton(at index: Int) -> some View {
        CustomDropletButton(
            image: Image(systemName: tabNames[index] + ".fill"),
            title: tabTitles[index],
            dropletColor: .accentColor,
            isSelected: selection == index
        )
    }

    private func changeBarColor(_ index: Int) -> Color {
        return index == 0 ? .theme(.ThemeGray) : .white
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
