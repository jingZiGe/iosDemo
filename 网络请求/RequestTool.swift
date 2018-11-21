//
//  RequestTool.swift
//  ECMPMobile
//
//  Created by Zhenyi Li on 2018/11/20.
//  Copyright © 2018 HXMobile. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

private let ToolInstance = RequestTool()
class RequestTool: NSObject {
    
    
    class var SharedInstance : RequestTool {
        
        return ToolInstance
        
    }
    
    
    
}
extension RequestTool
{
    /// 取消所有请求
    func cancelAllDataRequest()
        
    {
        let manager =  Alamofire.SessionManager.default
        manager.session.getTasksWithCompletionHandler { dataTasks, uploadTasks, downloadTasks in
            dataTasks.forEach { $0.cancel() }
            
        }
        
        
        
        
    }
    
    func GetRequest(RequestUrl:String,Parmas:[String : Any ]?, SuccessHandler:@escaping (_ SuccessData:[String:Any] )->Void , FailHandler:@escaping (_ FailData:[String:Any] )->Void ) {
        
        
        var header: HTTPHeaders! ;
        
        //        if (UserLoginManage.sharedController().myInfo != nil) {
        //            header = ["Authorization":UserLoginManage.sharedController().myInfo.auth_token,"Platform":"ios"]
        //
        //        }
        //        else
        //        {
        //            header = ["Authorization" : "","Platform":"ios"]
        //        }
        
        Alamofire.request(NETWORK_ROOTURL.appending(RequestUrl), method: .get, parameters: Parmas, headers: header).responseJSON { (responseData) in
            
            if responseData.result.isSuccess
            {
                //                let json = JSON(data: responseData.data!)
                
                
                switch responseData.response?.statusCode
                {
                    
                case 200? :
                    
                    SuccessHandler(responseData.value! as! [String : Any])
                    
                    
                    let manager =  Alamofire.SessionManager.default
                    manager.session.getTasksWithCompletionHandler { dataTasks, uploadTasks, downloadTasks in
                        if dataTasks.count>0
                        {
                            
                        }else
                        {
                            
                            
                        }
                        
                    }
                    
                default :
                    
                    
                    FailHandler(responseData.value! as! [String : Any])
                    
                    let manager =  Alamofire.SessionManager.default
                    
                    manager.session.getTasksWithCompletionHandler { dataTasks, uploadTasks, downloadTasks in
                        if dataTasks.count>0
                        {
                            
                        }else
                        {
                            
                            
                        }
                        
                    }
                    
                    
                    
                    
                }
                
                
            }
            else
            {
                
            
                
                if (responseData.value != nil)
                {
                    FailHandler(responseData.value!
                        as! [String : Any])
                    
                    
                 }else
                {
                    FailHandler(["未知错误":""])
                    
                    
                }
            }
            
        }
        
        
        
    }
    
    
}
