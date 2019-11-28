//
//  RadarGrid.swift
//  RadarAnimation
//
//  Created by chris davis on 11/21/19.
//  Copyright © 2019 Woohyun David Lee. All rights reserved.
//

import UIKit

class RadarGrid: CAShapeLayer {
    private var center = CGPoint(x: 0, y: 0)
    private var radius: CGFloat = 0.0
    private let combinedPaths = CGMutablePath()
    
    init(_ point: CGPoint, _ rad: CGFloat) {
        super.init()
        frame = bounds
        lineWidth = 0.4
        opacity = 0.6
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
        let degreeInCGFloat = CGFloat(degree)
        let linePath = UIBezierPath()
        let x = center.x + (radius * 0.1 * cos(degreeToRadian(degreeInCGFloat)))
        let y = center.y + (radius * 0.1 * sin(degreeToRadian(degreeInCGFloat)))

        linePath.move(to: CGPoint(x: x , y: y))
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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
