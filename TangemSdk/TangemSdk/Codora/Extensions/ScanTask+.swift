//
//  ScanTask+.swift
//  TangemSdk
//
//  Created by Ali M. on 06/10/2024.
//

@available(iOS 13.0, *)
extension ScanTask {
    public func runAsync(in session: CardSession) async -> Eval<Card, TangemSdkError> {
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
