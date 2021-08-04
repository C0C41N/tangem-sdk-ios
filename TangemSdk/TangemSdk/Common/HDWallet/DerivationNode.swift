//
//  DerivationNode.swift
//  TangemSdk
//
//  Created by Alexander Osokin on 02.08.2021.
//  Copyright © 2021 Tangem AG. All rights reserved.
//

import Foundation

public enum DerivationNode: Equatable {
    case hardened(UInt32)
    case notHardened(UInt32)
    
    public var pathDescription: String {
        switch self {
        case .hardened(let index):
            return "\(index)\(HDWalletConstants.hardenedSymbol)"
        case .notHardened(let index):
            return "\(index)"
        }
    }
    
    
    public var index: UInt32 {
        switch self {
        case .hardened(let index):
            let hardenedIndex = index + HDWalletConstants.hardenedOffset
            return hardenedIndex
        case .notHardened(let index):
            return index
        }
    }
}

extension DerivationNode {
    func serialize() -> Data {
        index.bytes4
    }
    
    static func deserialize(from data: Data) -> DerivationNode {
        let index = UInt32(data.toInt())
        if index >= HDWalletConstants.hardenedOffset {
            return .hardened(index - HDWalletConstants.hardenedOffset)
        }
        
        return .notHardened(index)
    }
}
