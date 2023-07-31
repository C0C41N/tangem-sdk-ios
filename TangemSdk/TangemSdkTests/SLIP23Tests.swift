//
//  SLIP23Tests.swift
//  TangemSdkTests
//
//  Created by Alexander Osokin on 31.07.2023.
//  Copyright © 2023 Tangem AG. All rights reserved.
//

import Foundation
import XCTest
@testable import TangemSdk

@available(iOS 13.0, *)
class SLIP23Tests: XCTestCase {

    // compare with TrustWallet's WalletCore implementaion
    func testIkarus() throws {
        let expectedKl = "08c1d64cdce875122012d1d81611e83ebf0823b2c6df97a99c55ee35ef5b5547"
        let expectedKr = "3916ba9c8add605b1bb4db40bb7ae4049089051250a48479795a7e63d23d4cde"
        let expectedPublicKey = "32ea4ee339b0b01233e5f0728d733dc68a26d17a58c140aa23fe1c8eeabd5abe"
        let expectedChainCode = "055d207e832382121b9ff6c339628368131f90f9a50a3e36ffbbcba804fbc4dc"

        let mnemonic = try Mnemonic(with: "tiny escape drive pupil flavor endless love walk gadget match filter luxury")
        let entropy = try mnemonic.getEntropy()

        let privateKey = try SLIP23().makeIkarusMasterKey(entropy: entropy, passphrase: "")

        XCTAssertEqual(privateKey.privateKey.prefix(32).hexString.lowercased(), expectedKl)
        XCTAssertEqual(privateKey.privateKey.suffix(32).hexString.lowercased(), expectedKr)
        XCTAssertEqual(privateKey.chainCode.hexString.lowercased(), expectedChainCode)

        // generated by card
        let publicKeyFromCard = "32EA4EE339B0B01233E5F0728D733DC68A26D17A58C140AA23FE1C8EEABD5ABE"
        XCTAssertEqual(publicKeyFromCard.lowercased(), expectedPublicKey)
    }

    // https://github.com/cardano-foundation/CIPs/blob/09d7d8ee1bd64f7e6b20b5a6cae088039dce00cb/CIP-0003/Icarus.md
    func testNoPassphrase() throws {
        let expectedPrivateKey = "c065afd2832cd8b087c4d9ab7011f481ee1e0721e78ea5dd609f3ab3f156d245d176bd8fd4ec60b4731c3918a2a72a0226c0cd119ec35b47e4d55884667f552a23f7fdcd4a10c6cd2c7393ac61d877873e248f417634aa3d812af327ffe9d620"
        let mnemonic = try Mnemonic(with: "eight country switch draw meat scout mystery blade tip drift useless good keep usage title")
        let entropy = try mnemonic.getEntropy()
        let privateKey = try SLIP23().makeIkarusMasterKey(entropy: entropy, passphrase: "")
        let concatenated = privateKey.privateKey + privateKey.chainCode
        XCTAssertEqual(concatenated.hexString.lowercased(), expectedPrivateKey)
    }

    // https://github.com/cardano-foundation/CIPs/blob/09d7d8ee1bd64f7e6b20b5a6cae088039dce00cb/CIP-0003/Icarus.md
    func testWithPassprhase() throws {
        let expectedPrivateKey = "70531039904019351e1afb361cd1b312a4d0565d4ff9f8062d38acf4b15cce41d7b5738d9c893feea55512a3004acb0d222c35d3e3d5cde943a15a9824cbac59443cf67e589614076ba01e354b1a432e0e6db3b59e37fc56b5fb0222970a010e"
        let mnemonic = try Mnemonic(with: "eight country switch draw meat scout mystery blade tip drift useless good keep usage title")
        let entropy = try mnemonic.getEntropy()
        let privateKey = try SLIP23().makeIkarusMasterKey(entropy: entropy, passphrase: "foo")
        let concatenated = privateKey.privateKey + privateKey.chainCode
        XCTAssertEqual(concatenated.hexString.lowercased(), expectedPrivateKey)
    }
}
