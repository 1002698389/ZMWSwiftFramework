//
//  UIFont+IOSUtil.swift
//  ZMWSwiftFramework
//
//  Created by zhangmingwei on 2017/12/13.
//  Copyright © 2017年 zhangmingwei. All rights reserved.
//

import Foundation
import UIKit

extension UIFont {
    
    /**
     返回自定义的字体 -- 默认都用这个方法获取字体，除非粗体
     
     - parameter size: 需要的字体大小
     
     - returns: 返回自定义的字体
     */
    class func fontWithSize(size: CGFloat) -> UIFont {
        if let font = UIFont.init(name: "BigYoungMediumGB2.0", size: size) {
            return font
        }
        return UIFont.systemFont(ofSize: size)
    }
    
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

