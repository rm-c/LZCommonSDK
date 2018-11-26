#
# Be sure to run `pod lib lint LZCommonSDK.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LZCommonSDK'
  s.version          = '2.2.0'
  s.summary          = 'LZCommonSDK.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/linzhenwei8888/LZCommonSDK'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'linzhenwei8888' => 'linzhenwei8888@gmail.com' }
  s.source           = { :git => 'https://github.com/linzhenwei8888/LZCommonSDK.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'LZCommonSDK/Classes/**/*', 'LZCommonSDK/Classes/helper/**/*', 'LZCommonSDK/Classes/thirdParty/**/*', 'LZCommonSDK/Classes/utility/**/*'
  
  # s.resource_bundles = {
  #   'LZCommonSDK' => ['LZCommonSDK/Assets/*.png']
  # }

  s.public_header_files = 'LZCommonSDK/Classes/**/*.h', 'LZCommonSDK/Classes/helper/**/*.h', 'LZCommonSDK/Classes/thirdParty/**/*.h', 'LZCommonSDK/Classes/utility/**/*.h'
  s.frameworks = 'UIKit', 'MapKit', 'MobileCoreServices'
  # s.dependency 'AFNetworking', '~> 2.3'
  s.dependency 'SSKeychain'
  s.dependency 'Aspects'
  s.dependency 'RegexKitLite'
  s.dependency 'SDAutoLayout'                              #高少东的autolayout库
  
  # s.dependency 'JSONModel'
  # s.dependency 'Masonry'                                     #autolayout库
  # s.dependency 'SDWebImage'                                 #加载网络图片的库
  # s.dependency 'pop'                                       #facebook的动画库
  # s.dependency 'FCFileManager'                               #替代NSFileManager的文件处理库
  # s.dependency 'Reachability'                               #网络状态监测的库
  # s.dependency 'IQKeyboardManager'                             #第三方键盘
  # s.dependency 'SVProgressHUD'                                #通用的HUD
  # s.dependency 'SCLAlertView-Objective-C'
  # s.dependency 'TCBlobDownload'                            #文件下载的库，比较旧
  # s.dependency 'GBDeviceInfo'                              #系统版本和手机型号判断的库
  # s.dependency 'IBActionSheet'
  # s.dependency 'MJExtension'                               #模型和字段转换的库
  # s.dependency 'JTSImageViewController'                    #查看大图的库
  # s.dependency 'FDFullscreenPopGesture'                    #全屏滑动返回手势
  # s.dependency 'MJRefresh'                                 #上拉下拉刷新控件
  # s.dependency 'Doppelganger'                              #UITableView和UICollectionView数据变化时加入切换动画
  # s.dependency 'AFNetworking', '3.0.0'                     #网络通讯库
  # s.dependency 'SDCycleScrollView','1.65'                 #无限循环滚动的轮播图
  # s.dependency 'BAButton'                                  #博爱的按钮category
  # s.dependency 'EaseMobSDKFull'    #, :git => 'https://github.com/easemob/sdk-ios-cocoapods-integration.git'   #2.3.3
  # s.dependency 'HexColors','4.0.0'                         #4.0之后都是swift版本了
  # s.dependency 'MBProgressHUD'
  # s.dependency 'DACircularProgress'
  # s.dependency 'FSCalendar'                                  #日历
  # s.dependency 'UITextView+Placeholder'
  # s.dependency 'LGActionSheet'
  # s.dependency 'NYSegmentedControl'
  # s.dependency 'LGAlertView'                                  #替代LGPlusButtonsView
  # s.dependency 'GPUImage'                                  #滤镜效果，个人衣柜的板块需要用到
  # s.dependency 'ZLPhotoBrowser'
  # s.dependency 'BANetManager', '2.3.8.1'
  #  s.dependency 'MLLabel'
  # s.dependency 'MLeaksFinder'                              #检测内存泄漏
  # s.dependency 'LLSimpleCamera'                            #摄像机的库
  # s.dependency 'SMVerticalSegmentedControl'                #纵向的segment
  # s.dependency 'VOSegmentedControl'                        #加强版的横向segment
  # s.dependency 'ZFPlayer'                                  #视频播放的库
  # s.dependency 'BlocksKit'
  #AXWebViewController需要用的库
  # s.dependency 'AXNavigationBackItemInjection'
  # s.dependency 'NJKWebViewProgress'
  # s.dependency 'Aspects'
  # s.dependency 'AXPracticalHUD'
  
  #高德开放平台的库
  # s.dependency 'AMap2DMap'                                 #2D地图SDK
  # s.dependency 'AMapSearch'                                #搜索功能
  # s.dependency 'AMapLocation'                              #定位功能
  
  #微信QQ开发库
  # s.dependency 'WechatOpenSDK'
  # s.dependency 'BlockUI', '~> 1.0.0'
  
end
