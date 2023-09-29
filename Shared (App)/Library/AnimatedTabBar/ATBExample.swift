//
//  ATBExample.swift
//  KabukiFilter
//
//  Created by Kabuki Iwashita on 2023/09/29.
//

import AnimatedTabBar
import SwiftUI

struct ATBExample: View {
    @State private var selectedIndex = 0
    @State private var prevSelectedIndex = 0

    let names = ["heart", "leaf", "drop", "circle", "book"]

    var body: some View {
        ZStack(alignment: .bottom) {

            Color.black.ignoresSafeArea()

            VStack(spacing: 50) {
                AnimatedTabBar(selectedIndex: $selectedIndex) {
                    colorButtonAt(0, type: .bell)
                    colorButtonAt(1, type: .bell)
                    colorButtonAt(2, type: .plus)
                    colorButtonAt(3, type: .calendar)
                    colorButtonAt(4, type: .gear)
                }
                .cornerRadius(16)
                .selectedColor(.gray)
                .unselectedColor(.theme(.ThemeGray))
                .ballColor(.white)
                .verticalPadding(20)
                .ballTrajectory(.straight)
                .ballAnimation(.interpolatingSpring(stiffness: 130, damping: 15))
                .indentAnimation(.easeOut(duration: 0.3))

                AnimatedTabBar(
                    selectedIndex: $selectedIndex,
                    views: (0..<5).map { customDropletButtonAt($0) }
                )
                .cornerRadius(16)
                .selectedColor(.gray.opacity(0.3))
                .unselectedColor(.gray.opacity(0.3))
                .ballColor(.white)
                .verticalPadding(15)

                AnimatedTabBar(
                    selectedIndex: $selectedIndex,
                    views: (0..<names.count).map { wiggleButtonAt($0, name: names[$0]) }
                )
                .cornerRadius(16)
                .selectedColor(.purple)
                .unselectedColor(.purple.opacity(0.3))
                .ballColor(.white)
                .verticalPadding(28)
                .ballTrajectory(.teleport)
            }
            .frame(maxWidth: .infinity)
            .padding(8)
        }
        .onChange(of: selectedIndex) { [selectedIndex] _ in
            prevSelectedIndex = selectedIndex
        }
    }

    func colorButtonAt(_ index: Int, type: ColorButton.AnimationType) -> some View {
        VStack {
            ColorButton(
                image: Image(systemName: names[index]),
                colorImage: Image(systemName: names[index]),
                isSelected: selectedIndex == index,
                fromLeft: prevSelectedIndex < index,
                toLeft: selectedIndex < index,
                animationType: type)
            Text("\(names[index])")
        }
    }

    func dropletButtonAt(_ index: Int) -> some View {
        DropletButton(
            imageName: names[index], dropletColor: .purple, isSelected: selectedIndex == index)
    }

    func customDropletButtonAt(_ index: Int) -> some View {
        CustomDropletButton(
            image:
                Image(systemName: names[index] + ".fill"), title: "test",
            dropletColor: .purple,
            isSelected: selectedIndex == index)
    }

    func wiggleButtonAt(_ index: Int, name: String) -> some View {
        WiggleButton(
            image: Image(systemName: name), maskImage: Image(systemName: "\(name).fill"),
            isSelected: selectedIndex == index
        )
        .scaleEffect(1.2)
    }
}

struct ATBContentView: View {

    @State private var selection: Int = 0

    let names = ["heart", "leaf", "drop", "circle", "book"]
    @State var views: [AnyView] = [
        AnyView(HomeView()), AnyView(CustomView()), AnyView(MeditateView()), AnyView(SettingView()),
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
struct ATBExample_Previews: PreviewProvider {
    static var previews: some View {
        ATBContentView()
    }
}
