//
//  PollView.swift
//  telegramClient2
//
//  Created by keckuser on 4/25/24.
//

import SwiftUI
import TDLibKit

struct PollView: View {
    @State var poll: Poll
    @State var optionsWrapper = [PollOptionWrapper]()
    
    func wrapOptions() {
        var wrapperArray = [PollOptionWrapper]()
        for option in self.poll.options {
            wrapperArray.append(PollOptionWrapper(option: option))
        }
        optionsWrapper = wrapperArray
    }
    
    func chooseOption(option: PollOption) {
        // TBD
        return
    }
    
    var body: some View {
        VStack {
            ForEach(optionsWrapper) { optionWrap in
                let option = optionWrap.option
                Button(action: {
                    chooseOption(option: option)
                }) {
                    Text(option.text)
                }
            }.task {
                if optionsWrapper.isEmpty {
                    wrapOptions()
                }
            }
        }
    }
}
