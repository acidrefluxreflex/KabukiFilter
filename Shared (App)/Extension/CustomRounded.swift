//
//  CustomRounded.swift
//  Eveki
//
//  Created by Kabuki Iwashita on 2023/03/16.
//


import SwiftUI

struct CustomRounded: View {
  var color: Color = .blue
  var tl: CGFloat = 0.0
  var tr: CGFloat = 0.0
  var bl: CGFloat = 0.0
  var br: CGFloat = 0.0

  var body: some View {
    GeometryReader { geometry in
      Path { path in

        let w = geometry.size.width
        let h = geometry.size.height

        // Make sure we do not exceed the size of the rectangle
        let tr = min(min(self.tr, h / 2), w / 2)
        let tl = min(min(self.tl, h / 2), w / 2)
        let bl = min(min(self.bl, h / 2), w / 2)
        let br = min(min(self.br, h / 2), w / 2)

        path.move(to: CGPoint(x: w / 2.0, y: 0))
        path.addLine(to: CGPoint(x: w - tr, y: 0))
        path.addArc(
          center: CGPoint(x: w - tr, y: tr), radius: tr, startAngle: Angle(degrees: -90),
          endAngle: Angle(degrees: 0), clockwise: false)
        path.addLine(to: CGPoint(x: w, y: h - br))
        path.addArc(
          center: CGPoint(x: w - br, y: h - br), radius: br, startAngle: Angle(degrees: 0),
          endAngle: Angle(degrees: 90), clockwise: false)
        path.addLine(to: CGPoint(x: bl, y: h))
        path.addArc(
          center: CGPoint(x: bl, y: h - bl), radius: bl, startAngle: Angle(degrees: 90),
          endAngle: Angle(degrees: 180), clockwise: false)
        path.addLine(to: CGPoint(x: 0, y: tl))
        path.addArc(
          center: CGPoint(x: tl, y: tl), radius: tl, startAngle: Angle(degrees: 180),
          endAngle: Angle(degrees: 270), clockwise: false)
      }
      .fill(self.color)
    }
  }
}

struct CustomRounded_Previews: PreviewProvider {
  static var previews: some View {
    CustomRounded(
      color: .accentColor,
      tl: 15,
      tr: 0,
      bl: 0,
      br: 15
    )
    .frame(width: 200, height: 200)
  }
}
