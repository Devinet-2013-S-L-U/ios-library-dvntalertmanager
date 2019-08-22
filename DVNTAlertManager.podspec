Pod::Spec.new do |s|
  
  s.name             = 'DVNTAlertManager'
  s.version          = '1.0.7'
  s.summary          = 'An amazing library that allows you to easily create Alerts.'
  s.description      = 'This library allows you to create different kinds of alerts easily using different designs (iOS default style or Meterial).'
  s.homepage         = 'https://www.devinet.es'
  s.license          = { :type => 'Copyright (c) 2019 Devinet 2013, S.L.U.', :file => 'LICENSE' }
  s.author           = { 'Raúl Vidal Muiños' => 'contacto@devinet.es' }
  s.social_media_url = 'https://twitter.com/devinet_es'
  s.platform         = :ios, '9.3'
  s.ios.deployment_target = '9.3'
  s.swift_versions   = ['3.0', '4.0', '4.1', '4.2', '5.0']
  s.source           = { :git => 'https://bitbucket.org/Devinet_Team/ios-library-dvntalertmanager.git', :tag => s.version.to_s }
  s.frameworks       = 'UIKit'
  s.source_files     = 'DVNTAlertManager/Classes/**/*'
  s.exclude_files    = 'DVNTAlertManager/**/*.plist'
  s.resource_bundles = { 'DVNTAlertManagerResources' => ['DVNTAlertManager/Assets/**/*.strings'] }
  
  s.dependency 'MaterialComponents', '~>88.0.0'
  s.dependency 'DVNTStringExtension', '~>1.0.3'
  s.dependency 'DVNTUIWindowExtension', '~>1.0.4'
end
