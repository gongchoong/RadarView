//
//  RadarView.swift
//  RadarAnimation
//
//  Created by chris davis on 11/20/19.
//  Copyright © 2019 Woohyun David Lee. All rights reserved.
//

import UIKit

class RadarView: UIView {
    
    fileprivate let sweeper: CAShapeLayer = {
        let rotatingLine = CAShapeLayer()
        return rotatingLine
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadLayer(){
        backgroundColor = UIColor.black

        beginAnimation()
    }
    
    fileprivate func beginAnimation(){
        layer.addSublayer(drawACircle(10))
        layer.addSublayer(drawACircle(9))
        layer.addSublayer(drawACircle(8))
        layer.addSublayer(drawACircle(7))
        layer.addSublayer(drawACircle(6))
        layer.addSublayer(drawACircle(5))
        layer.addSublayer(drawACircle(4))
        layer.addSublayer(drawACircle(3))
        layer.addSublayer(drawACircle(2))
        layer.addSublayer(drawACircle(1))
        drawARotatingLine()
        layer.addSublayer(sweeper)
        
        animateSweeper()
    }
    
    func drawACircle(_ i: Int) -> CAShapeLayer{
        let centerPoint = CGPoint(x: frame.width/2 , y: frame.height/2)
        let radiusRatio = CGFloat(Double(i)/Double(10))
        let circularPath = UIBezierPath(arcCenter: centerPoint, radius: bounds.width/2 * radiusRatio, startAngle: -CGFloat.pi/2, endAngle: 2 * CGFloat.pi - CGFloat.pi/2, clockwise: true)
        
        let circleLayer = setCircleLayer()
        circleLayer.path = circularPath.cgPath
        return circleLayer
    }
    
    fileprivate func setCircleLayer() -> CAShapeLayer {
        let circleLayer = CAShapeLayer()
        circleLayer.frame = bounds
        circleLayer.lineWidth = 0.5
        circleLayer.opacity = 0.8
        circleLayer.lineCap = .round
        circleLayer.strokeColor = UIColor.rgb(red: 57, green: 255, blue: 20).cgColor
        return circleLayer
    }
    
    private func drawARotatingLine(){
        sweeper.frame = self.bounds
        sweeper.strokeColor = UIColor.rgb(red: 57, green: 255, blue: 20).cgColor
        sweeper.lineWidth = 1
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: frame.width/2 , y: frame.height/2))
        linePath.addLine(to: CGPoint(x: frame.width/2, y: 0))
        
        sweeper.path = linePath.cgPath
    }
    
    private func animateSweeper() {
        let foregroundAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        foregroundAnimation.fromValue = 0
        foregroundAnimation.toValue = CGFloat(360.0) * CGFloat.pi / CGFloat(180.0)
        foregroundAnimation.duration = CFTimeInterval(10.0)
        foregroundAnimation.repeatCount = .greatestFiniteMagnitude
        
        sweeper.add(foregroundAnimation, forKey: "foregroundAnimation")
    }
    
}
