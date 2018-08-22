Pod::Spec.new do |s|
s.name         = "LZCommonSDK"    #存储库名称
s.version      = "1.0.7"      #版本号，与tag值一致
s.summary      = "a repository demo"  #简介
s.description  = "a repository demo"  #描述
s.homepage     = "https://github.com/linzhenwei8888/LZCommonSDK"      #项目主页，不是git地址
s.license      = { :type => "MIT", :file => "LICENSE" }   #开源协议
s.author             = { "linzhenwei8888" => "linzhenwei8888@gmail.com" }  #作者
s.platform     = :ios, "7.0"                  #支持的平台和版本号
s.source       = { :git => "https://github.com/linzhenwei8888/LZCommonSDK.git", :tag => "0.0.1" }         #存储库的git地址，以及tag值
s.public_header_files = 'LZCommonSDK/LZCommonSDK/LZCommonSDK/**/*.h'#公共的头文件地址
s.source_files  =  "LZCommonSDK/LZCommonSDK/LZCommonSDK/**/*.{h,m}" #需要托管的源代码路径
s.requires_arc = true #是否支持ARC

s.dependency "Masonry"   #所依赖的第三方库，没有就不用写
s.dependency "SVProgressHUD"
s.dependency "Aspects"
s.dependency "SSKeychain"
s.dependency "RegexKitLite"

end
