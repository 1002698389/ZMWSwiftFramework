//
//  UIScreen+JCScale.swift
//  JCSwiftKitDemo
//
//  Created by molin.JC on 2017/1/1.
//  Copyright © 2017年 molin. All rights reserved.
//

import UIKit

var kScale = "kScale"

func JCScreenSetScale(size: CGSize) {
    let screenSize = UIScreen.main.bounds.size;
    var width = screenSize.width;
    if screenSize.width > screenSize.height {
        width = screenSize.height;
    }
    let scale = width / size.width;
    objc_setAssociatedObject(UIScreen.main, &kScale, scale, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN);
}

func JCScreenGetScale() -> CGFloat {
    return UIScreen.main._scale_;
}

extension UIScreen {
    
    var _scale_: CGFloat {
        get {
            let scaleF = objc_getAssociatedObject(self, &kScale);
            if (scaleF != nil) {
                return scaleF as! CGFloat;
            }
            return self.scale;
        }
    }
    
    /// 获取当前屏幕的bounds
    func currentBounds() -> CGRect {
        return self.boundsForOrientation(orientation: UIApplication.shared.statusBarOrientation)
    }
    
    /// 根据屏幕的旋转方向设置bounds
    func boundsForOrientation(orientation: UIInterfaceOrientation) -> CGRect {
        var bounds = self.bounds;
        if UIInterfaceOrientationIsLandscape(orientation) {
            let buffer = bounds.size.width;
            bounds.size.width = bounds.size.height;
            bounds.size.height = buffer;
        }
        return bounds;
    }
}
