#
# Be sure to run `pod lib lint AutoSearchBar.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'AutoSearchBar'
  s.version          = '0.2.0'
  s.summary          = 'A search bar will auto call UISearchBarDelegate.searchBarSearchButtonClicked(_:) after text changed.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This a auto search bar, will auto touch UISearchBarDelegate.searchBarSearchButtonClicked(_:) after search text changed, the dely time is 0.5 second.
                       DESC

  s.homepage         = 'https://github.com/andrew020/AutoSearchBar'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'andrew' => 'andrew2007@foxmail.com' }
  s.source           = { :git => 'https://github.com/andrew020/AutoSearchBar.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.swift_version = '4.2'
  s.source_files = 'AutoSearchBar/Classes/**/*'
  s.frameworks = 'UIKit'
end
