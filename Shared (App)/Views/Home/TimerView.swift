//
//  TimerView.swift
//  BlockBadBook (iOS)
//
//  Created by Kabuki Iwashita on 2023/03/26.
//

import SwiftUI

struct TimerView: View {

    @State private var startDate = Date()
    @State private var daysElapsed = 0
    @State var streak = 0
    @State var streakString = "0"
    @State private var startAlert = false
    @State private var resetAlert = false

    @StateObject private var tracker = ActivityTracker()
    private let lc = LocalizeCodes()

    private let zenGreen = Color(hex: "#838A2D")
    private let zenBlue = Color(hex: "#7BA23F")

    var body: some View {
        ZStack {

            Rectangle()
                .irregularGradient(colors: [zenGreen, zenBlue], background: Color(hex: "125115"))
                .shadow(radius: 5)

            VStack {
                if tracker.isTracking {
                    startedView()
                        .transition(.scale)

                } else {
                    setUpView()
                        .transition(.identity)
                }
            }.foregroundColor(.white)
        }.frame(height: 250)
            .onAppear {
                streak = tracker.streak
                upDateStreakDays()
            }
            .onChange(of: tracker.startDate) { _ in
                upDateStreakDays()
            }
            .ignoresSafeArea()
    }

    private func startedView() -> some View {

        let startDateText = startDate.ISO8601Format(.iso8601.day().month().year())

        let todayText = Date().ISO8601Format(.iso8601.day().month().year())

        return
            (VStack {
                HStack {
                    Image(systemName: "calendar")
                    Text(startDateText)
                    Text("→")
                    Text(todayText)
                    Spacer()
                }.padding(.top, 60)
                HStack(alignment: .bottom) {
                    Text(streakString + " " + lc.text(.Days))
                        .bold()
                        .font(.largeTitle)

                    Spacer()
                    resetButton()
                }.padding(.top, 40)
                Spacer()
            }.padding(.horizontal)
            .padding(.horizontal)
            .frame(height: 240))
    }

    private func setUpView() -> some View {
        VStack {
            HStack {
                Image(systemName: "calendar")
                Spacer()
            }.padding(.top, 60)
            startDatePicker()
                .padding(.top)
            startButton()
                .padding(.top)
            Spacer()
        }.padding(.horizontal)
            .padding(.horizontal)
            .frame(height: 240)
    }

    private func resetButton() -> some View {
        Button(action: {
            resetAlert.toggle()
        }) {
            VStack {
                Image(systemName: "power.dotted")
                    .bold()
                Text(lc.text(.Reset))
                    .font(.caption)
            }.padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.theme(.ThemeGray))
                        .opacity(0.8)
                )
                .foregroundColor(.accentColor)

        }.alert(lc.text(.Reset), isPresented: $resetAlert) {
            Button(lc.text(.Reset), role: .destructive) {
                withAnimation {
                    tracker.reset()
                    upDateStreakDays()
                }
            }
        } message: {
            Text(lc.text(.ResetMessage))
        }
    }

    private func startButton() -> some View {
        Button(action: {
            startAlert.toggle()
        }) {
            HStack {
                Image(systemName: "power")
                    .bold()
                Text("Start")
                    .bold()
            }.padding(10)
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(.theme(.ThemeGray))
                )
                .foregroundColor(.accentColor)

        }.alert("Start!", isPresented: $startAlert) {
            Button("OK", role: .none) {
                withAnimation {
                    tracker.recordActivity(date: startDate)
                    upDateStreakDays()
                }
            }
        } message: {
            Text("Enjoy New Life")
        }
    }

    private func startDatePicker() -> some View {

        HStack {
            Text("Start From")
                .font(.title)
                .bold()
            Spacer()
            DatePicker(
                lc.text(.StartDay),
                selection: $startDate,
                in: ...Date(),
                displayedComponents: .date
            ).background(Color.theme(.ThemeGray).cornerRadius(7))

        }
        .labelsHidden()

    }

    private func upDateStreakDays() {
        startDate = tracker.startDate
        streak = tracker.streak
        if lc.text(.Language) == "Arabic" {
            let numberFormatter = NumberFormatter()
            numberFormatter.locale = Locale(identifier: "ar")  // アラビア語ロケールを指定
            let arabicNumber = numberFormatter.string(from: streak as NSNumber)
            streakString = arabicNumber!.description
        } else {
            streakString = streak.description
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            TimerView()
            Spacer()
        }
    }
}
