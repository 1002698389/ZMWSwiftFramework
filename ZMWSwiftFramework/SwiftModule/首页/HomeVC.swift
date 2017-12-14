//
//  HomeVC.swift
//  ZMWSwiftFramework
//
//  Created by zhangmingwei on 2017/12/14.
//  Copyright © 2017年 zhangmingwei. All rights reserved.
//

import UIKit
import Spring

class HomeVC: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addTitle(titleStr: "首页")
        // 测试spring动画
        self.testSpring()
    }
    
    /// 测试spring动画
    func testSpring() {
        let btn1: SpringButton = SpringButton.getSpringButton(frame: CGRect.init(x: 100, y: 100, width: 100, height: 100), titleString: nil, font: nil, textColor: nil, bgImage: nil)
        btn1.backgroundColor = UIColor.red
        btn1.addRectCorner(5, corners: .allCorners)
        self.view.addSubview(btn1)
        // Rx的点击事件
        _ = btn1.rx.controlEvent(.touchUpInside).subscribe(onNext: { [weak self] in
//            self?.shakeAnimation(btn: btn1)
//            self?.popAnimation(btn: btn1)
            self?.groupAnimation(btn: btn1)
        })
    }
    
    // shake动画
    func shakeAnimation(btn: SpringButton) {
        btn.animation = "shake"
        btn.animate()
    }
    // pop动画
    func popAnimation(btn: SpringButton) {
        btn.animation = "pop"
        btn.duration = 1
        btn.force = 0.2 // 抖动的幅度大小。
        btn.animateTo()
    }
    // morph动画
    func morphAnimation(btn: SpringButton) {
        btn.animation = "morph"
        btn.animateTo()
    }
    // 组合动画
    func groupAnimation(btn: SpringButton) {
        UIView.animate(withDuration: 1.0, delay: 0, options: UIViewAnimationOptions.allowAnimatedContent, animations: {
            if (btn.x == 100) {
                btn.frame = CGRect.init(x: 200, y: 100, width: 100, height: 100)
            } else {
                btn.frame = CGRect.init(x: 100, y: 100, width: 100, height: 100)
            }
        }) { (finish)  in
            self.popAnimation(btn: btn)
        }
    }
    /* 动画种类
     shake
     pop
     morph
     squeeze
     wobble
     swing
     flipX
     flipY
     fall
     squeezeLeft
     squeezeRight
     squeezeDown
     squeezeUp
     slideLeft
     slideRight
     slideDown
     slideUp
     fadeIn
     fadeOut
     fadeInLeft
     fadeInRight
     fadeInDown
     fadeInUp
     zoomIn
     zoomOut
     flash
 */

}
