Pod::Spec.new do |s|

  s.name         = 'npsSdk'
  s.version      = '1.0.11'
  s.summary      = 'And SDK to connect to NPS services'
  s.license      = { :type => 'MIT', :file => 'LICENCE' }
  s.homepage     = 'https://github.com/Ingenico-NPS-Latam/nps-sdk-ios'
  s.authors      = { 'Ingenico' => 'Gustavo.Diaz@ingenico.com', 'NPS' => 'development@sub1.com.ar'}
  s.source       = { :git => 'https://github.com/Ingenico-NPS-Latam/nps-sdk-ios.git', :tag => '1.0.11' }
  s.frameworks   = 'SystemConfiguration', 'Foundation', 'CoreLocation', 'AdSupport', 'CoreFoundation', 'CoreTelephony', 'ExternalAccessory', 'UIKit'
  s.requires_arc = true  
  s.platform     = :ios
  s.ios.deployment_target = '8.0'
  s.public_header_files = 'npsSdk/*.h'
  s.source_files = 'npsSdk/*.{h,m}'
  s.description  = 'This SDK helps you yo integrate from an iOS Device to NPS Services'
  s.preserve_paths = 'Frameworks/iovation.framework'
  s.vendored_frameworks = 'Frameworks/iovation.framework'


end
