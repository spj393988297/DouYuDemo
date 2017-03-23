//
//  NSDate+Extension.swift
//  DouYuTest
//
//  Created by MyMac on 17/3/17.
//  Copyright © 2017年 spj. All rights reserved.
//

import UIKit

extension Date {
    static func getCurrentTime() -> String {
        let nowDate = Date()
        
        let interval = Int(nowDate.timeIntervalSince1970)
        
        return "\(interval)"
    }
}
