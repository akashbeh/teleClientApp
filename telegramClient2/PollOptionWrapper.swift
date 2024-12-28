//
//  PollOptionWrapper.swift
//  telegramClient2
//
//  Created by keckuser on 4/25/24.
//

import Foundation
import TDLibKit

struct PollOptionWrapper: Identifiable, Codable, Equatable, Hashable {
    var id = UUID()
    let option: PollOption
}
