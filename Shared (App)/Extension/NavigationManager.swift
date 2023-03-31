//
//  NavigationManager.swift
//  Eveki
//
//  Created by Kabuki Iwashita on 2022/10/31.
//

import Foundation
import SwiftUI

class NavigationManager: ObservableObject {

    @Published var path: NavigationPath = NavigationPath()

    func gotoHomePage() {
        path.removeLast(path.count)
    }
}

struct PresentingModalKey: EnvironmentKey {
    static let defaultValue: Binding<Bool> = Binding<Bool>.constant(false)
}
// 自作環境変数
extension EnvironmentValues {
    var isPresentingModal: Binding<Bool> {
        get { self[PresentingModalKey.self] }
        set { self[PresentingModalKey.self] = newValue }
    }
}
