//
//  ClientError.swift
//  telegramClient2
//
//  Created by keckuser on 4/25/24.
//

import Foundation

// Note that an "Error" struct is defined separately by TDLibKit for errors coming from the service.
// Such a struct is copied here as "TelegramError" so that we can avoid importing TDLibKit.
// Errors are reformatted to our ClientError.serviceError.

// We cannot import TDLibKit here, or this enum will fail to conform.

enum ClientError: Error {
    case connectionError
    case updateHandlerError
    case serviceError(Int, String)
    case noChatError
    case noClientError
}

struct TelegramError: Codable, Equatable, Hashable, Error {
    let code: Int
    let message: String
}


func catchError(err: Error, errMessage: String?) -> ClientError {
    var newError: ClientError
    if let serviceError = err as? TelegramError {
        newError = ClientError.serviceError(serviceError.code, serviceError.message)
    } else {
        newError = ClientError.serviceError(1000, errMessage ?? "Other")
    }
    print("Authentication failed: \(newError)")
    return newError
}
