//
//  PanicAlertManager.swift
//  KabukiFilter
//
//  Created by Kabuki Iwashita on 2023/04/01.
//

import SwiftUI
import UserNotifications

class PanicAlertsManager: ObservableObject {

    let center = UNUserNotificationCenter.current()

    func setAlert(_ num: Double) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
            (granted, error) in
            if granted {

                self.makeNotification(num * 60)

            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    //通知拒否時の処理
                }
            }
        }

    }

    private func makeNotification(_ timeInterval: TimeInterval) {

        var titles = [
            "Stay Calm.",
            "Warning!",
            "Are you OK?",
            "Be careful.",
        ]

        var body = [
            "If you feel the need to reset, take a break.",
            "Don't give in to temptation.",
            "Try not to give up!",
            "Remember your goals.",
            "Is the content you are looking at safe?",
            "You can overcome temptation!",
            "Take deep breaths and stretch to stay calm.",
            "I'm so close to reboot! Good luck!",
        ]

        titles.shuffle()
        body.shuffle()
        //通知タイミングを指定
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: timeInterval, repeats: false)
        //通知コンテンツの作成
        let content = UNMutableNotificationContent()
        //MARK: メッセージを考える
        content.title = titles.first!
        content.body = body.first!
        content.sound = UNNotificationSound.default
        //通知リクエストを作成
        let request = UNNotificationRequest(
            identifier: "notification\(Int(timeInterval))", content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)

    }
}
