//
//  PanicView.swift
//  BlockBadBook (iOS)
//
//  Created by Kabuki Iwashita on 2023/03/28.
//

import SwiftUI

struct PanicView: View {
    @State var buttonText = "5秒後にローカル通知を発行する"
    @State private var flag: Bool = false

    @State private var num: [Double] = []

    let center = UNUserNotificationCenter.current()

    //private let manager = PanicAlertsManager()

    @ObservedObject(initialValue: PanicAlertsManager()) var manager: PanicAlertsManager

    @State var fruits: [PanicListItems] = [
        PanicListItems(5),
        PanicListItems(10),
        PanicListItems(15),
        PanicListItems(20),
        PanicListItems(30),
        PanicListItems(60),
    ]

    var body: some View {

        List {
            ForEach(0..<fruits.count) { index in
                /// セルの表示
                HStack {
                    Image(systemName: fruits[index].checked ? "checkmark.circle.fill" : "circle")
                        .foregroundColor(.accentColor)
                    Text("\(fruits[index].title)")
                    Spacer()
                }.contentShape(Rectangle())
                    /// checkedフラグを変更する
                    .onTapGesture {
                        fruits[index].checked.toggle()
                        if fruits[index].checked {
                            num.append(fruits[index].time)
                        } else {
                            num.remove(value: fruits[index].time)
                        }
                    }
            }
            Section {
                Button(action: { forPanic() }) {
                    Text("Panic")
                }.listRowBackground(
                    Rectangle().foregroundColor(.theme(.ThemeBlack))
                ).alert("Added", isPresented: $flag, actions: {})
            }

            Section {
                PanicHelp()
            }
        }  //.listStyle(.plain)

        .navigationTitle(Text("Alert"))

    }
    private func forPanic() {
        for double in num {
            manager.setAlert(double)
            print(double)
            print("🇦🇸")
        }
        num.removeAll()
        flag.toggle()
    }
}

struct PanicListItems {
    var checked: Bool
    var title: String
    var time: Double

    init(_ time: Double) {
        self.checked = false
        self.title = Int(time).description + "min"
        self.time = time
    }
}

struct PanicView_Previews: PreviewProvider {
    static var previews: some View {
        PanicView()
    }
}

struct PanicHelp: View {

    private let text =
        "You will receive a warning notification when the time you specified has elapsed.\nUse this when you can't avoid dangerous sites or content."

    var body: some View {
        HStack(alignment: .top) {
            Text(text.localized)
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}
