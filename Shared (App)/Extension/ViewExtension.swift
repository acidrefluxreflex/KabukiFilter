//
//  ViewExtension.swift
//  Eveki
//
//  Created by Kabuki Iwashita on 2022/10/27.
//

import SwiftUI

extension View {
    @ViewBuilder
    func redacted(showPlaceholder: Bool) -> some View {
        if showPlaceholder {
            self
                .redacted(reason: .placeholder)
        } else {
            self
                .unredacted()
        }
    }

    func shadowedStyle() -> some View {
        self
            .shadow(color: .black.opacity(0.08), radius: 2, x: 0, y: 0)
            .shadow(color: .black.opacity(0.16), radius: 24, x: 0, y: 0)
    }
}


extension UIView {
    // UIViewをUIImageに変換する
    func toImage() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(bounds.size, isOpaque, 0.0)
        defer { UIGraphicsEndImageContext() }
        drawHierarchy(in: bounds, afterScreenUpdates: false)
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
