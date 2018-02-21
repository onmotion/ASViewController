Pod::Spec.new do |s|
  s.name             = 'ASViewController'
  s.version          = '0.2.3'
  s.summary          = 'ViewController with auto scroll to active textField when keyboard is showing'
  
  s.description      = <<-DESC
Auto scroll to active textField when keyboard is showing. When keyboard is showing up, the keyboard can covering active textField. This Pod prevents that behavior.
                       DESC

  s.homepage         = 'https://github.com/onmotion/ASViewController'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Alexandr Kozhevnikov' => 'onmotion1@gmail.com' }
  s.source           = { :git => 'https://github.com/onmotion/ASViewController.git', :tag => s.version.to_s }
  s.swift_version    = '4.0.0'
  s.ios.deployment_target = '8.0'
  s.source_files = 'ASViewController/*.swift'
  
end
