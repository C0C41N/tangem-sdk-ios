//
//  SignAsync.swift
//  TangemSdk
//
//  Created by Ali M. on 06/10/2024.
//

import Foundation

@available(iOS 13.0, *)
extension TangemSdk {
    public func startSessionAsync(cardId: String?, accessCode: String?) async -> Eval<CardSession, TangemSdkError> {
        await withCheckedContinuation { continuation in
            self.startSession(cardId: cardId, accessCode: accessCode) { session, error in
                if let error = error {
                    continuation.resume(returning: .failure(error))
                } else {
                    continuation.resume(returning: .success(session))
                }
            }
        }
    }
}
