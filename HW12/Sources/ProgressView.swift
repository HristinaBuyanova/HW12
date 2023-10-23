//
//  ProgressView.swift
//  HW12
//
//  Created by Христина Буянова on 23.10.2023.
//

import UIKit

final class ProgressView: UIView {
    
    func drawPrograssWork(with percent: CGFloat) {

        let circleFrame = UIScreen.main.bounds.width - ( 15 + 40 ) * 2
        let radius = circleFrame / 2
        let centr = CGPoint(x: radius, y: radius)
        let startAngle = -CGFloat.pi * 7 / 6
        let stopAngle = CGFloat.pi * 1 / 6

        let circlePath = UIBezierPath(arcCenter: centr,
                                      radius: radius,
                                      startAngle: startAngle,
                                      endAngle: stopAngle,
                                      clockwise: true)

        let defaultCircleLayer =  CAShapeLayer()
        defaultCircleLayer.path = circlePath.cgPath
        defaultCircleLayer.strokeColor = UIColor.systemGray.cgColor
        defaultCircleLayer.lineWidth = 20
        defaultCircleLayer.strokeEnd = 1
        defaultCircleLayer.fillColor  = UIColor.clear.cgColor
        defaultCircleLayer.lineCap  = .round

        let circleLayer =  CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.strokeColor = UIColor.systemRed.cgColor
        circleLayer.lineWidth = 20
        circleLayer.strokeEnd = percent
        circleLayer.fillColor  = UIColor.clear.cgColor
        circleLayer.lineCap  = .round

        layer.addSublayer(defaultCircleLayer)
        layer.addSublayer(circleLayer)
    }

    func drawPrograssRelax(with percent: CGFloat) {

        let circleFrame = UIScreen.main.bounds.width - ( 15 + 40 ) * 2
        let radius = circleFrame / 2
        let centr = CGPoint(x: radius, y: radius)
        let startAngle = -CGFloat.pi * 7 / 6
        let stopAngle = CGFloat.pi * 1 / 6

        let circlePath = UIBezierPath(arcCenter: centr,
                                      radius: radius,
                                      startAngle: startAngle,
                                      endAngle: stopAngle,
                                      clockwise: true)

        let defaultCircleLayer =  CAShapeLayer()
        defaultCircleLayer.path = circlePath.cgPath
        defaultCircleLayer.strokeColor = UIColor.systemGray.cgColor
        defaultCircleLayer.lineWidth = 20
        defaultCircleLayer.strokeEnd = 1
        defaultCircleLayer.fillColor  = UIColor.clear.cgColor
        defaultCircleLayer.lineCap  = .round

        let circleLayer =  CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.strokeColor = UIColor.systemMint.cgColor
        circleLayer.lineWidth = 20
        circleLayer.strokeEnd = percent
        circleLayer.fillColor  = UIColor.clear.cgColor
        circleLayer.lineCap  = .round

        layer.addSublayer(defaultCircleLayer)
        layer.addSublayer(circleLayer)
    }
}
