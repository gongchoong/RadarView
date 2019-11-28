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
    private let boxWidth: CGFloat = 5.0
    private let boxWidthHalf: CGFloat = 2.5
    private var center: CGPoint = CGPoint(x: 0, y: 0)
    private var repeated: CGFloat = 0.0
    private let combinedPaths = CGMutablePath()
    
    init(startingPoint point: CGPoint, repeated rep: CGFloat) {
        super.init()
        frame = bounds
        lineWidth = 1
        opacity = 1
        center = point
        repeated = rep
        strokeColor = UIColor.rgb(red: 222, green: 255, blue: 215).cgColor
        
        setPointLayer()
        setBoxLayer()
        path = combinedPaths
        animatePoint()
    }
    
    fileprivate func setPointLayer(){
        let circularPath = UIBezierPath(arcCenter: center, radius: radius, startAngle: -CGFloat.pi/2, endAngle: 2 * CGFloat.pi - CGFloat.pi/2, clockwise: true)
        circularPath.close()
        combinedPaths.addPath(circularPath.cgPath)
        path = combinedPaths
        
    }
    
    fileprivate func setBoxLayer(){
        let bottomLeft = UIBezierPath()
        bottomLeft.move(to: CGPoint(x: center.x - boxWidthHalf, y: center.y + boxWidth))
        bottomLeft.addLine(to: CGPoint(x: center.x - boxWidth, y: center.y + boxWidth))
        bottomLeft.addLine(to: CGPoint(x: center.x - boxWidth, y: center.y + boxWidth - boxWidthHalf))
        
        let topLeft = UIBezierPath()
        topLeft.move(to: CGPoint(x: center.x - boxWidth, y: center.y - boxWidthHalf))
        topLeft.addLine(to: CGPoint(x: center.x - boxWidth, y: center.y - boxWidth))
        topLeft.addLine(to: CGPoint(x: center.x - boxWidthHalf, y: center.y - boxWidth))
        
        let topRight = UIBezierPath()
        topRight.move(to: CGPoint(x: center.x + boxWidthHalf, y: center.y - boxWidth))
        topRight.addLine(to: CGPoint(x: center.x + boxWidth, y: center.y - boxWidth))
        topRight.addLine(to: CGPoint(x: center.x + boxWidth, y: center.y - boxWidthHalf))
        
        let bottomRight = UIBezierPath()
        bottomRight.move(to: CGPoint(x: center.x + boxWidthHalf, y: center.y + boxWidth))
        bottomRight.addLine(to: CGPoint(x: center.x + boxWidth, y: center.y + boxWidth))
        bottomRight.addLine(to: CGPoint(x: center.x + boxWidth, y: center.y + boxWidthHalf))

        combinedPaths.addPath(bottomLeft.cgPath)
        combinedPaths.addPath(topLeft.cgPath)
        combinedPaths.addPath(topRight.cgPath)
        combinedPaths.addPath(bottomRight.cgPath)
    }
    
    fileprivate func animatePoint(){
        let pointOpacityAnimation = CABasicAnimation(keyPath: "opacity")
        pointOpacityAnimation.delegate = self
        pointOpacityAnimation.fromValue = 0
        pointOpacityAnimation.toValue = 1
        pointOpacityAnimation.autoreverses = true
        pointOpacityAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        pointOpacityAnimation.duration = 1.0
        pointOpacityAnimation.repeatCount = Float(repeated)
        
        add(pointOpacityAnimation, forKey: "pointOpacityAnimation")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension Point: CAAnimationDelegate {
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        self.removeFromSuperlayer()
    }
}
