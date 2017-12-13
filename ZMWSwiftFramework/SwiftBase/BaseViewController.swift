//
//  BaseViewController.swift
//  ZMWSwiftFramework
//
//  Created by zhangmingwei on 2017/12/13.
//  Copyright © 2017年 zhangmingwei. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 设置导航栏颜色
        let naviBgImage = UIImage.imageWithColor(color: UIColor.getNavigationBarColor(), size: CGSize.init(width: SCREEN_WIDTH, height: NAVIGATIONBAR_HEIGHT))
        navigationController?.navigationBar.setBackgroundImage(naviBgImage, for: .default)
        // 添加这行就可以实现导航栏下面的横线隐藏了。
        //navigationController?.navigationBar.shadowImage = UIImage()
        // 设置统一的背景颜色
        self.view.backgroundColor = UIColor.getBackgroundColor()
    }

}
