#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint lexactivator.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'lexactivator'
  s.version          = '3.0.0'
  s.summary          = 'LexActivator API wrapper for Dart (licensing library)'

  s.homepage         = 'https://cryptlex.com'
  
  s.license          = { :type => 'Proprietary', :file => '../LICENSE' }
  
  s.author           = { 'Cryptlex LLP' => 'support@cyptlex.com' }
  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'

  s.dependency 'Flutter'
  s.platform = :ios, '12.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  s.vendored_framework = 'LexActivator/LexActivator.xcframework'
end
