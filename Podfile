# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'AvengersApp' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for AvengersApp

pod 'Alamofire'
pod 'Kingfisher'
pod 'CryptoSwift'
pod 'ANActivityIndicator'
pod 'SwiftMessages'

target 'AvengersAppTests' do
 inherit! :search_paths
pod 'Quick'
pod 'Nimble'
pod 'Alamofire'
end


end


post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '5.0'
    end
  end
end

