Pod::Spec.new do |spec|

  spec.name         = "HLHUD"
  spec.version      = "1.0.1"
  spec.summary      = "对MBProgressHUD简单封装"

  # 描述
  spec.description  = <<-DESC
  对MBProgressHUD简单封装，类方法使用更简单。
  DESC

  # 项目主页
  spec.homepage     = "https://github.com/huangchangweng/HLHUD"

  # 开源协议
  spec.license      = { :type => "MIT", :file => "LICENSE" }

  # 作者
  spec.author       = { "黄常翁" => "599139419@qq.com" }
  
  # 支持平台
  spec.platform     = :ios, "9.0"

  # git仓库，tag
  spec.source       = { :git => "https://github.com/huangchangweng/HLHUD.git", :tag => spec.version.to_s }
  
  spec.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }

  # 资源路径
  spec.source_files = "HLHUD/HLHUD/*.{h,m}"
  
  # 资源文件目录，可以在此目录下存放图片、xib等资源，可以使用通配符或者{png,jpg,xib}这样的方式来指定文件类型
  spec.resource     = "HLHUD/HLHUD/HLHUD.bundle"

  # 依赖系统库
  spec.frameworks   = "UIKit"

  # 依赖第三方库
  spec.dependency "MBProgressHUD", "1.2.0"

end
