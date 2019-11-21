//
//  RadarView.swift
//  RadarAnimation
//
//  Created by chris davis on 11/20/19.
//  Copyright © 2019 Woohyun David Lee. All rights reserved.
//

import UIKit

class RadarView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadLayer(){
        backgroundColor = UIColor.black
        let centerPoint = CGPoint(x: frame.width/2 , y: frame.height/2)
        let radius: CGFloat = bounds.width/2
        
        layer.addSublayer(BackgroundGrid(centerPoint, radius))
        layer.addSublayer(Sweeper(centerPoint, radius, bounds))
        
        for _ in 1...5 {
            layer.addSublayer(Point(startingPoint: getARandomPoint(centerPoint, radius)))
        }
        
        print(centerPoint)
    }
    
    func getARandomPoint(_ center: CGPoint,_ rad: CGFloat) -> CGPoint{
        let a = Double.random(in: 0..<1) * Double(2.0) * Double.pi
        let r = Double(rad) * sqrt(Double.random(in: 0..<1))

        let x = CGFloat(r * cos(a))
        let y = CGFloat(r * sin(a))
        let point = CGPoint(x: x, y: y)
        print(point)

        return CGPoint(x: center.x + x, y: center.y + y)
    }
    
}
