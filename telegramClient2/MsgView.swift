//
//  MsgView.swift
//  telegramClient2
//
//  Created by keckuser on 4/26/24.
//

import SwiftUI
import TDLibKit

struct MsgView: View {
    var message: Message
    
    var body: some View {
        switch message.content {
                case .messagePoll(let msgPoll):
                    PollView(poll: msgPoll.poll)
        //        case messageText
        //        case messageAnimation
        //        case messageAudio
        //        case messageDocument
        //        case messagePhoto
        //        case messageVideo
        //        case messageVideoNote
        //        case messageVoiceNote
        //        case messageVenue
        //        case messageContact
        //        case messageAnimatedEmoji
                // case messageGame
                default:
                    Text("TBD")
                }
    }
}
