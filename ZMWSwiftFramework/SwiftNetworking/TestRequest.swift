//
//  TestRequest.swift
//  ZMWSwiftFramework
//
//  Created by zhangmingwei on 2017/12/13.
//  Copyright © 2017年 zhangmingwei. All rights reserved.
//

import UIKit
import Alamofire

class TestRequest: BaseRequestManager {
    
    class func contentRequestAction(page: Int, completion:@escaping(_ isSuccessed:Bool,_ code:Int?,_ jsonValue:AnyObject?) -> ()) {
        // url
        let urlString = String.init(format: "%@%@", kBase_url,kContentUrl)
        // 参数
        let parameters = ["page" : page, "pageSize" : 20, "key" : kRequest_key] as [String : Any]
        BaseRequestManager.baseRequestAction(urlString:urlString, method: HTTPMethod.get, parameters: parameters, completion: completion)
    }
}
