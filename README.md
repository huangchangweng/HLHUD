# HLHUD
对MBProgressHUD简单封装

##### 支持使用CocoaPods引入, Podfile文件中添加: `暂未支持`

``` objc
pod 'HLHUD', '1.0.0'
```
HLHUD中全是类方法，导入即用。

基本使用方法:<p>

``` objc
// 显示成功样式HUD
+ (void)showSuccessMsg:(NSString *)msg;

// 显示成功样式HUD（可自定义图片）
+ (void)showSuccessMsg:(NSString *)msg
                 image:(UIImage *)image;

// 显示文字HUD
+ (void)showMsg:(NSString *)msg;

// 显示加载中HUD
+ (void)showLoading:(NSString *)msg;

// 隐藏所有HUD
+ (void)hide;
```

# Requirements

iOS 9.0 +, Xcode 7.0 +

# Version

* 1.0.0 :

  完成HLHUD基础搭建

# License
HLHUD is available under the MIT license. See the LICENSE file for more info.
