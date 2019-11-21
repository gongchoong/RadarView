//
//  Sweeper.swift
//  RadarAnimation
//
//  Created by chris davis on 11/21/19.
//  Copyright © 2019 Woohyun David Lee. All rights reserved.
//

import UIKit

class Sweeper: CAShapeLayer {
    var center: CGPoint = CGPoint(x: 0, y: 0)
    var radius: CGFloat = 0
    
    init(_ point: CGPoint, _ rad: CGFloat, _ rect: CGRect) {
        super.init()
        strokeColor = UIColor.rgb(red: 57, green: 255, blue: 20).cgColor
        lineWidth = 1
        
        center = point
        radius = rad
        frame = rect
        
        setSweeperLayer()
    }
    
    fileprivate func setSweeperLayer(){
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: frame.width/2, y: frame.height/2))
        linePath.addLine(to: CGPoint(x: frame.width/2, y: 0))
        
        path = linePath.cgPath
        animateSweeper()
    }
    
    fileprivate func animateSweeper() {
        let foregroundAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        foregroundAnimation.fromValue = 0
        foregroundAnimation.toValue = CGFloat(360.0) * CGFloat.pi / CGFloat(180.0)
        foregroundAnimation.duration = CFTimeInterval(10.0)
        foregroundAnimation.repeatCount = .greatestFiniteMagnitude
        
        add(foregroundAnimation, forKey: "foregroundAnimation")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
