//: Playground - noun: a place where people can play

import UIKit
import XCPlayground

let containerView = UIView(frame: CGRectMake(0, 0, 360, 360))
containerView.backgroundColor = UIColor.whiteColor()
XCPlaygroundPage.currentPage.liveView = containerView

let shadowLayer = CALayer()
shadowLayer.frame = CGRectMake(0, 1, 300, 20)
shadowLayer.shadowColor = UIColor.blackColor().CGColor
shadowLayer.shadowOffset = CGSizeZero
shadowLayer.shadowOpacity = 0.5
shadowLayer.shadowRadius = 6
shadowLayer.shadowPath = UIBezierPath(rect: CGRectMake(0, 0, 300, 3)).CGPath
shadowLayer.masksToBounds = true

let line = UIView(frame: CGRectMake(30, 60, 300, 1))
line.backgroundColor = UIColor.brownColor()
line.layer.addSublayer(shadowLayer)

containerView.addSubview(line)
