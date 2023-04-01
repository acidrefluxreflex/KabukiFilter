//
//  ChatView.swift
//  BlockBadBook (iOS)
//
//  Created by Kabuki Iwashita on 2023/03/28.
//


import SwiftUI
import SwiftyChat

struct ChatView: View {
    private let lc = LocalizeCodes()

       
       @StateObject private var notification = NotificationController()

       @StateObject private var chatController = ChatController()
  
       //@StateObject private var tracking = ATTrackingModel()

       @State private var history: String = ""

       @State private var composedMessage: String = ""
       @State private var isShowModal = false
       @State private var isShowDialog: Bool = false
       @State private var deleteFlag: Bool = false
       @State private var reportFlag: Bool = false

       //@StateObject private var manager = PaymentStateManager()
       @State private var isShowPayWall: Bool = false
       @State private var isShowConfirm = false

    

       var body: some View {

           VStack {
               ScrollViewReader { proxy in
                   ScrollView {
                       Text(Date().formatted())
                           .foregroundColor(.secondary)
                       ForEach(chatController.messages, id: \.self) { msg in
                           ChatBubble(message: msg).padding(.horizontal)
                               .id(msg.id)
                       }
                       

                       Spacer()
                   }.onChange(of: chatController.messages) { message in
                       withAnimation {
                           proxy.scrollTo(message.last?.id)
                       }
                   }
               }

               VStack(spacing: 0) {
                   Rectangle().frame(height: 1)
                       .foregroundColor(.secondary)
                   messageTextField()
                       .padding(.vertical, 10)
                       .padding(.horizontal)
                       .background(
                           Color.theme(.ThemeGray)
                       )
               }
              
               .navigationBarTitleDisplayMode(.inline)
             
           
               
           }
           .onAppear {
               //manager.checkUserSubscribed()
               chatController.getAPIURL()
               chatController.getEnAPIURL()
               let m = Message(message: "どうしましたか？", avatar: "", color:.accentColor, type: .bot)
               chatController.messages.append(m)

            
           }
       }

       private func sendMessage() {
           chatController.send(
               text: composedMessage)
           composedMessage = ""
           //tracking.logMessaging()
           
       }

       private func greeting() {

           
       }

       

       private func messageTextField() -> some View {
           HStack {
               TextField(
                   "Message...",
                   text: $composedMessage
               )
               .padding(8)
               .frame(minHeight: CGFloat(30))

               .background(
                   RoundedRectangle(cornerRadius: 25)
                       .foregroundColor(
                           Color.theme(.BackGround)
                       )
               )
               Button(action: sendMessage) {
                   Image(systemName: "paperplane.fill")
                       .font(.title2)
               }.disabled(composedMessage.isEmpty)

           }
       }

 
       private func dialogButton() -> some View {
           Button(action: {
               isShowDialog.toggle()
           }) {
               Image(systemName: "ellipsis.circle")
           }.confirmationDialog(
               "タイトル", isPresented: $isShowDialog, titleVisibility: .hidden
           ) {
               Button(lc.text(.DeleteAI), role: .destructive) {
                   deleteFlag.toggle()
               }
           }
       }

       private func deleteButton() -> some View {
           Button(action: {
               deleteFlag.toggle()
           }) {
               Image(systemName: "person.crop.circle.badge.xmark")
                   .foregroundColor(.red)
           }
       }

      
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
