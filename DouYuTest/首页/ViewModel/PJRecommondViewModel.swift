//
//  PJRecommondViewModel.swift
//  DouYuTest
//
//  Created by MyMac on 17/3/17.
//  Copyright © 2017年 spj. All rights reserved.
//

import UIKit

class PJRecommondViewModel: BaseViewModel {
    // MARK:- 懒加载属性
    lazy var cycleModels : [CycleModel] = [CycleModel]()
    fileprivate lazy var bigDataGroup : AnchorGroup = AnchorGroup()
    fileprivate lazy var prettyGroup : AnchorGroup = AnchorGroup()
}

//MARK: - 发送网络请求
extension  PJRecommondViewModel {
    
}
