//
//  TangemProvider.swift
//  TangemSdk
//
//  Created by Ali M. on 12/09/2024.
//

import Foundation

@available(iOS 13.0, *)
public class TangemProvider {

    private static var tangemSdk: TangemSdk = {

        var config = Config()

        config.linkedTerminal = false
        config.allowUntrustedCards = true
        config.handleErrors = true
        config.filter.allowedCardTypes = FirmwareVersion.FirmwareType.allCases
        config.accessCodeRequestPolicy = .alwaysWithBiometrics
        config.logConfig = .release

        config.defaultDerivationPaths = [:]

        let sdk = TangemSdk()
        sdk.config = config
        return sdk

    }()

    public static func getTangemSdk() -> TangemSdk {
        return tangemSdk
    }

}
