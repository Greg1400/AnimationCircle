//
//  ViewController.swift
//  Animation Circle
//
//  Created by Grégoire Herzig on 21/07/2023.
//  Copyright © 2023 Grégoire Herzig. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let countingLabel: CountingLabel = {
        let label = CountingLabel()
        label.text = "0%"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        
        return label
    }()
    let shapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLabel()
        
        let trackLayer = CAShapeLayer()
        let center = view.center
        
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi/2, endAngle: 2 * CGFloat.pi - CGFloat.pi/2, clockwise: true)
        
        trackLayer.path = circularPath.cgPath
        trackLayer.lineWidth = 10
        trackLayer.strokeColor = UIColor.lightGray.cgColor
        trackLayer.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(trackLayer)
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.lineWidth = 10
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeEnd = 0
        shapeLayer.lineCap = kCALineCapRound
        
        
        view.layer.addSublayer(shapeLayer)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
    
        
    }
    
    @objc func handleTap() {
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 2
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "basicAnim")
    
        countingLabel.count(from: 0, to: 100, withDuration: 2, andAnimation: .linear, andCounterType: .intType)
    }
    
    private func setupLabel() {
        view.addSubview(countingLabel)
        countingLabel.translatesAutoresizingMaskIntoConstraints  = false
        countingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        countingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        countingLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        countingLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true

    }
}
