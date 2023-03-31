//
//  ChatBubble.swift
//  PureFilter (iOS)
//
//  Created by Kabuki Iwashita on 2023/03/30.
//

import SwiftUI

import SwiftUI

struct ChatBubble: View {
    @State private var readFlag: Bool = false
    private let iconSize: CGFloat = 35
    private let cornerRadius: CGFloat = 25
    // we will need to access and represent the chatMessages here
    var message: Message
    @State var dateText: String = ""
    // body - is the body of the view, just like the body of the first view we created when opened the project
    var body: some View {
        // HStack - is a horizontal stack. We let the SwiftUI know that we need to place
        // all the following contents horizontally one after another
        Group {

            switch message.type {
            case .bot:
                HStack(alignment: .bottom) {
                    Group {
                        //Image(systemName: "")
                        Text(message.message)
                            .bold()
                            .padding(10)
                            .foregroundColor(Color.white)
                            .background(message.color)
                            .cornerRadius(cornerRadius)
                         

                    }

                    Text(dateText)
                        .font(.caption2)
                        .foregroundColor(.secondary)

                    Spacer()
                }
            case .isMe:
                HStack(alignment: .bottom) {
                    Group {
                        Spacer()
                        VStack(alignment: .trailing) {
                            if readFlag {
                                Text("既読")
                            }
                            Text(dateText)
                        }.font(.caption2)
                            .foregroundColor(.secondary)

                        Text(message.message)
                            .foregroundColor(.primary)
                            .padding(10)
                            .background(Color.theme(.ThemeGray))
                            .cornerRadius(cornerRadius)
                    }
                }.onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        readFlag.toggle()
                    }
                }
            case .loading:
                HStack(alignment: .bottom) {
                    Group {
                        Image(systemName: "")
                     
                        
                            .padding(.vertical, 15)
                            .padding(.horizontal, 5)
                            .foregroundColor(Color.white)
                            .background(message.color)
                            .cornerRadius(cornerRadius)
                    }
                    Spacer()
                }
            }

        }.onAppear {
            dateText = Date().formatted(date: .omitted, time: .shortened)
        }

    }

    /*
    private func dateText() -> String {
        let date = Date()

        return date.formatted(date: .omitted, time: .shortened)
    }
     */
}

struct ChatBubble_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ChatBubble(
                message:
                    Message(
                        message: "test",
                        avatar: "",
                        color: .accentColor,
                        type: .loading))
            ChatBubble(
                message:
                    Message(
                        message: "test",
                        avatar: "",
                        color: .accentColor,
                        type: .bot))
            ChatBubble(
                message:
                    Message(
                        message: "test",
                        avatar: "",
                        color: .accentColor,
                        type: .isMe))
        }
    }
}

