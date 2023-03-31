//
//  BackgroundTaskManager.swift
//  Eveki
//
//  Created by Kabuki Iwashita on 2022/11/07.
//

import Foundation
import SwiftUI

final class BackgroundTaskManager {
    static let shared = BackgroundTaskManager()

    private init() {}

    func beginBackgroundTask(_ callback: (UIBackgroundTaskIdentifier) -> Void) {
        var backgroundTaskIdentifier = UIBackgroundTaskIdentifier.invalid

        backgroundTaskIdentifier = UIApplication.shared.beginBackgroundTask { [weak self] in
            self?.endBackgroundTask(identifier: backgroundTaskIdentifier)
        }
        callback(backgroundTaskIdentifier)
    }

    func endBackgroundTask(identifier: UIBackgroundTaskIdentifier) {
        UIApplication.shared.endBackgroundTask(identifier)
    }
}
