//
//  PathMacro.swift
//  ZMWSwiftFramework
//
//  Created by zhangmingwei on 2017/12/13.
//  Copyright © 2017年 zhangmingwei. All rights reserved.
//

import Foundation

//获取程序的Home目录
let kPathHome       =       NSHomeDirectory()
// temp目录
let kPathTemp       =       NSTemporaryDirectory()
// 获取：document/library/cache 目录
let kPathDocument   =       NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentationDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
let kPathLibrary    =       NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.libraryDirectory,FileManager.SearchPathDomainMask.userDomainMask, true)
let kPathCache      =       NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory,FileManager.SearchPathDomainMask.userDomainMask, true)
/*
 // 获取document/library/cache的第二中方式:
 let kPathDocument2  =       NSHomeDirectory() + "/Documents"
 let kPathLibrary2   =       NSHomeDirectory() + "/Library"
 let kPathCache2     =       NSHomeDirectory() + "/Library/Caches"
 let kPathTemp2      =       NSHomeDirectory() + "/tmp"
 */
