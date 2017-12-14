//
//  UIButton+IOSUtil.swift
//  ZMWSwiftFramework
//
//  Created by zhangmingwei on 2017/12/13.
//  Copyright © 2017年 zhangmingwei. All rights reserved.
//

import Foundation
import UIKit
import Spring           // 动画库，需要继承相应的类

extension UIButton {
    /**
     封装的UIButton 初始化
     
     - parameter frame:       位置大小
     - parameter titleString: 按钮标题
     - parameter font:        字体
     - parameter textColor:   标题颜色
     - parameter bgImage:     按钮背景图片
     
     - returns: UIButton
     */
    public class func getButton(frame:CGRect ,titleString:String?, font:UIFont?, textColor:UIColor?, bgImage:UIImage?) -> UIButton {
        let aButton = UIButton()
        aButton.frame = frame
        aButton.backgroundColor = UIColor.clear
        aButton .setTitle(titleString, for: UIControlState.normal)
        aButton .setTitleColor(textColor, for: UIControlState.normal)
        aButton.titleLabel?.font = font
        if bgImage != nil { // bgImage 必须是可选类型，否则警告
            aButton .setBackgroundImage(bgImage, for: UIControlState.normal)
        }
        
        return aButton
    }
}

// SpringButton 就是继承UIButton
extension SpringButton {
    /**
     封装的UIButton 初始化
     
     - parameter frame:       位置大小
     - parameter titleString: 按钮标题
     - parameter font:        字体
     - parameter textColor:   标题颜色
     - parameter bgImage:     按钮背景图片
     
     - returns: UIButton
     */
    public class func getSpringButton(frame:CGRect ,titleString:String?, font:UIFont?, textColor:UIColor?, bgImage:UIImage?) -> SpringButton {
        let aButton = SpringButton()
        aButton.frame = frame
        aButton.backgroundColor = UIColor.clear
        aButton .setTitle(titleString, for: UIControlState.normal)
        aButton .setTitleColor(textColor, for: UIControlState.normal)
        aButton.titleLabel?.font = font
        if bgImage != nil { // bgImage 必须是可选类型，否则警告
            aButton .setBackgroundImage(bgImage, for: UIControlState.normal)
        }
        
        return aButton
    }
}
