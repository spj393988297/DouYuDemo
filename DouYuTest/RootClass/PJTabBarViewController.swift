//
//  PJTabBarViewController.swift
//  DouYuTest
//
//  Created by MyMac on 17/3/3.
//  Copyright © 2017年 spj. All rights reserved.
//

import UIKit

class PJTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.tintColor = UIColor.black
        //创建tabbar子控制器
        self.creatSubViewControllers();
    }
    
    func creatSubViewControllers(){
        
        addChildVc(vcName: "PJHomeViewController", title: "首页", normalImgName: "btn_home_normal", selectedImgName: "btn_home_selected")
        addChildVc(vcName: "PJLivingViewController", title: "直播", normalImgName: "btn_column_normal", selectedImgName: "btn_column_selected")
        addChildVc(vcName: "PJCollectViewController", title: "关注", normalImgName: "btn_live_normal", selectedImgName: "btn_live_selected")
        addChildVc(vcName: "PJMineViewController", title: "我的", normalImgName: "btn_user_normal", selectedImgName: "btn_user_selected")
        
    }
    
    fileprivate func addChildVc(vcName:String , title:String ,normalImgName:String ,selectedImgName:String) {
        
        let appName: String = Bundle.main.object(forInfoDictionaryKey: "CFBundleName") as! String
        let className = "\(appName).\(vcName)"
        let classType = NSClassFromString(className) as? UIViewController.Type
        let newVC = classType?.init()
        let normalImage = UIImage.init(named: normalImgName)
        var selectedImage = UIImage.init(named: selectedImgName)
        selectedImage = selectedImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal);
        let item = UITabBarItem.init(title: title, image: normalImage, selectedImage:selectedImage )
        newVC?.tabBarItem = item
        let navigationVC = UINavigationController.init(rootViewController: newVC!)
//        navigationVC.navigationItem.title = title
        addChildViewController(navigationVC)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
