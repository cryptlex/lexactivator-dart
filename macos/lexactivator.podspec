#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint lexactivator.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'lexactivator'
  s.version          = '3.0.0'
  s.summary          = 'LexActivator API wrapper for Dart (licensing library)'
  
  s.homepage         = 'https://cryptlex.com'
  
  s.license          = { :type => 'MIT', :file => '../LICENSE' }
  
  s.author           = { 'Cryptlex' => 'qa@cyptlex.com' }
  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.dependency 'FlutterMacOS'
  # s.library '../' 

  s.platform = :osx, '10.11'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
  s.vendored_library = 'darwin-universal/libLexActivator.dylib'
end