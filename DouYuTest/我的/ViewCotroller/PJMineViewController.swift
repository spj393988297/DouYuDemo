//
//  PJMineViewController.swift
//  DouYuTest
//
//  Created by MyMac on 17/3/3.
//  Copyright © 2017年 spj. All rights reserved.
//

import UIKit

class PJMineViewController: PJRootViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.instanceController()
        
    }

    func instanceController() {
        self.navigationItem.title = "我的"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
