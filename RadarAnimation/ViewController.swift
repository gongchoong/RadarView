//
//  ViewController.swift
//  RadarAnimation
//
//  Created by chris davis on 11/20/19.
//  Copyright © 2019 Woohyun David Lee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let radarView = RadarView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
    }
    
    override func viewDidLayoutSubviews() {
        radarView.frame = CGRect(x: 0, y: 0, width: view.frame.width * 0.9, height: view.frame.width * 0.9)
        radarView.center = view.center
        radarView.loadLayer()
        
        view.addSubview(radarView)
    }


}

