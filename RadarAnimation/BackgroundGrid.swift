//
//  BackgroundGrid.swift
//  RadarAnimation
//
//  Created by chris davis on 11/21/19.
//  Copyright © 2019 Woohyun David Lee. All rights reserved.
//

import UIKit

class BackgroundGrid: CAShapeLayer {
    private var center = CGPoint(x: 0, y: 0)
    private var radius: CGFloat = 1.0
    private let combinedPaths = CGMutablePath()
    
    init(_ point: CGPoint, _ rad: CGFloat) {
        super.init()
        frame = bounds
        lineWidth = 0.5
        opacity = 0.8
        lineCap = .round
        strokeColor = UIColor.rgb(red: 57, green: 255, blue: 20).cgColor
        center = point
        radius = rad
        
        for i in 1...10{
            setCircleLayer(i)
        }
        for i in stride(from: 0, to: 360, by: 10){
            setGridLineLayer(i)
        }
        path = combinedPaths
    }
    
    fileprivate func setCircleLayer(_ i: Int){
        let ratio = radius * (CGFloat(i) / CGFloat(10))
        let circularPath = UIBezierPath(arcCenter: center, radius: ratio, startAngle: -CGFloat.pi/2, endAngle: 2 * CGFloat.pi - CGFloat.pi/2, clockwise: true)
        combinedPaths.addPath(circularPath.cgPath)
    }
    
    fileprivate func setGridLineLayer(_ degree: Int){
        let linePath = UIBezierPath()
        linePath.move(to: CGPoint(x: center.x , y: center.y))
        linePath.addLine(to: findCoordinatesForGridLine(CGFloat(degree)))
        combinedPaths.addPath(linePath.cgPath)
    }
    
    fileprivate func findCoordinatesForGridLine(_ degree: CGFloat) -> CGPoint{
        let centerX = center.x
        let centerY = center.y
        let xValue = radius * cos(degreeToRadian(degree))
        let yValue = radius * sin(degreeToRadian(degree))

        return CGPoint(x: centerX + xValue, y: centerY + yValue)
    }
    
    fileprivate func degreeToRadian(_ degree: CGFloat) -> CGFloat{
        return degree * CGFloat.pi / CGFloat(180)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
