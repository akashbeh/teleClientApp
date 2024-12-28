//
//  telegramClient2App.swift
//  telegramClient2
//
//  Created by keckuser on 4/24/24.
//

import SwiftUI

@main
struct telegramClient2App: App {
    
    var body: some Scene {
        WindowGroup {
            ContentView(client: TelegramClient())
        }
    }
}
