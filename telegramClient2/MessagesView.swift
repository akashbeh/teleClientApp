//
//  MessageView.swift
//  telegramClient2
//
//  Created by keckuser on 4/25/24.
//

import SwiftUI
import TDLibKit

struct MessagesView: View {
    @State var client: TelegramClient
    
    @State var messageCache: [Message]?
    
    func load(iterations: Int) async {
        let i = iterations + 1
        do {
            messageCache = try await client.getBotChat()
        } catch {
            if i < 5 {
                await load(iterations: i)
            } else {
                print("FAILED to load messages")
            }
        }
    }
    
    var body: some View {
        if let messages = messageCache {
            if let msg = messages.last {
                MsgView(message: msg)
            } else {
                Text("No messages found")
            }
        } else {
            ProgressView().task {
                await load(iterations: 0)
            }
        }

    }
}
