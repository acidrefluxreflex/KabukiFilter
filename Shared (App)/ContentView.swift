//
//  ContentView.swift
//  BlockBadBook
//
//  Created by Kabuki Iwashita on 2021/10/28.
//

import SwiftUI
import AnimatedTabBar


struct ContentView: View {
    
    @State private var selection: Int = 0
    
    private let lc = LocalizeCodes()
    
    private let names = ["house", "wrench.and.screwdriver", "drop", "heart", "gearshape"]
    
    @State var views: [AnyView] = [
        AnyView(HomeView()), AnyView(CustomView()), AnyView(MeditateView()), AnyView(SettingView()),
    ]
    
    private let dic: [Int: String] = [
          0: "HOME".localized,
          1: "CUSTOM".localized,
          2: "MEDITATE".localized,
          3: "SETTING".localized,
      ]

    
    var body: some View {
        NavigationStack {

            ZStack {

                views[selection]

                VStack {
                    Spacer()
                    AnimatedTabBar(selectedIndex: $selection) {

                        customDropletButtonAt(0)

                        customDropletButtonAt(1)

                        customDropletButtonAt(2)

                        customDropletButtonAt(3)

                    }.cornerRadius(16)
                        .barColor(
                            changeBarColor(selection)
                        )
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
    
    private func iconItem(title: String, icon: String) -> some View {
        VStack {
            Text(title)
            Image(systemName: icon)
        }
    }
    
    
    func customDropletButtonAt(_ index: Int) -> some View {
        CustomDropletButton(
            image:
                Image(systemName: names[index] + ".fill"),
            title: "test",
            dropletColor: .accentColor,
            isSelected: selection == index)
    }
    
    
    func changeBarColor(_ index: Int) -> Color {
        if index == 0 {
            return .theme(.ThemeGray)
        } else {
            return .white
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
