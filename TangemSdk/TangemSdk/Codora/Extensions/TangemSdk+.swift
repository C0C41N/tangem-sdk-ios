//
//  SignAsync.swift
//  TangemSdk
//
//  Created by Ali M. on 06/10/2024.
//

import Foundation
import TangemSdk

@available(iOS 13.0, *)
extension TangemSdk {
    public func startSessionAsync(cardId: String?) async -> Eval<CardSession, TangemSdkError> {
        await withCheckedContinuation { continuation in
            self.startSession(cardId: cardId, accessCode: "141414") { session, error in
                if let error = error {
                    continuation.resume(returning: .failure(error))
                } else {
                    continuation.resume(returning: .success(session))
                }
            }
        }
    }
}
