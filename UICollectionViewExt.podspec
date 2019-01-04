#
# Be sure to run `pod lib lint UICollectionViewExt.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'UICollectionViewExt'
  s.version          = '1.0.6'
  s.summary          = 'UICollectionViewLayout for left align、waterfall and UICollectionView category for paging enabled'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/ClaudeLi/UICollectionViewExt'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ClaudeLi' => 'claudeli@yeah.net' }
  s.source           = { :git => 'https://github.com/ClaudeLi/UICollectionViewExt.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.subspec 'UICollectionViewLeftAlignLayout' do |ss|
    ss.source_files = 'UICollectionViewExt/UICollectionViewLeftAlignLayout/**/*'
  end

  s.subspec 'UICollectionViewWaterfallLayout' do |ss|
    ss.source_files = 'UICollectionViewExt/UICollectionViewWaterfallLayout/**/*'
  end

  s.subspec 'UIPagingEnabled' do |ss|
    ss.source_files = 'UICollectionViewExt/UIPagingEnabled/**/*'
  end
  
  # s.resource_bundles = {
  #   'UICollectionViewExt' => ['UICollectionViewExt/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
