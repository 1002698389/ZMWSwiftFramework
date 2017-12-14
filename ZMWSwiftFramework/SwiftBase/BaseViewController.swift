//
//  BaseViewController.swift
//  ZMWSwiftFramework
//
//  Created by zhangmingwei on 2017/12/13.
//  Copyright © 2017年 zhangmingwei. All rights reserved.
//

import UIKit
import Cartography
import IQKeyboardManagerSwift
import RxCocoa
import RxSwift


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
    
    
    /// 统一添加标题的方法
    ///
    /// - Parameter titleStr: 标题文字
    func addTitle(titleStr: String?) {
        self.navigationItem.title = titleStr
    }

    // MARK: - 下个页面的返回按钮------（传空格就是只有一个箭头）。
    func baseNextPageTitleButton(nextPageTitle: String?) {
        var titleString: String;
        if (nextPageTitle == nil || nextPageTitle == "") {//传空 ，默认返回。
            titleString = NSLocalizedString("返回", comment: "")
        } else {
            titleString = nextPageTitle!;
        }
        //下一级界面返回按钮
        let temporaryBarButtonItem = UIBarButtonItem();
        temporaryBarButtonItem.title = titleString;
        self.navigationItem.backBarButtonItem = temporaryBarButtonItem;
    }
    
    
    /// 导航栏右边的按钮
    ///
    /// - Parameters:
    ///   - name: 按钮名字
    ///   - image: 按钮图片
    ///   - block: 点击按钮的回调
    func rightButton(name: String?, image: UIImage?, block:((_ button: UIButton?) -> Void)?) {
        let btn = UIButton(type: .custom)
        btn.frame = CGRect.init(x: 0, y: 0, width: 100, height: 44)
        btn.contentHorizontalAlignment = .right
        btn.titleLabel?.font = FONT_PingFang(fontSize: 15)
        if let image = image {
            btn.setImage(image, for: .normal)
        }
        if let name = name {
            btn.setTitle(name, for: .normal)
            btn.setTitleColor(UIColor.getContentColorSwift(), for: .normal)
            let width = btn.title(for: .normal)?.sizeFor(size: CGSize.init(width: SCREEN_WIDTH, height: 44), font: FONT_PingFang(fontSize: 15), lineBreakMode: .byWordWrapping).width ?? 60.0
            btn.frame = CGRect.init(x: 0, y: 0, width: width, height: 44)
        } else {
            btn.frame = CGRect.init(x: 0, y: 0, width: 60, height: 44)
        }
        
        let rightItem = UIBarButtonItem(customView: btn)
        self.navigationItem.rightBarButtonItem = rightItem
        let naviSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil)
        naviSpace.width = -5 // 值越大越靠左边
        self.navigationItem.rightBarButtonItems = [naviSpace,rightItem]
        if let block = block {
            //            btn.rac_signal(for: .touchUpInside).subscribeNext({ UIButton in
            //                block(btn)
            //            })
            _ = btn.rx.controlEvent(.touchUpInside).subscribe({_ in
                block(btn)
            })
        }
    }
    
    func rightView(tempV: UIView, block:((_ tempV: UIView) -> Void)?) {
        
        let rightItem = UIBarButtonItem(customView: tempV)
        self.navigationItem.rightBarButtonItem = rightItem
        let naviSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil)
        naviSpace.width = -5 // 值越大越靠左边
        self.navigationItem.rightBarButtonItems = [naviSpace,rightItem]
        if let block = block {
            tempV.setTapActionWith({
                block(tempV)
            })
        }
    }
    
    /// 导航栏右边的按钮
    ///
    /// - Parameters:
    ///   - name: 按钮名字
    ///   - image: 按钮图片
    ///   - block: 点击按钮的回调
    func leftButton(name: String?, image: UIImage?, block:((_ button: UIButton?) -> Void)?) {
        let btn = UIButton(type: .custom)
        btn.frame = CGRect.init(x: 0, y: 0, width: 100, height: 44)
        btn.contentHorizontalAlignment = .left
        btn.titleLabel?.font = FONT_PingFang(fontSize: 15)
        if let image = image {
            btn.setImage(image, for: .normal)
        }
        if let name = name {
            btn.setTitle(name, for: .normal)
            btn.setTitleColor(UIColor.getContentColorSwift(), for: .normal)
            let width = btn.title(for: .normal)?.sizeFor(size: CGSize.init(width: SCREEN_WIDTH, height: 44), font: FONT_PingFang(fontSize: 15), lineBreakMode: .byWordWrapping).width ?? 60.0
            btn.frame = CGRect.init(x: 0, y: 0, width: width, height: 44)
        } else {
            btn.frame = CGRect.init(x: 0, y: 0, width: 60, height: 44)
        }
        
        let leftItem = UIBarButtonItem(customView: btn)
        self.navigationItem.leftBarButtonItem = leftItem
        let naviSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.fixedSpace, target: nil, action: nil)
        naviSpace.width = -5 // 值越大越靠左边
        self.navigationItem.leftBarButtonItems = [naviSpace,leftItem]
        if let block = block {
            //            btn.rac_signal(for: .touchUpInside).subscribeNext({ UIButton in
            //                block(btn)
            //            })
            _ = btn.rx.controlEvent(.touchUpInside).subscribe({_ in
                block(btn)
            })
        }
    }
    
    /// 可以查看某个页面是否引起的循环引用
    deinit {
        print("页面: \(self.className()) 释放了内存")
    }
}
