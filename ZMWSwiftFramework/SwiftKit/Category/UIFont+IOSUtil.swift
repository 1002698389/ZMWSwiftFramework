//
//  UIFont+IOSUtil.swift
//  ZMWSwiftFramework
//
//  Created by zhangmingwei on 2017/12/13.
//  Copyright © 2017年 zhangmingwei. All rights reserved.
//

import Foundation
import UIKit

/// 统一获取字体的方法
public func FONT_PingFang(fontSize: CGFloat) -> UIFont {
    var font = UIFont.init(name: "PingFangSC-Regular", size: fontSize)
    if !IS_IOS9 {
        font = UIFont.init(name: "Helvetica", size: fontSize)
    }
    return font!
}

extension UIFont {
    
    /// systemFontOfSize:
    private class func scaleFont(ofSize: CGFloat) -> UIFont {
        let size = ofSize * UIScreen.main._scale_;
        return UIFont.systemFont(ofSize: size);
    }
    
    /// fontWithName:size:
    private class func scaleFont(name: String, ofSize: CGFloat) -> UIFont {
        let size = ofSize * UIScreen.main._scale_;
        return UIFont.init(name: name, size: size)!;
    }
    
    /// 粗体
    class func fontNameWithHelveticaBold(size: CGFloat) -> UIFont {
        return UIFont.scaleFont(name: "Helvetica-Bold", ofSize: size);
    }
    
    /// 斜体
    class func fontNameWithHelveticaOblique(size: CGFloat) -> UIFont {
        return UIFont.scaleFont(name: "Helvetica-Oblique", ofSize: size);
    }
    
    /// 加载本地TTF字体, 字体大小默认15.0f
    class func fontWithTTF(atPath: String) -> UIFont {
        return UIFont.fontWithTTF(atPath: atPath, size: 15.0);
    }
    
    /// 加载本地TTF字体
    class func fontWithTTF(atPath: String, size: CGFloat) -> UIFont {
        let foundFile = FileManager.default.fileExists(atPath: atPath);
        if !foundFile {
            return UIFont.systemFont(ofSize: size);
        }
        
        let fontURL = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, atPath as CFString!, CFURLPathStyle.cfurlposixPathStyle, false);
        let dataProvider = CGDataProvider.init(url: fontURL!);
        let graphicsFont = CGFont.init(dataProvider!);
        let smallFont = CTFontCreateWithGraphicsFont(graphicsFont!, size, nil, nil);
        return smallFont as UIFont;
    }
}

