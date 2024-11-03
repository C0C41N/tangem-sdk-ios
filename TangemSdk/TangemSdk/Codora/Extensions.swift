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

@available(iOS 13.0, *)
extension CardSessionRunnable {
    public func runAsync(in session: CardSession) async -> Eval<Response, TangemSdkError> {
        await withCheckedContinuation { continuation in
            self.run(in: session) { result in
                switch result {
                case .success(let response):
                    continuation.resume(returning: .success(response))
                case .failure(let error):
                    continuation.resume(returning: .failure(error))
                }
            }
        }
    }
}

@available(iOS 13.0, *)
extension BackupService {
    public func readPrimaryCardAsync(cardId: String? = nil) async -> Eval<Void, TangemSdkError> {
        await withCheckedContinuation { continuation in
            self.readPrimaryCard(cardId: cardId) { result in
                switch result {
                case .success(let response):
                    continuation.resume(returning: .success(response))
                case .failure(let error):
                    continuation.resume(returning: .failure(error))
                }
            }
        }
    }
    
    public func addBackupCardAsync() async -> Eval<Void, TangemSdkError> {
        await withCheckedContinuation { continuation in
            self.addBackupCard() { result in
                switch result {
                case .success(let response):
                    continuation.resume(returning: .success(response))
                case .failure(let error):
                    continuation.resume(returning: .failure(error))
                }
            }
        }
    }
    
    public func proceedBackupAsync() async -> Eval<Card, TangemSdkError> {
        await withCheckedContinuation { continuation in
            self.proceedBackup() { result in
                switch result {
                case .success(let response):
                    continuation.resume(returning: .success(response))
                case .failure(let error):
                    continuation.resume(returning: .failure(error))
                }
            }
        }
    }
}
