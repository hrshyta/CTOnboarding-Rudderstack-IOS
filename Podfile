# Uncomment the next line to define a global platform for your project
 platform :ios, '9.0'

target 'RudderStackIOSSample' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  pod 'Rudder-CleverTap'
  pod 'Rudder'

  # Pods for RudderStackIOSSample

  target 'RudderStackIOSSampleTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'RudderStackIOSSampleUITests' do
    # Pods for testing
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings["EXCLUDED_ARCHS[sdk=iphonesimulator*]"] = "arm64"
    end
  end
end
