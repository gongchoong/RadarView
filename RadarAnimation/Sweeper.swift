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
    var innermostRadius: CGFloat = 0
    
    init(_ point: CGPoint, _ rad: CGFloat, _ rect: CGRect) {
        super.init()
        
        center = point
        radius = rad
        innermostRadius = radius * 0.1
        frame = rect
        
        strokeColor = UIColor.clear.cgColor
        fillColor = UIColor.green.withAlphaComponent(0.2).cgColor
        
        setSweeperLayer()
    }
    
    fileprivate func setSweeperLayer(){
        //leave the innermost circle empty
        //draw a pizza slice with a bite taken out
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: center.x, y: center.y + (radius * 0.1)))
        linePath.addLine(to: CGPoint(x: center.x, y: frame.height))
        linePath.addArc(withCenter: center, radius: radius, startAngle: degreeToRadian(90.0), endAngle: degreeToRadian(110.0), clockwise: true)
        
        let x = center.x + (radius * 0.1 * cos(degreeToRadian(110.0)))
        let y = center.y + (radius * 0.1 * sin(degreeToRadian(110.0)))
        
        linePath.addLine(to: CGPoint(x: x, y: y))
        linePath.addArc(withCenter: center, radius: innermostRadius, startAngle: degreeToRadian(110.0), endAngle: degreeToRadian(90.0), clockwise: false)
        linePath.close()
        
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
