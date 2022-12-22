Pod::Spec.new do |s|
  
  s.name             = 'DVNTAlertManager'
  s.version          = '1.2.14'
  s.summary          = 'An amazing library that allows you to easily create Alerts.'
  s.description      = 'This library allows you to create different kinds of alerts easily using different designs (iOS default style only).'
  s.homepage         = 'https://www.devinet.es'
  s.license          = { :type => 'Copyright (c) 2021 Devinet 2013, S.L.U.', :file => 'LICENSE' }
  s.author           = { 'Raúl Vidal Muiños' => 'contacto@devinet.es' }
  s.social_media_url = 'https://twitter.com/devinet_es'

  s.ios.deployment_target = '16.2'

  s.swift_versions   = ['3.0', '4.0', '4.1', '4.2', '5.0', '5.1', '5.2', '5.3', '5.4', '5.5', '5.6', '5.7']
  s.source           = { :git => 'https://bitbucket.org/Devinet_Team/ios-library-dvntalertmanager.git', :tag => s.version.to_s }
  s.frameworks       = 'UIKit'
  s.source_files     = 'Sources/DVNTAlertManager/Classes/**/*'
  s.exclude_files    = 'Sources/DVNTAlertManager/**/*.plist'
  s.resource_bundles = { 'DVNTAlertManagerResources' => ['Sources/DVNTAlertManager/Assets/**/*.strings'] }
  
  s.dependency 'DVNTStringExtension', '~>1.1.4'
  s.dependency 'DVNTUIWindowExtension', '~>1.0.14'
end
