inhibit_all_warnings!
source 'https://gitee.com/yunzhoucomm/yzwebrtc-sdk' # 为了加快webrtc-sdk的下载速度弄的映射
source 'https://github.com/CocoaPods/Specs.git'#cocoapods 公用仓库地址


platform :ios, '12.0'
# 导入我们自定义的脚本
require_relative './Podfile_ReactNative'
# 执行我们编写的RN环境检测代码
installReactNativeSdk()
# 设置RN配置 依赖，这里需要注意，不要使用 ../node_modules/,而是直接node_modules/
require_relative 'node_modules/react-native/scripts/react_native_pods'
require_relative 'node_modules/@react-native-community/cli-platform-ios/native_modules'

target 'Redwhale' do
  
  # 设置RN Path 依赖
  use_react_native!(:path => "node_modules/react-native")
  
  #rn环境
  pod 'RNCClipboard', :path => './node_modules/@react-native-community/clipboard'
  pod 'RNGestureHandler', :path => './node_modules/react-native-gesture-handler'
  pod 'RNSVG', :path => './node_modules/react-native-svg'
  pod 'RNScreens', :path => './node_modules/react-native-screens'
  pod 'react-native-receive-sharing-intent', :path => './node_modules/react-native-receive-sharing-intent'
  pod 'react-native-pager-view', :path => './node_modules/react-native-pager-view'
  pod 'react-native-safe-area-context', :path => './node_modules/react-native-safe-area-context'
  pod 'react-native-keep-awake', :path => './node_modules/@sayem314/react-native-keep-awake'
  pod 'react-native-background-timer', :path => './node_modules/react-native-background-timer'
  
  pod 'ReactNativeAudioToolkit', :path => './node_modules/@yunzhoukit/react-native-audio-toolkit'
  pod 'yunzhou-react-native', :path => './node_modules/@yunzhoukit/yunzhou-react-native'
  pod 'yunzhoukit-react-native-utils', :path => './node_modules/@yunzhoukit/react-native-utils'
  pod 'yunzhou-react-native-orientation-locker', :path => './node_modules/@yunzhoukit/react-native-orientation-locker'
  pod 'yunzhou-react-native-webrtc', :path => './node_modules/@yunzhoukit/react-native-webrtc'



  # 其他三方库
  pod 'Masonry'

end

#创建需要进行处理的动态库的数组
needStaticAry = Array['RNScreens','react-native-receive-sharing-intent','RNSVG']

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ENABLE_BITCODE'] = 'NO'
      config.build_settings['GCC_PREPROCESSOR_DEFINITIONS'] ||= ['$(inherited)', '_LIBCPP_ENABLE_CXX17_REMOVED_UNARY_BINARY_FUNCTION']
    end
    
    # 针对Bundle类型的做强制不签名 https://juejin.cn/post/7143160997459542046
    if target.respond_to?(:product_type) and target.product_type == "com.apple.product-type.bundle"
      target.build_configurations.each do |config|
          config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
          config.build_settings['EXPANDED_CODE_SIGN_IDENTITY'] = ""
          config.build_settings['CODE_SIGNING_REQUIRED'] = "NO"
      end
    end
    
    #打印所有的target，这里的target是一个对象，获取名字需要用target.name
#    puts "  ||-#{target}"
    needStaticAry.each do |staticTarget|
        if target.name == staticTarget
            target.build_configurations.each do |config|
                #将mach-o改为静态库
                config.build_settings['MACH_O_TYPE'] = "staticlib"
            end
        end
    end
  end
end
