//
//  BlockApp.swift
//  BlockBadBook
//
//  Created by Kabuki Iwashita on 2021/10/28.
//

import FirebaseCore
import RevenueCat
import SwiftUI
import GoogleSignIn

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication, open url: URL,
        options: [UIApplication.OpenURLOptionsKey: Any]
    )
        -> Bool
    {
       // UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) {
     
        return GIDSignIn.sharedInstance.handle(url)
    }

}

@main
struct IzumoApp: App {
  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
  @AppStorage("isFirstLaunch") var isFirstLaunch = true

    init() {

           Purchases.debugLogsEnabled = true
           Purchases.configure(withAPIKey: Constants.apiKey,
           appUserID: nil,
           observerMode: false)
           FirebaseApp.configure()
          // ライブラリ有効化
          //IQKeyboardManager.shared.enable = true
          // キーボードの上のToolbar「「Done」ボタンがあるエリア」を非表示にする
          //IQKeyboardManager.shared.enableAutoToolbar = false
          // 外側をタップしたときにキーボードを閉じる
          //IQKeyboardManager.shared.shouldResignOnTouchOutside = true

      }

  var body: some Scene {
    WindowGroup {
      ContentView()
            .sheet(isPresented: $isFirstLaunch) {
                TutorialView()
            }
    }
  }
}
