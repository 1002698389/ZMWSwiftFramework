//
//  UITableView+IOSUtil.swift
//  ZMWSwiftFramework
//
//  Created by zhangmingwei on 2017/12/13.
//  Copyright © 2017年 zhangmingwei. All rights reserved.
//

import Foundation
import UIKit

extension UITableView {
    public class func getTableView(frame: CGRect) {
        let tableV = UITableView.init(frame: frame, style: .plain)
        tableV.separatorColor = UIColor.getSeparatorColor()
        tableV.separatorInset = .zero
        tableV.tableFooterView = UIView()
        tableV.tableHeaderView = UIView()
        // iOS11后，不加这三句，会出现，reloadData的时候页面闪动，滚动到其他地方的bug。
        tableV.estimatedRowHeight = 0
        tableV.estimatedSectionHeaderHeight = 0
        tableV.estimatedSectionFooterHeight = 0

        
    }
}
