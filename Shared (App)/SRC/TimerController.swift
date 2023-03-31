//
//  TimerController.swift
//  BlockBadBook (iOS)
//
//  Created by Kabuki Iwashita on 2023/03/26.
//


import Foundation

class TimerController: ObservableObject {
    
    @Published var date: Date {
            didSet {
                UserDefaults.standard.set(date, forKey: "timerDate")
            }
        }
    
    
    init() {
        date = UserDefaults.standard.object(forKey: "timerDate") as? Date ?? Date()
     }
    
}

