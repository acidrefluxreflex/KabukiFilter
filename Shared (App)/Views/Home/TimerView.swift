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
        VStack {
            Text("\(daysElapsed) days")
                .bold()
                .font(.largeTitle)
                .padding()
            
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
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView()
    }
}

