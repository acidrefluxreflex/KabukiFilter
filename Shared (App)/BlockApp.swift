//
//  BlockApp.swift
//  BlockBadBook
//
//  Created by Kabuki Iwashita on 2021/10/28.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct IzumoApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @AppStorage("isFirstLaunch") var isFirstLaunch = true
    
    init() {
       
       
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
