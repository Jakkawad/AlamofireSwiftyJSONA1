platform :ios, '10.0'
use_frameworks!

target 'AlamofireSwiftyJSONA1' do
pod 'Alamofire', :git => 'https://github.com/Alamofire/Alamofire.git', :tag => '4.0.0'
pod 'SwiftyJSON', '3.0.0'
end
post_install do |installer|
installer.pods_project.targets.each do |target|
target.build_configurations.each do |config|
config.build_settings['SWIFT_VERSION'] = '3.0'
end
end
end
