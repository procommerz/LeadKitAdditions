Pod::Spec.new do |s|
  s.name            = "LeadKitAdditions"
  s.version         = "10.0.0"
  s.summary         = "iOS framework with a bunch of tools for rapid development"
  s.homepage        = "https://github.com/TouchInstinct/LeadKitAdditions"
  s.license         = "Apache License, Version 2.0"
  s.author          = "Procommerz"
  s.platform        = :ios, "13.0"
  s.source          = { :git => "https://github.com/procommerz/LeadKitAdditions", :tag => s.version }

  s.subspec 'Core' do |ss|
    ss.ios.deployment_target = '13.0'
    ss.source_files = "LeadKitAdditions/Sources/**/*.swift"

    ss.exclude_files = [
      "LeadKitAdditions/Sources/Services/Network/DefaultNetworkService+ActivityIndicator+Extension.swift",
    ]

    ss.dependency "LeadKit", '10.0.0'
    ss.dependency "KeychainAccess", '3.1.0'
    ss.dependency "IDZSwiftCommonCrypto", '0.13.0'
    ss.dependency "InputMask", '3.0.0'
    ss.dependency "SwiftValidator", '4.0.2'
  end

  s.subspec 'Core-iOS-Extension' do |ss|
    ss.platform = :ios, '13.0'
    ss.source_files = "LeadKitAdditions/Sources/**/*.swift"

    ss.exclude_files = [
      "LeadKitAdditions/Sources/Services/Network/DefaultNetworkService+ActivityIndicator.swift",
    ]

    ss.dependency "LeadKit/Core-iOS-Extension", '10.0.0'
    ss.dependency "KeychainAccess", '3.1.0'
    ss.dependency "IDZSwiftCommonCrypto", '0.13.0'
    ss.dependency "InputMask", '3.0.0'
    ss.dependency "SwiftValidator", '4.0.2'
  end

  s.default_subspec = 'Core'

end
