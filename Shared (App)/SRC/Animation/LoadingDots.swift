//
//  LoadingBalls.swift
//  KabukiFilter (iOS)
//
//  Created by Kabuki Iwashita on 2023/04/02.
//

import Combine
import SwiftUI

struct LoadingBalls: View {

    let timer: Publishers.Autoconnect<Timer.TimerPublisher>
    let timing: Double

    let maxCounter: Int = 3
    @State var counter: Int = 0

    let frame: CGSize
    let primaryColor: Color

    init(
        color: Color = .black,
        size: CGSize = .init(width: 50, height: 8),
        speed: Double = 0.6
    ) {
        timing = speed
        timer = Timer.publish(every: timing, on: .main, in: .common).autoconnect()
        frame = size
        primaryColor = color
    }

    var body: some View {

        HStack(spacing: 0) {
            ForEach(0..<maxCounter, id: \.self) { index in
                Circle()
                    .fill(primaryColor)
                    .opacity(counter == index ? 1.0 : 0.5)

            }
        }
        .frame(width: frame.width, height: frame.height, alignment: .center)
        .onReceive(
            timer,
            perform: { _ in
                withAnimation(.linear(duration: timing)) {
                    counter = counter == (maxCounter - 1) ? 0 : counter + 1
                }
            })
    }
}

struct LoadingBalls_Previews: PreviewProvider {
    static var previews: some View {
        LoadingBalls()
    }
}
