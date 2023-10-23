//
//  ProgressView.swift
//  HW12
//
//  Created by Христина Буянова on 23.10.2023.
//

import UIKit

final class ProgressView: UIView {
    func drawPrograss(with percent: CGFloat) {

        let circleFrame = UIScreen.main.bounds.width - ( 15 + 40 ) * 2
        let radius = circleFrame / 2
        let centr = CGPoint(x: radius, y: radius)
        let startAngle
        let stopAngle

        let circlePath = UIBezierPath(arcCenter: <#T##CGPoint#>,
                                      radius: <#T##CGFloat#>,
                                      startAngle: <#T##CGFloat#>,
                                      endAngle: <#T##CGFloat#>,
                                      clockwise: <#T##Bool#>)
    }
}
