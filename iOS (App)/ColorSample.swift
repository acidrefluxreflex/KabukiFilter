//
//  ColorSample.swift
//  KabukiFilter (iOS)
//
//  Created by Kabuki Iwashita on 2021/10/25.
//

import SwiftUI
import DynamicColor

struct ColorSample: View {
    
    //private let uiColor: UIColor = .red
    
    @State private var uiColors: [UIColor] = [
        .red,
        .red.desaturated(),
        .red.lighter(),
        .red.darkened(),
        .red.inverted()
        
    ]
    
    var body: some View {
        
        VStack(alignment:.leading) {
            HStack{
                ForEach(uiColors.indices) { num in
                    Rectangle()
                        .foregroundColor(Color(uiColors[num]))
                        .frame(width: 70, height: 70)
                }
            }
            Text("基本の色")
                .font(.callout)
            
        
        }
    }
}

struct ColorSample_Previews: PreviewProvider {
    static var previews: some View {
        ColorSample()
    }
}
