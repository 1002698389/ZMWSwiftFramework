//
//  Tool.swift
//  ZMWSwiftFramework
//
//  Created by zhangmingwei on 2017/12/13.
//  Copyright © 2017年 zhangmingwei. All rights reserved.
//

import Foundation
import UIKit
//import CryptoSwift      // md5加密

public class Tool {
    /// 保存NSArray 数据到本地文件
    public class func saveDataToFile(resultArray: NSArray! , fileName: String!) {
        let jsonString : NSString = self.toJSONString(arr: resultArray)!
        let jsonData :Data? = jsonString.data(using: UInt(String.Encoding.utf8.hashValue))
        
        let file = fileName
        let fileUrl = URL(fileURLWithPath: kPathTemp).appendingPathComponent(file!)
        print("fileUrl = \(fileUrl)")
        let data = NSMutableData()
        data.setData(jsonData!)
        if data.write(toFile: fileUrl.path, atomically: true) {
            print("保存成功：\(fileUrl.path)")
        } else {
            print("保存失败：\(fileUrl.path)")
        }
    }
    
    /// 从本地获取json数据
    public class func getJsonFromFile(fileName: String) -> Any? {
        let file = fileName
        let fileUrl = URL(fileURLWithPath: kPathTemp).appendingPathComponent(file)
        if let readData = NSData.init(contentsOfFile: fileUrl.path) {
            let jsonValue = try? JSONSerialization.jsonObject(with: readData as Data, options: .allowFragments)
            print("获取成功：\(fileUrl.path)")
            return jsonValue
        } else {
            print("获取失败：\(fileUrl.path)")
            return nil
        }
    }
    
    /// 转换数组到JSONStirng
    public class func toJSONString(arr: NSArray!) -> NSString? {
        guard let data = try? JSONSerialization.data(withJSONObject: arr, options: .prettyPrinted),
            // Notice the extra question mark here!
            let strJson = NSString(data: data, encoding: String.Encoding.utf8.rawValue) else {
                //throws MyError.InvalidJSON
                return nil
        }
        return strJson
    }
    
    /// 加密算法
    public class func md5Action(origin: String!, _ salt: String?) -> String! {
        var str : String! = origin
        if let salt = salt {
            str = origin + salt
        }
        //        let resultString = str.md5()
        //        return resultString
        return str
    }
}
