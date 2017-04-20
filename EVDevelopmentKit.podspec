#
# Be sure to run `pod lib lint EVDevelopmentKit.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'EVDevelopmentKit'
  s.version          = '0.1.0'
  s.summary          = 'A bunch of useful things to use in many projects.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This pod includes classes extensions and utility code that I use in my projects.
                       DESC

  s.homepage         = 'https://github.com/EstebanVallejo/EVDevelopmentKit'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Esteban Vallejo' => 'esteb.vallejo@gmail.com' }
  s.source           = { :git => 'https://github.com/EstebanVallejo/EVDevelopmentKit.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'EVDevelopmentKit/Classes/**/*'
  
  # s.resource_bundles = {
  #   'EVDevelopmentKit' => ['EVDevelopmentKit/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
