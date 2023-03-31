//
//  UIImegeExtension.swift
//  Eveki
//
//  Created by Kabuki Iwashita on 2022/10/24.
//

import Foundation
import SwiftUI

extension UIImage {
    //データサイズを変更する
    func resized(withPercentage percentage: CGFloat) -> UIImage? {
        let canvas = CGSize(width: size.width * percentage, height: size.height * percentage)
        return UIGraphicsImageRenderer(size: canvas, format: imageRendererFormat).image {
            _ in draw(in: CGRect(origin: .zero, size: canvas))
        }
    }
}
