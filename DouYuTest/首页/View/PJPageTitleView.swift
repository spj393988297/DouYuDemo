//
//  PJPageTitleView.swift
//  DouYuTest
//
//  Created by MyMac on 17/3/16.
//  Copyright © 2017年 spj. All rights reserved.
//

import UIKit

typealias titleButtonClosure = (_ selectIndex : Int) -> Void

// MARK:- 定义常量
private let kScrollLineH : CGFloat = 2
private let kNormalColor : (CGFloat, CGFloat, CGFloat) = (85, 85, 85)
private let kSelectColor : (CGFloat, CGFloat, CGFloat) = (255, 128, 0)

// MARK:- 定义PageTitleView类
class PJPageTitleView: UIView {

    // MARK:- 定义属性
    fileprivate var selectIndex : Int = 0
    fileprivate var titles : [String] = []
     var selectClosure : titleButtonClosure?
    fileprivate lazy var titleButtons : [UIButton] = [UIButton]()
    fileprivate lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.bounces = false
        scrollView.scrollsToTop = false
        return scrollView
    }()
    fileprivate lazy var bottomBoldLine : UIView = {
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.orange
        return bottomLine
    }()
    
    // MARK:- 自定义构造函数
    init(frame: CGRect ,titles : [String]) {
        self.titles = titles
        
        super.init(frame: frame)
        //设置 UI 界面
        setupSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK :-设置 UI 界面
extension PJPageTitleView {
     fileprivate func setupSubviews(){
        //添加 scrollview
        scrollView.frame = bounds
        self.addSubview(scrollView)
        //添加 title对应的 label
        setupTitleLabels();
        //设置底线和滚动的滑块
        setupBottomLine()
    }
    
    fileprivate func setupTitleLabels() {
        //确定label的一些frame的值
        let buttonW : CGFloat = frame.width / (CGFloat)(titles.count)
        let buttonH : CGFloat = frame.height - kScrollLineH
        let buttonY : CGFloat = 0
        
        for (index, title) in titles.enumerated() {
            let button = UIButton()
            button.setTitle(title, for: UIControlState.normal)
            button.tag = index
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            button.setTitleColor(UIColor.orange, for: UIControlState.selected)
            button.setTitleColor(UIColor.lightGray, for: UIControlState.normal)
            button.addTarget(self, action: #selector(buttonClick(_:)), for: UIControlEvents.touchUpInside)
            let buttonX : CGFloat = buttonW * CGFloat(index)
            button.frame = CGRect.init(x: buttonX, y: buttonY, width: buttonW, height: buttonH)
            addSubview(button)
            titleButtons.append(button)
        }
        
    }
    fileprivate func setupBottomLine() {
        let bottomLine = UIView()
        bottomLine.backgroundColor = UIColor.lightGray
        bottomLine.frame = CGRect.init(x: 0, y: frame.height - 0.5, width: frame.width, height: 0.5)
        self.addSubview(bottomLine)
        
        //添加button下面的 view
        guard let firstButton = titleButtons.first else { return }
        firstButton.isSelected = true
        bottomBoldLine.frame = CGRect.init(x: firstButton.frame.origin.x, y: frame.height - kScrollLineH, width: firstButton.frame.width, height: kScrollLineH)
        addSubview(bottomBoldLine)
    }
    
}

extension PJPageTitleView {
    func buttonClick(_ sender : UIButton) {
        
        if sender.tag == selectIndex { return }
        let oldButton = titleButtons[selectIndex]
        sender.titleLabel?.textColor = UIColor(r: kSelectColor.0, g: kSelectColor.1, b: kSelectColor.2)
        oldButton.titleLabel?.textColor = UIColor(r: kNormalColor.0, g: kNormalColor.1, b: kNormalColor.2)
        selectIndex = sender.tag
        UIView.animate(withDuration: 0.2) { 
            self.bottomBoldLine.frame.origin.x = sender.frame.origin.x
        }
        if self.selectClosure != nil {
            self.selectClosure!(selectIndex)
        }
        
    }
}

// MARK:- 对外暴露的方法
extension PJPageTitleView {
    func setTitleWithProgress(_ progress : CGFloat, sourceIndex : Int, targetIndex : Int) {
        // 1.取出sourceLabel/targetLabel
        let sourceButton = titleButtons[sourceIndex]
        let targetButton = titleButtons[targetIndex]
        
        // 2.处理滑块的逻辑
        let moveTotalX = targetButton.frame.origin.x - sourceButton.frame.origin.x
        let moveX = moveTotalX * progress
        bottomBoldLine.frame.origin.x = sourceButton.frame.origin.x + moveX
        
        // 3.颜色的渐变(复杂)
        // 3.1.取出变化的范围
        let colorDelta = (kSelectColor.0 - kNormalColor.0, kSelectColor.1 - kNormalColor.1, kSelectColor.2 - kNormalColor.2)
        
        // 3.2.变化sourceLabel
        sourceButton.titleLabel?.textColor = UIColor(r: kSelectColor.0 - colorDelta.0 * progress, g: kSelectColor.1 - colorDelta.1 * progress, b: kSelectColor.2 - colorDelta.2 * progress)
        
        // 3.2.变化targetLabel
        targetButton.titleLabel?.textColor = UIColor(r: kNormalColor.0 + colorDelta.0 * progress, g: kNormalColor.1 + colorDelta.1 * progress, b: kNormalColor.2 + colorDelta.2 * progress)
        
        // 4.记录最新的index
        selectIndex = targetIndex
    }
}

