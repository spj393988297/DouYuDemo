//
//  PJRecommondVC.swift
//  DouYuTest
//
//  Created by MyMac on 17/3/16.
//  Copyright © 2017年 spj. All rights reserved.
//

import UIKit

private let kCycleViewH = kScreenW * 3 / 8
private let kGameViewH : CGFloat = 90

class PJRecommondVC: PJRootViewController {

    // MARK:- 懒加载属性
    fileprivate lazy var recommendVM : PJRecommondViewModel = PJRecommondViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
