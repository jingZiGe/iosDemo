//
//  BaseViewController.swift
//  ECMPMobile
//
//  Created by Zhenyi Li on 2018/11/20.
//  Copyright © 2018 HXMobile. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    




    ///   - name: storyboard名字
    ///   - identifier: 控制器的identifier
    /// - Returns: 目标控制器
    func getControllerWithStoryboard(name:String,identifier:String)->UIViewController
    {
        
        let storyboard = UIStoryboard.init(name: name, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: identifier)
        
        return vc as! BaseViewController
        
    }

  
    
    /// 获取当前storyboard的控制器
    ///
    ///   - identifier: 控制器的identifier
    /// - Returns: 目标控制器
    func getControllerWithCurrentStoryboard(identifier:String)->UIViewController
    {
        
        let storyboard = self.storyboard
        let vc = storyboard?.instantiateViewController(withIdentifier: identifier)
        
        return vc as! UIViewController
        
    }
    
    /// push目标storyboard的控制器
    ///
    ///   - name: storyboard名字
    ///   - identifier: 控制器的identifier

    func pushControllerWithStoryboard(name:String,identifier:String)
    {
        
        let storyboard = UIStoryboard.init(name: name, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: identifier)
        
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    /// push当前storyboard的控制器
    ///   - identifier: 控制器的identifier

    func pushControllerWithCurrentStoryboard(identifier:String)
    {
        
        let storyboard = self.storyboard
        let vc = storyboard?.instantiateViewController(withIdentifier: identifier)
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    /// present目标storyboard的控制器
    ///
    ///   - name: storyboard名字
    ///   - identifier: 控制器的identifier
    ///   - isClear: 是否透明
    func presentControllerWithStoryboard(name:String,identifier:String,isClear:Bool)
    {
        
        let storyboard = UIStoryboard.init(name: name, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: identifier)
        
        if isClear {
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overCurrentContext
        }
        
        self.present(vc, animated: true, completion: nil)
        
    }
    
    
    /// present目标控制器
    ///
    /// - Parameters:
    ///   - targtVC: 要present的控制器
    ///   - isClear: 是否透明
    func presentControllerWithTargetController(targtVC:UIViewController,isClear:Bool){
        
        if self.navigationController == nil
        {
            let nav = UINavigationController.init(rootViewController: targtVC)
            nav.navigationBar.isHidden = true
            if  isClear {
                nav.modalTransitionStyle = .crossDissolve
                nav.modalPresentationStyle = .overCurrentContext
            }
            
            self.present(nav, animated: true, completion: nil)
        }else
        {
            if  isClear {
                targtVC.modalTransitionStyle = .crossDissolve
                targtVC.modalPresentationStyle = .overCurrentContext
            }
            self.present(targtVC, animated: true, completion: nil)
        }
    }
    
    
    /// present目标控制器
    ///
    /// - Parameters:
    ///   - targtVC: 要present的控制器
    ///   - isClear: 是否透明
    ///   - completion: 完成回调
    func presentControllerWithTargetController(targtVC:UIViewController,isClear:Bool,completion:(() -> Swift.Void)? = nil){
        if  isClear {
            targtVC.modalTransitionStyle = .crossDissolve
            targtVC.modalPresentationStyle = .overCurrentContext
        }
        
        self.present(targtVC, animated: false, completion: completion  )
    }

    
    /// present目标控制器
    ///
    /// - Parameters:
    ///   - targtVC: 要present的控制器
    ///   - isClear: 是否透明
    ///   - isAnimated: 是否动画
    func presentControllerWithTargetController(targtVC:UIViewController,isClear:Bool,isAnimated:Bool){
        if  isClear {
            targtVC.modalTransitionStyle = .crossDissolve
            targtVC.modalPresentationStyle = .overCurrentContext
        }
        self.present(targtVC, animated: isAnimated, completion: nil)
    }
    /// present当前storyboard目标控制器
    ///
    /// - Parameters:
    ///   - identifier: 要present的控制器
    ///   - isClear: 是否透明
    func presentControllerWithCurrentStoryboard(identifier:String,isClear:Bool)
    {
        
        let storyboard = self.storyboard
        let vc = storyboard?.instantiateViewController(withIdentifier: identifier) as! UIViewController
        if  isClear {
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overCurrentContext
        }
        self.present(vc, animated: true, completion: nil)
    }
    /// present当前storyboard目标控制器
    ///
    /// - Parameters:
    ///   - identifier: 要present的控制器
    ///   - isClear: 是否透明
    ///   - isAnimated: 是否动画
    func presentControllerWithCurrentStoryboard(identifier:String,isClear:Bool,isAnimated:Bool)
    {
        
        let storyboard = self.storyboard
        let vc = storyboard?.instantiateViewController(withIdentifier: identifier) as! UIViewController
        if  isClear {
            vc.modalTransitionStyle = .crossDissolve
            vc.modalPresentationStyle = .overCurrentContext
        }
        self.present(vc, animated: isAnimated, completion: nil)
    }
    
    
    
    func pop(){
        
        if (self.navigationController != nil){
            self.navigationController?.popViewController(animated: true)
        }else
        {
            self.dismiss(animated: false, completion: nil)
        }
    }
    func showAlert(info:String){
        let alert = UIAlertView.init(title: "", message: info, delegate: nil, cancelButtonTitle: "确定")
        alert.show()
    }
    func showAlert(info:String,complete:@escaping ()->Void){
        //        let alert = UIAlertView.init(title: "", message: info, delegate: nil, cancelButtonTitle: "确定")
        //        alert.show()
        let vc = UIAlertController.init(title: "", message: info, preferredStyle: .alert)
        let alertAction = UIAlertAction.init(title: "确定", style: UIAlertAction.Style.default) { (action) in
            complete()
        }
        vc.addAction(alertAction)
        self.present(vc, animated: true, completion: nil)
        
    }
    func showAlert(info:String,clickYES:@escaping ()->Void,clickNO:@escaping ()->Void){

        
        let vc = UIAlertController.init(title: "", message: info, preferredStyle: .alert)
        let noAction = UIAlertAction.init(title: "取消", style:UIAlertAction.Style.default) { (action) in
            clickNO()
        }
        let yesAction = UIAlertAction.init(title: "取消", style: .default) { (action) in
            clickYES()
        }
        vc.addAction(yesAction)
        vc.addAction(noAction)
        self.present(vc, animated: true, completion: nil)
        
    }
}
