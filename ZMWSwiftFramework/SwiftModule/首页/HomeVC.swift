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
    }
    
    func testSpring() {
        let btn1: SpringButton = SpringButton.getSpringButton(frame: CGRect.init(x: 100, y: 100, width: 100, height: 100), titleString: nil, font: nil, textColor: nil, bgImage: nil)
        btn1.backgroundColor = UIColor.red
        self.view.addSubview(btn1)
        // Rx的点击事件
        _ = btn1.rx.controlEvent(.touchUpInside).subscribe(onNext: {
            btn1.animate()
        })
    }

}
