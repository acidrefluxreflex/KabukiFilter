//
//  ScreenShotExtensions.swift
//  Eveki
//
//  Created by Kabuki Iwashita on 2023/03/19.
//

import SwiftUI

class ScreenshotMaker: UIView {
    /// Takes the screenshot of the superview of this superview
    /// - Returns: The UIImage with the screenshot of the view
    func screenshot() -> UIImage? {
        guard let containerView = self.superview?.superview,
              let containerSuperview = containerView.superview else { return nil }
        let renderer = UIGraphicsImageRenderer(bounds: containerView.frame)
        return renderer.image { (context) in
            containerSuperview.layer.render(in: context.cgContext)
        }
    }
}

extension View {
    func screenshotView(_ closure: @escaping ScreenshotMakerClosure) -> some View {
        let screenshotView = ScreenshotMakerView(closure)
        return overlay(screenshotView.allowsHitTesting(false))
    }
    
    func snapshot() -> UIImage {
        let controller = UIHostingController(rootView: self)
        let view = controller.view
        
        let targetSize = controller.view.intrinsicContentSize
        view?.bounds = CGRect(origin: .zero, size: targetSize)
        view?.backgroundColor = .clear
        
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        
        return renderer.image { _ in
            view?.drawHierarchy(in: controller.view.bounds, afterScreenUpdates: true)
        }
    }
    
}

typealias ScreenshotMakerClosure = (ScreenshotMaker) -> Void

struct ScreenshotMakerView: UIViewRepresentable {
    let closure: ScreenshotMakerClosure
    
    init(_ closure: @escaping ScreenshotMakerClosure) {
        self.closure = closure
    }
    
    func makeUIView(context: Context) -> ScreenshotMaker {
        let view = ScreenshotMaker(frame: CGRect.zero)
        return view
    }
    
    func updateUIView(_ uiView: ScreenshotMaker, context: Context) {
        DispatchQueue.main.async {
            closure(uiView)
        }
    }
}
