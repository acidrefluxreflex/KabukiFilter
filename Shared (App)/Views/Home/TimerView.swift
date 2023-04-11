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
    @State private var showingAlert = false
    @StateObject private var controller = TimerController()
    private let lc = LocalizeCodes()
    
    var body: some View {
        ZStack {
           RoundedRectangle(cornerRadius: 8)
                .stroke(.secondary, lineWidth: 1)
            VStack {
                Text(localizedDays() + " " +  lc.text(.Days))
                    .bold()
                    .font(.largeTitle)
                    .padding()
                resetButton()
                startDatePicker()
            }
        }.frame(height: 200)
        .onAppear {
            updateDaysElapsed()
        }
        .onChange(of: controller.date) { _ in
            updateDaysElapsed()
        }
       
        
    }
    
    private func updateDaysElapsed() {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day],
                                                 from: controller.date,
                                                 to: Date())
        if let days = components.day {
            daysElapsed = max(0, days)
        }
    }
    
    private func tapButton() {
        controller.date = Date()
        self.daysElapsed = 0
    }
    
    private func isDaysZero() -> Bool {
       daysElapsed == 0
    }
    
    private func localizedDays() -> String {
        if lc.text(.Language) == "Arabic" {
            let numberFormatter = NumberFormatter()
            numberFormatter.locale = Locale(identifier: "ar") // アラビア語ロケールを指定
            let number = numberFormatter.number(from: "1234")
            let arabicNumber = numberFormatter.string(from: daysElapsed as NSNumber)
            return arabicNumber!.description
        } else {
            return daysElapsed.description
        }
    }
    
    private func resetButton() -> some View {
        Button(action: {
            showingAlert.toggle()
        }) {
            Text(lc.text(.Reset))
        }.alert(lc.text(.Reset), isPresented: $showingAlert) {
            Button(lc.text(.Reset), role: .destructive){
              tapButton()
            }
        } message: {
            Text(lc.text(.ResetMessage))
        }
    }
    
    private func startDatePicker() -> some View {
        HStack {
           
            DatePicker(lc.text(.StartDay),
                       selection: $controller.date,
                       in: ...Date(), displayedComponents: .date)
            .disabled(!isDaysZero())
           
        }.padding()
            .foregroundColor(isDaysZero() ? .primary : .secondary)
    }
    
    
}



struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}

