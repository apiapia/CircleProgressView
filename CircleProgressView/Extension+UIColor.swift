//
//  Extension+UIColor.swift
//  CircleProgressView
//
//  Created by BearLin on 2017/4/4.
//  Copyright © 2017年 BearLin. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(withHexString hexString: String) {
        if hexString.characters.count != 6 {
            self.init(white: 1, alpha: 1)
        } else {
            var color: UInt64 = 0
            Scanner(string: hexString).scanHexInt64(&color)
            let red = Float((color >> 16) & 0x0000FF) / 255
            let green = Float((color >> 8) & 0x0000FF) / 255
            let blue = Float(color & 0x0000FF) / 255
            
            self.init(colorLiteralRed: red, green: green, blue: blue, alpha: 1)
        }
    }
    
    convenience init(withHexString hexString: String, andOpacity opacity: Float) {
        if hexString.characters.count != 6 {
            self.init(white: 1, alpha: CGFloat(opacity))
        } else {
            var color: UInt64 = 0
            Scanner(string: hexString).scanHexInt64(&color)
            let red = Float((color >> 16) & 0x0000FF) / 255
            let green = Float((color >> 8) & 0x0000FF) / 255
            let blue = Float(color & 0x0000FF) / 255
            
            self.init(colorLiteralRed: red, green: green, blue: blue, alpha: opacity)
        }
    }
}
