//
//  BackgroundGrid.swift
//  RadarAnimation
//
//  Created by chris davis on 11/28/19.
//  Copyright © 2019 Woohyun David Lee. All rights reserved.
//

import UIKit

class BackgroundGrid: CAShapeLayer {
    
    var screenWidth: CGFloat = 0.0
    var screenHeight: CGFloat = 0.0
    private let combinedPaths = CGMutablePath()
    
    override init() {
        super.init()
        screenWidth = UIScreen.main.bounds.width
        screenHeight = UIScreen.main.bounds.height
        
        lineWidth = 0.5
        opacity = 0.5
        strokeColor = UIColor.rgb(red: 17, green: 125, blue: 0).cgColor
        
        for i in stride(from: 25, to: screenWidth, by: 25){
            drawVerticalBackgroundGrid(i)
        }
        
        for i in stride(from: 25, to: screenHeight, by: 25){
            drawHorizontalBackgroundGrid(i)
        }
        path = combinedPaths
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func drawVerticalBackgroundGrid(_ x: CGFloat){
        let gridPath = UIBezierPath()
        gridPath.move(to: CGPoint(x: x, y: 0))
        gridPath.addLine(to: CGPoint(x: x, y: screenHeight))
        combinedPaths.addPath(gridPath.cgPath)
    }
    
    fileprivate func drawHorizontalBackgroundGrid(_ y: CGFloat){
        let gridPath = UIBezierPath()
        gridPath.move(to: CGPoint(x: 0, y: y))
        gridPath.addLine(to: CGPoint(x: screenWidth, y: y))
        combinedPaths.addPath(gridPath.cgPath)
    }
}
