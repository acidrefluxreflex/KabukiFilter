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
    
    var body: some View {
        ZStack {
           RoundedRectangle(cornerRadius: 8)
                .stroke(.secondary, lineWidth: 1)
            VStack {
                Text("\(daysElapsed) days")
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
    
    
    private func resetButton() -> some View {
        Button(action: {
            showingAlert.toggle()
        }) {
            Text("Reset")
        }.alert("タイトル", isPresented: $showingAlert) {
            Button("削除", role: .destructive){
              tapButton()
            }
        } message: {
            Text("詳細メッセージ")
        }
    }
    
    private func startDatePicker() -> some View {
        HStack {
            Text("Start")
            DatePicker("Start Date",
                       selection: $controller.date,
                       in: ...Date(), displayedComponents: .date)
            .disabled(!isDaysZero())
            .labelsHidden()
        }.padding()
            .foregroundColor(isDaysZero() ? .primary : .secondary)
    }
}



struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}

