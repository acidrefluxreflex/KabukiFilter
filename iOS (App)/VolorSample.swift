//
//  VolorSample.swift
//  KabukiFilter (iOS)
//
//  Created by Kabuki Iwashita on 2021/10/23.
//

import SwiftUI
//import DynamicColor

struct AssertsSample: View {
    
    @State private var flag = false
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.red,.blue],
                      startPoint: .topLeading,
                      endPoint: .bottomTrailing)
            
            ZStack {
                Group {
                RadialGradient(colors: [.clear, .black],
                               center: .center,
                               startRadius: 1,
                               endRadius: 150)
                    Color.black
                        .opacity(0.4)
                }
                .blendMode(.overlay)
                    .frame(width: 200, height: 200)
                    .opacity(0.4)
                    .cornerRadius(5)
                .shadow(radius: 2, x: 2, y: 2)
            
            Text("momo")
                .foregroundColor(.white)
            }
            
            ZStack {
                Group {
                RadialGradient(colors: [.clear, .black],
                               center: .center,
                               startRadius: 1,
                               endRadius: 150)
                    Color.black
                        .opacity(0.4)
                }
                .blendMode(.overlay)
                    .frame(width: 200, height: 200)
                    .opacity(0.4)
                    .cornerRadius(5)
                .shadow(radius: 2, x: 2, y: 2)
            
            Text("momo")
                .foregroundColor(.white)
            }.padding(.leading, 190)
        }
            
    }
}

private struct GlassSheet: View {
    
    let color = UIColor()
    init() {
    
    }
    
    
    var body: some View {
        ZStack {
            //Color(
            Text("Sheet")
                .opacity(0.3)
        }.opacity(0.1)
    }
}

struct VolorSample_Previews: PreviewProvider {
    
    @State private var flag = false
    
    static var previews: some View {
      
                AssertsSample()
        
    }
}

struct BackgroundBlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        view.alpha = 0.5 //< ---here
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }
    func updateUIView(_ uiView: UIView, context: Context) {}
}
