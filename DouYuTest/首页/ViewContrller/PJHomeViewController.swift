//
//  PJHomeViewController.swift
//  DouYuTest
//
//  Created by MyMac on 17/3/3.
//  Copyright © 2017年 spj. All rights reserved.
//

import UIKit

private let kTitleViewH : CGFloat = 40

class PJHomeViewController: PJRootViewController {

    fileprivate lazy var pageTitleView : PJPageTitleView = { [weak self] in
        let titleFrame = CGRect.init(x: 0, y: kStatusBarH + kNavigationBarH, width: kScreenW, height: kTitleViewH)
        let titles = ["推荐","游戏","娱乐","趣玩"]
        let pageTitleView = PJPageTitleView.init(frame: titleFrame, titles: titles)
        return pageTitleView
    }()
    
    fileprivate lazy var pageContentView : PJPageContentView = {
        // 1.确定内容的frame
        let contentH = kScreenH - kStatusBarH - kNavigationBarH - kTitleViewH - kTabbarH
        let contentFrame = CGRect(x: 0, y: kStatusBarH + kNavigationBarH + kTitleViewH, width: kScreenW, height: contentH)
        
        // 2.确定所有的子控制器
        var childVcs = [UIViewController]()
        childVcs.append(PJRecommondVC())
        childVcs.append(PJGameVC())
        childVcs.append(PJAmuseVC())
        childVcs.append(PJFunnyVC())
        
        let pageContentView = PJPageContentView.init(frame: contentFrame, viewControllers: childVcs, parentViewController: self)
        return pageContentView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        instanceSubviews()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension PJHomeViewController{
    fileprivate func instanceSubviews(){
        
        //不需要调整UIScrollview的内边距
        automaticallyAdjustsScrollViewInsets = false
        
        setUpNavigationBar()
        setupUI()
    }
    
    fileprivate func setUpNavigationBar(){
        self.navigationItem.title = "首页"
        var leftImage = UIImage.init(named: "logo")
        leftImage = leftImage?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: leftImage, style:UIBarButtonItemStyle.done, target: self, action: #selector(leftBarButtonClick(sender:)))
        
        // 2.设置右侧的Item
        let size = CGSize(width: 40, height: 40)
        let historyItem = UIBarButtonItem(imageName: "image_my_history", highImageName: "Image_my_history_click", size: size)
        let searchItem = UIBarButtonItem(imageName: "btn_search", highImageName: "btn_search_clicked", size: size)
        let qrcodeItem = UIBarButtonItem(imageName: "Image_scan", highImageName: "Image_scan_click", size: size)
        navigationItem.rightBarButtonItems = [historyItem, searchItem, qrcodeItem]
    }
    
    @objc fileprivate func leftBarButtonClick(sender: UIBarButtonItem){
    
    }
    
    fileprivate func homeTitleClosure(_ selectIndex : Int) {
        print("\(selectIndex)")
        pageContentView.setCurrentIndex(selectIndex)
    }
    
    fileprivate func homeContentClosure(_ contentView : PJPageContentView,_ progress : CGFloat, _ sourceIndex : Int,_ targetIndex : Int) {
        pageTitleView.setTitleWithProgress(progress, sourceIndex: sourceIndex, targetIndex: targetIndex)
    }
    
    fileprivate func setupUI() {
        pageTitleView.selectClosure = homeTitleClosure
        pageContentView.pageContentViewClosure = homeContentClosure
        self.view.addSubview(pageTitleView)
        self.view.addSubview(pageContentView)
    }
    
}
