//
//  NotificationController.swift
//  Eveki
//
//  Created by Kabuki Iwashita on 2023/01/23.
//

import SwiftUI
import UserNotifications
import Intents

class NotificationController: ObservableObject {
    
    private let center = UNUserNotificationCenter.current()
    
    let demoParticipant: INPerson = INPerson(
        personHandle: INPersonHandle(value: "John-Appleseed@mac.com", type: .emailAddress),
        nameComponents: try? PersonNameComponents("John Appleseed"),
        displayName: "@john",
        image: INImage(named: "enjoy"),
        contactIdentifier: nil,
        customIdentifier: "john",
        isMe: false,
        suggestionType: .instantMessageAddress
    )
    
    
    func setAlert(_ num: Double) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
            (granted, error) in
            if granted {
                let interval = TimeInterval(10)
                self.makeNotification(interval)
                
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    //通知拒否時の処理
                }
            }
        }
        
    }
    
    func setMessageAlert(_ name: String) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) {
            (granted, error) in
            if granted {
                
                self.pleaseMessage(name)
                
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
        content.title = titles.first!.localized
        content.body = body.first!.localized
        content.userInfo = ["momo": "test"]
        content.sound = UNNotificationSound.default
        //通知リクエストを作成
        let request = UNNotificationRequest(
            identifier: "notification\(Int(timeInterval))",
            content: content,
            trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
        
    }
    
    
    private func pleaseMessage(_ name: String) {
        var title = "が待っています"
        title = name + title
        var body = [
            "メッセージを送ってみませんか？",
            "何か話してみましょう"
        ]
        body.shuffle()
        let interval = TimeInterval(60*60*12)
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: interval,
                                                        repeats: false)
        let content = UNMutableNotificationContent()
        content.title = title
        content.body = body.first!.localized
        content.sound = UNNotificationSound.default
        let request = UNNotificationRequest(
            identifier: "notification\(Int(interval))",
            content: content,
            trigger: trigger)
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    func messageTest() {
        let sender = [DemoParticipants.demoParticipant, DemoParticipants.demoParticipant2].randomElement()!
        let currentUser = DemoParticipants.currentUser
        let chatMessage = "テスト、テスト、テスト"
        
        var content = UNMutableNotificationContent()
        content.title = "New chat message"
        content.body = chatMessage
        
        let intent = INSendMessageIntent(
            recipients: [currentUser],
            outgoingMessageType: .outgoingMessageText,
            content: chatMessage,
            speakableGroupName: INSpeakableString(spokenPhrase: sender.displayName),
            conversationIdentifier: "chat001",
            serviceName: nil,
            sender: sender,
            attachments: nil
        )
        
        intent.setImage(sender.image, forParameterNamed: \.sender)
        
        let interaction = INInteraction(intent: intent, response: nil)
        interaction.direction = .incoming
        
        interaction.donate(completion: nil)
        
        do {
            content = try content.updating(from: intent) as! UNMutableNotificationContent
        } catch {
            // Handle error
        }
        
        // Show the message after 5 seconds
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}

struct DemoParticipants {
    static let demoParticipant: INPerson = INPerson(
        personHandle: INPersonHandle(value: "John-Appleseed@mac.com", type: .emailAddress),
        nameComponents: try? PersonNameComponents("John Appleseed"),
        displayName: "@john",
        image: INImage(named: "enjoy"),
        contactIdentifier: nil,
        customIdentifier: "john",
        isMe: false,
        suggestionType: .instantMessageAddress
    )
    static let demoParticipant2: INPerson = INPerson(
        personHandle: INPersonHandle(value: "(555) 610-6679", type: .phoneNumber),
        nameComponents: try? PersonNameComponents("David Taylor"),
        displayName: "@david",
        image: INImage(named: "enjoy"),
        contactIdentifier: nil,
        customIdentifier: "david",
        isMe: false,
        suggestionType: .instantMessageAddress
    )
    static let currentUser: INPerson = INPerson(
        personHandle: INPersonHandle(value: "test@example.com", type: .emailAddress),
        nameComponents: try? PersonNameComponents("Current User"),
        displayName: "@current",
        image: INImage(named: "enjoy"),
        contactIdentifier: nil,
        customIdentifier: "current",
        isMe: true,
        suggestionType: .instantMessageAddress
    )
}
