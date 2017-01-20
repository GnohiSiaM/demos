//: Playground - noun: a place where people can play

// http://stackoverflow.com/questions/18880919/why-is-cornerradii-parameter-of-cgsize-type-in-uibezierpath-bezierpathwithroun

import UIKit
import XCPlayground

let containerView = UIView(frame: CGRectMake(0, 0, 360, 360))
containerView.backgroundColor = UIColor.whiteColor()
XCPlaygroundPage.currentPage.liveView = containerView

let view = UIView(frame: CGRectMake(30, 60, 300, 200))
let maskLayer = CAShapeLayer()
maskLayer.path = UIBezierPath(
    roundedRect: view.bounds ,
    byRoundingCorners: [.TopLeft, .TopRight, .BottomRight],
    cornerRadii: CGSizeMake(50, 0)
).CGPath
view.layer.mask = maskLayer
view.backgroundColor = UIColor.lightGrayColor()

containerView.addSubview(view)
