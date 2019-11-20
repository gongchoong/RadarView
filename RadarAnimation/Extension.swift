//
//  Extension.swift
//  RadarAnimation
//
//  Created by chris davis on 11/20/19.
//  Copyright © 2019 Woohyun David Lee. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static func rgb(red r: CGFloat, green g: CGFloat, blue b: CGFloat) -> UIColor{
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}
