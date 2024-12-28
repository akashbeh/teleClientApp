//
//  AuthorizationInterface.swift
//  telegramClient2
//
//  Created by keckuser on 4/26/24.
//

import SwiftUI
import TDLibKit

struct AuthorizationInterface: View {
    @State var client: TelegramClient
    
    @Binding var presentSheet: Bool
    
    @State var text = ""
    
    var body: some View {
        VStack {
            switch client.authState {
            case .authorizationStateWaitCode(let codeInfoWrapper):
                TextField("Enter code", text: $text)
                    .onSubmit {
                        print("Sent code")
                        presentSheet = false
                        client.sendCode(code: text)
                    }
                // Text("Code info: \(codeInfoWrapper.codeInfo.type)")
            default:
                ProgressView()
            }
        }.onAppear {
            print("APPEARED")
        }
    }
}
