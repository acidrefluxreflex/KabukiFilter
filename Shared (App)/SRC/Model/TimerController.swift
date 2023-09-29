//
//  TimerController.swift
//  BlockBadBook (iOS)
//
//  Created by Kabuki Iwashita on 2023/03/26.
//

import Combine
import Foundation
import SwiftUI

class ActivityTracker: ObservableObject {
    // UserDefaultsに保存するキー
    static let lastDateKey = "lastDate"

    // UserDefaultsのインスタンス
    private let defaults = UserDefaults.standard

    // 継続日数を保持するプロパティ
    @Published var streak: Int = 0

    //開始日時を表示するためのプロパティ
    @Published var startDate: Date = Date()

    // 計測中かどうかを保持するプロパティ
    @Published var isTracking: Bool = false

    // 初期化時にUserDefaultsから前回の日付を取得し、継続日数と計測状態を計算する
    init() {
        if let lastDate = defaults.object(forKey: ActivityTracker.lastDateKey) as? Date {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.day], from: lastDate, to: Date())
            if let days = components.day {
                if days != 0 {
                    streak = days + 1
                }
                isTracking = true
            }
            startDate = lastDate
        }
    }

    // 今日の活動を記録し、UserDefaultsに日付を保存する
    func recordActivity(date: Date) {
        defaults.set(date, forKey: ActivityTracker.lastDateKey)
        if let lastDate = defaults.object(forKey: ActivityTracker.lastDateKey) as? Date {
            let calendar = Calendar.current
            let components = calendar.dateComponents([.day], from: lastDate, to: Date())
            if let days = components.day {
                if days != 0 {
                    streak = days + 1
                }
                isTracking = true
            }
            startDate = lastDate
        }
    }

    // 計測をリセットし、UserDefaultsから日付を削除する
    func reset() {
        defaults.removeObject(forKey: ActivityTracker.lastDateKey)
        streak = 0
        isTracking = false
    }

}

class TimerController: ObservableObject {

    private let dateKey = "timerDate"
    private let startKey = "isStarted"

    @Published var isStarted: Bool {
        didSet {
            UserDefaults.standard.set(isStarted, forKey: startKey)
        }
    }

    @Published var date: Date {
        didSet {
            UserDefaults.standard.set(date, forKey: dateKey)
            isStarted = true

            // プロパティが更新されたら比較とisStartedの設定を行う
        }
    }

    init() {
        print("init")
        date = UserDefaults.standard.object(forKey: dateKey) as? Date ?? Date()
        isStarted = UserDefaults.standard.object(forKey: startKey) as? Bool ?? false
        print(isStarted)
        // 初期化時にも比較とisStartedの設定を行う
        updateIsStarted()
    }

    // dateと現在の時刻を比較し、isStartedを設定するメソッド
    func updateIsStarted() {
        let currentDate = Date()
        if date < currentDate {
            isStarted = true
        } else {
            isStarted = false
        }
    }

    func resetTimer() {
        print("reset")
        date = Date()
        isStarted = false
        print(isStarted)
    }

}
