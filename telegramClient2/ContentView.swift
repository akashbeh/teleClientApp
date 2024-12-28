//
//  ContentView.swift
//  telegramClient2
//
//  Created by keckuser on 4/24/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var client: TelegramClient
    
    @State var presentSheet = false
    
    var body: some View {
        VStack {
            Button(action: {
                print(client.authState)
                presentSheet = client.awaitingInput
            }) {
                Text("Get chat")
            }
            
            Spacer()
            
            MessagesView(client: client)
//            if let messageExists = client.lastMsg {
//                MessageView(content: messageExists.content)
//            }
            
            Spacer()
            
            Button(action: {
                client.close()
            }) {
                Text("CLOSE OUT")
            }
        }.task {
            presentSheet = client.awaitingInput
        }.sheet(isPresented: $presentSheet) {
            AuthorizationInterface(client: client, presentSheet: $presentSheet)
        }
    }
}
