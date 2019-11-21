//
//  Point.swift
//  RadarAnimation
//
//  Created by chris davis on 11/21/19.
//  Copyright © 2019 Woohyun David Lee. All rights reserved.
//

import UIKit

class Point: CAShapeLayer {
    
    private let radius: CGFloat = 2.0
    private var center: CGPoint = CGPoint(x: 0, y: 0)
    
    init(startingPoint point: CGPoint) {
        super.init()
        frame = bounds
        lineWidth = 1
        opacity = 0
        center = point
        strokeColor = UIColor.rgb(red: 57, green: 255, blue: 20).cgColor
        fillColor = UIColor.rgb(red: 57, green: 255, blue: 20).cgColor
        setPointLayer()
    }
    
    fileprivate func setPointLayer(){
        let circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: -CGFloat.pi/2, endAngle: 2 * CGFloat.pi - CGFloat.pi/2, clockwise: true)
        path = circularPath.cgPath
        animatePoint()
        
    }
    
    fileprivate func animatePoint(){
        let pointOpacityAnimation = CABasicAnimation(keyPath: "opacity")
        pointOpacityAnimation.fromValue = 0
        pointOpacityAnimation.toValue = 1
        pointOpacityAnimation.autoreverses = true
        pointOpacityAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        pointOpacityAnimation.duration = 2.0
        pointOpacityAnimation.repeatCount = 100
        
        add(pointOpacityAnimation, forKey: "pointOpacityAnimation")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
