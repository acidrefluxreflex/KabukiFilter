//
//  ViewTopLayer.swift
//  KabukiFilter
//
//  Created by Kabuki Iwashita on 2023/09/28.
//

import SwiftUI

struct ViewTopLayer: View {
    var body: some View {
        VStack {
            Rectangle()
                .frame(height: 250)
                .irregularGradient(colors: [.green, .blue], background: Color.cyan)
                .shadow(radius: 7)
                .ignoresSafeArea()
            Spacer()
        }
    }
}

struct ViewTopLayer_Previews: PreviewProvider {
    static var previews: some View {
        ViewTopLayer()
    }
}
