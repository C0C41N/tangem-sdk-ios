//
//  SignCommand+.swift
//  TangemSdk
//
//  Created by Ali M. on 07/10/2024.
//

import TangemSdk

@available(iOS 13.0, *)
extension SignCommand {
    public func runAsync(in session: CardSession) async -> Eval<SignResponse, Error> {
        await withCheckedContinuation { continuation in
            self.run(in: session) { result in
                switch result {
                case .success(let card):
                    continuation.resume(returning: .success(card))
                case .failure(let error):
                    continuation.resume(returning: .failure(error))
                }
            }
        }
    }
}
