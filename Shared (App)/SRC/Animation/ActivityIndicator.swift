//
//  ActivityIndicator.swift
//  KabukiFilter (iOS)
//
//  Created by Kabuki Iwashita on 2023/04/01.
//

import SwiftUI

struct ActivityIndicator: View {
    
    @State private var isAnimating: Bool = false

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.theme(.ThemeGray))
                .opacity(0.7)
                .overlay(
                    .thinMaterial
                ).cornerRadius(15)
                .shadow(radius: 5)
            GeometryReader { (geometry: GeometryProxy) in
                ForEach(0..<5) { index in
                    Group {
                        Circle()
                            .frame(width: geometry.size.width / 5, height: geometry.size.height / 5)
                            .scaleEffect(calcScale(index: index))
                            .offset(y: calcYOffset(geometry))
                    }.frame(width: geometry.size.width, height: geometry.size.height)
                        .rotationEffect(!self.isAnimating ? .degrees(0) : .degrees(360))
                        .animation(
                            Animation
                                .timingCurve(0.5, 0.15 + Double(index) / 5, 0.25, 1, duration: 1.5)
                                .repeatForever(autoreverses: false), value: UUID())
                }
            }
            .aspectRatio(1, contentMode: .fit)
            .padding()
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    self.isAnimating = true
                }
            }
        }
    }

    func calcScale(index: Int) -> CGFloat {
        return (!isAnimating ? 1 - CGFloat(Float(index)) / 5 : 0.2 + CGFloat(index) / 5)
    }

    func calcYOffset(_ geometry: GeometryProxy) -> CGFloat {
        return geometry.size.width / 10 - geometry.size.height / 2
    }

}

struct ActivityIndicator_Previews: PreviewProvider {
    static var previews: some View {
        ActivityIndicator()
            .frame(width: 200, height: 200)
            .foregroundColor(.orange)
    }
}
