Pod::Spec.new do |s|
  s.name             = 'ASViewController'
  s.version          = '0.1.0'
  s.summary          = 'ViewController with auto scroll to active textField when keyboard is showing'
  
  s.description      = <<-DESC
auto scroll to active textField when keyboard is showing.
                       DESC

  s.homepage         = 'https://github.com/onmotion/ASViewController'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Alexandr Kozhevnikov' => 'onmotion1@gmail.com' }
  s.source           = { :git => 'https://github.com/onmotion/ASViewController.git', :tag => s.version.to_s }

  s.ios.deployment_target = '10.0'
  s.source_files = 'ASViewController/*.swift'
  
end
