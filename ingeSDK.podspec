Pod::Spec.new do |s|
    s.name                           = 'npsSDK'
    s.version                        = '1.0.0'
    s.summary                        = 'npsSDK is a web-based API for online payments.'
    s.license                        = { :type => 'MIT', :file => 'LICENSE' }
    s.homepage                       = ''
    s.authors                        = { 'NPS' => 'development@nps.com.ar' }
    s.source                         = { :git => 'https://github.com/Ingenico-NPS-Latam/nps-sdk-ios', :tag => "v#{s.version}" }
    s.frameworks                     = 'Foundation', 'STHTTPRequest'
    s.requires_arc                   = true
    s.platform                       = :ios
    s.ios.deployment_target          = '8.0'
end
