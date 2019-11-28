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
        backgroundColor = UIColor.clear
        let centerPoint = CGPoint(x: frame.width/2 , y: frame.height/2)
        let radius: CGFloat = bounds.width/2
        
        layer.addSublayer(RadarGrid(centerPoint, radius))
        layer.addSublayer(Sweeper(centerPoint, radius, bounds))
        
        generatePoints()
    }
    
    func generatePoints(){
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(everySecond), userInfo: nil, repeats: true)
    }
    
    @objc func everySecond(){
        if generatingANewPoint(){
            let centerPoint = CGPoint(x: frame.width/2 , y: frame.height/2)
            let radius: CGFloat = bounds.width/2
            let center = getARandomPoint(centerPoint, radius)
            let repeated = CGFloat.random(in: 1..<11)
            
            layer.addSublayer(Point(startingPoint: center, repeated: repeated))
        }
    }
    
    func getARandomPoint(_ center: CGPoint,_ rad: CGFloat) -> CGPoint{
        let a = Double.random(in: 0..<1) * Double(2.0) * Double.pi
        let r = Double(rad) * sqrt(Double.random(in: 0..<1))

        let x = CGFloat(r * cos(a))
        let y = CGFloat(r * sin(a))

        return checkIfPointIsInsideOfInnermostCircle(CGPoint(x: center.x + x, y: center.y + y))
    }
    
    fileprivate func checkIfPointIsInsideOfInnermostCircle(_ point: CGPoint) -> CGPoint{
        let center = CGPoint(x: frame.width/2 , y: frame.height/2)
        let radius: CGFloat = bounds.width/2
        let radiusOfInnermostCircle = radius * 0.1
        
        let distance = sqrt((pow(center.x - point.x, 2) + pow(center.y - point.y, 2)))
        //distance between the center and the point must be greater than radius of the innermost circle
        
        if radiusOfInnermostCircle > distance{
            //generated point is within the innermost circle
            //return a new point outside of the innermost circle
            return CGPoint(x: point.x + radiusOfInnermostCircle, y: point.y + radiusOfInnermostCircle)
        }else{
            //generated point is outside of the innermost circle
            return point
        }
    }
    
    fileprivate func generatingANewPoint() -> Bool {
        let generate = Int.random(in: 0..<5)
        if generate < 1{
            return true
        }else{
            return false
        }
    }
}
