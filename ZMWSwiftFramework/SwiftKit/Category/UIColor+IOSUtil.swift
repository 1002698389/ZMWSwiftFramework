//
//  UIColor+IOSUtil.swift
//  ZMWSwiftFramework
//
//  Created by zhangmingwei on 2017/12/13.
//  Copyright © 2017年 zhangmingwei. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    
    /// 十六进制
    class func colorRGB16(value: __uint32_t) -> UIColor {
        return UIColor.colorRGB16(value: value, alphe: 1.0);
    }
    
    /// 十六进制
    class func colorRGB16(value: __uint32_t, alphe: CGFloat) -> UIColor {
        return UIColor.init(red: CGFloat((value & 0xFF0000) >> 16) / 255.0,
                            green: CGFloat((value & 0xFF00) >> 8) / 255.0,
                            blue: CGFloat((value & 0xFF)) / 255.0,
                            alpha: alphe);
    }
    
    
    private func RGB_red() -> CGFloat {
        let r = self.cgColor.components
        return r![0];
    }
    
    private func RGB_green() -> CGFloat {
        let g = self.cgColor.components;
        if (self.cgColor.colorSpace?.model == CGColorSpaceModel.monochrome) {
            return g![0];
        }
        return g![1];
    }
    
    private func RGB_blue() -> CGFloat {
        let b = self.cgColor.components;
        if (self.cgColor.colorSpace?.model == CGColorSpaceModel.monochrome) {
            return b![0];
        }
        return b![2];
    }
    
    private func alpha() -> CGFloat {
        return self.cgColor.alpha;
    }
    
    /// 将颜色转换成16进制的字符串
    func stringForRGB16() -> String {
        let r = Int(self.RGB_red() * 255);
        let g = Int(self.RGB_green() * 255);
        let b = Int(self.RGB_blue() * 255);
        let stringColor = String.init(format: "#%02X%02X%02X", r, g, b);
        return stringColor;
    }

}

// MARK: - 色系
extension UIColor {
    /// 统一页面背景色 - 浅白色
    class func getBackgroundColor() -> UIColor {
        return UIColor.colorRGB16(value: 0xfafafa);
    }
    /// 导航栏颜色 - 白色
    class func getNavigationBarColor() -> UIColor {
        return UIColor.colorRGB16(value: 0xFFFFFF);
    }
    /// 分割线的颜色 -
    class func getSeparatorColor() -> UIColor {
        return UIColor.colorRGB16(value: 0xcccaca);
    }
    
    /// 获取红色的颜色 FF5906
    class func getRedColorSwift() -> UIColor {
        return UIColor.colorRGB16(value: 0xFF5906);
    }
    
    /// 获取次级内容的字体颜色 aaaaaa - 最浅的黑  ----- 也可以作为按钮不可点击的颜色
    class func getContentSecondColorSwift() -> UIColor {
        return UIColor.colorRGB16(value: 0xaaaaaa);
    }
    
    /// 获取内容的字体颜色 6b6b6b - 二级黑
    class func getContentColorSwift() -> UIColor {
        return UIColor.colorRGB16(value: 0x6b6b6b);
    }
    
    /// 获取标题的字体颜色 333333 - 黑
    class func getTitleColorSwift() -> UIColor {
        return UIColor.colorRGB16(value: 0x333333);
    }
    
    /// 获取主题色 23aefe - 蓝色
    class func getMainColorSwift() -> UIColor {
        return UIColor.colorRGB16(value: 0x23aefe);
    }
    
    /// 获取表格分割线的颜色 ececec - 淡淡的黑
    class func getSeparatorColorSwift() -> UIColor {
        return UIColor.colorRGB16(value: 0xececec);
    }

}

