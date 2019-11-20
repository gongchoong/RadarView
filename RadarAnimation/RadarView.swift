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
    
    fileprivate func drawACircle(_ i: Int) -> CAShapeLayer{
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
    
    fileprivate func drawAGridLine(_ degree: CGFloat) -> CAShapeLayer{
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: frame.width/2 , y: frame.height/2))
        linePath.addLine(to: findCoordinatesForGridLine(degree))
        
        let gridLineLayer = setGridLineLayer()
        gridLineLayer.path = linePath.cgPath
        return gridLineLayer
    }
    
    fileprivate func findCoordinatesForGridLine(_ degree: CGFloat) -> CGPoint{
        let centerPoint = CGPoint(x: frame.width/2 , y: frame.height/2)
        let centerX = centerPoint.x
        let centerY = centerPoint.y
        let radius = bounds.width/2
        let xValue = radius * cos(degreeToRadian(degree))
        let yValue = radius * sin(degreeToRadian(degree))

        return CGPoint(x: centerX + xValue, y: centerY + yValue)
    }
    
    fileprivate func degreeToRadian(_ degree: CGFloat) -> CGFloat{
        return degree * CGFloat.pi / CGFloat(180)
    }
    
    fileprivate func setGridLineLayer() -> CAShapeLayer {
        let gridLineLayer = CAShapeLayer()
        gridLineLayer.lineWidth = 0.5
        gridLineLayer.opacity = 0.8
        gridLineLayer.strokeColor = UIColor.rgb(red: 57, green: 255, blue: 20).cgColor
        return gridLineLayer
    }
    
    fileprivate func drawASweeper(){
        sweeper.frame = self.bounds
        sweeper.strokeColor = UIColor.rgb(red: 57, green: 255, blue: 20).cgColor
        sweeper.lineWidth = 1
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: frame.width/2 , y: frame.height/2))
        linePath.addLine(to: CGPoint(x: frame.width/2, y: 0))
        
        sweeper.path = linePath.cgPath
    }
    
    fileprivate func animateSweeper() {
        let foregroundAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        foregroundAnimation.fromValue = 0
        foregroundAnimation.toValue = CGFloat(360.0) * CGFloat.pi / CGFloat(180.0)
        foregroundAnimation.duration = CFTimeInterval(10.0)
        foregroundAnimation.repeatCount = .greatestFiniteMagnitude
        
        sweeper.add(foregroundAnimation, forKey: "foregroundAnimation")
    }
    
    func loadLayer(){
        backgroundColor = UIColor.black
        drawASweeper()
        
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
        layer.addSublayer(drawAGridLine(10))
        layer.addSublayer(drawAGridLine(20))
        layer.addSublayer(drawAGridLine(30))
        layer.addSublayer(drawAGridLine(40))
        layer.addSublayer(drawAGridLine(50))
        layer.addSublayer(drawAGridLine(60))
        layer.addSublayer(drawAGridLine(70))
        layer.addSublayer(drawAGridLine(80))
        layer.addSublayer(drawAGridLine(90))
        layer.addSublayer(drawAGridLine(100))
        layer.addSublayer(drawAGridLine(110))
        layer.addSublayer(drawAGridLine(120))
        layer.addSublayer(drawAGridLine(130))
        layer.addSublayer(drawAGridLine(140))
        layer.addSublayer(drawAGridLine(150))
        layer.addSublayer(drawAGridLine(160))
        layer.addSublayer(drawAGridLine(170))
        layer.addSublayer(drawAGridLine(180))
        layer.addSublayer(drawAGridLine(190))
        layer.addSublayer(drawAGridLine(200))
        layer.addSublayer(drawAGridLine(210))
        layer.addSublayer(drawAGridLine(220))
        layer.addSublayer(drawAGridLine(230))
        layer.addSublayer(drawAGridLine(240))
        layer.addSublayer(drawAGridLine(250))
        layer.addSublayer(drawAGridLine(260))
        layer.addSublayer(drawAGridLine(270))
        layer.addSublayer(drawAGridLine(280))
        layer.addSublayer(drawAGridLine(290))
        layer.addSublayer(drawAGridLine(300))
        layer.addSublayer(drawAGridLine(310))
        layer.addSublayer(drawAGridLine(320))
        layer.addSublayer(drawAGridLine(330))
        layer.addSublayer(drawAGridLine(340))
        layer.addSublayer(drawAGridLine(350))
        layer.addSublayer(drawAGridLine(360))
        layer.addSublayer(sweeper)
        
        beginAnimation()
    }
    
    fileprivate func beginAnimation(){
        
        animateSweeper()
    }
    
}
