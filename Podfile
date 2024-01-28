platform :ios, '12.0'
use_frameworks!

inhibit_all_warnings!

target 'JetDevsHomeWork' do
  pod 'RxSwift', '~> 5.1.0'
  pod 'SwiftLint'
  pod 'Kingfisher', '~> 7.0'
  pod 'SnapKit'
  pod 'Alamofire'
  pod 'ProgressHUD'
  pod 'TPKeyboardAvoiding'

  target 'JetDevsHomeWorkTests' do
    inherit! :search_paths
  end

  target 'JetDevsHomeWorkUITests' do
    inherit! :complete
  end  

end

post_install do |installer|
    installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
            end
        end
    end
end
