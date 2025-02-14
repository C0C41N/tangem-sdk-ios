#
# Be sure to run `pod lib lint TangemSdk.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name = 'TangemSdk_Codora'
  s.version = '5.16.6'
  s.summary = 'TangemSdk fork for Codora'
  s.description = <<-DESC
Tangem is a Swiss-based secure hardware wallet manufacturer that enables blockchain-based assets to be kept in custody within smart physical banknotes and accessed via NFC technology. Tangem’s mission is to make digital assets accessible, affordable and convenient for consumers.
                  DESC

  s.homepage = 'https://github.com/C0C41N/tangem-sdk-ios'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.author = { 'C0C41N' => '0ct41n@gmail.com' }
  s.source = { :git => 'https://github.com/C0C41N/tangem-sdk-ios.git', :tag => s.version.to_s }
  s.platform = :ios
  s.ios.deployment_target = '11.0'
  s.swift_version = '5.0'

  s.source_files = 'TangemSdk/TangemSdk/**/*.{swift}', 
                   'TangemSdk/TangemSdk/TangemSdk.h',
                   'TangemSdk/TangemSdk/Crypto/secp256k1/*/*.{h,c}'
 
  s.preserve_paths = 'TangemSdk/TangemSdk/module.modulemap',
                     'TangemSdk/TangemSdk/Crypto/*'

  s.public_header_files = 'TangemSdk/TangemSdk/TangemSdk.h'

  s.pod_target_xcconfig = {
    'SWIFT_INCLUDE_PATHS' => '$(PODS_TARGET_SRCROOT)/TangemSdk/**',
    'OTHER_CFLAGS' => '-Wpedantic -Wall -Wextra -Wcast-align -Wnested-externs -Wshadow -Wstrict-prototypes -Wno-shorten-64-to-32 -Wno-conditional-uninitialized -Wno-unused-function -Wno-long-long -Wno-overlength-strings -Wundef -Wreserved-identifier -O3 -fvisibility=hidden',
  }

  s.weak_frameworks = 'CoreNFC', 
                      'CryptoKit', 
                      'Combine', 
                      'SwiftUI'

  s.resource_bundles = { 
    'TangemSdk' => [
      'TangemSdk/TangemSdk/**/*.lproj/*.strings', 
      'TangemSdk/TangemSdk/Haptics/*.ahap',
      'TangemSdk/TangemSdk/**/Wordlists/*.txt',
      'TangemSdk/TangemSdk/PrivacyInfo.xcprivacy',
    ]
  }

  s.vendored_frameworks = 'TangemSdk/TangemSdk/Frameworks/Bls_Signature.xcframework'
end
