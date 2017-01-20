//
//  DrawingTestView.swift
//  DingyuedianToB
//
//  Created by Jim Du on 10/31/15.
//  Copyright © 2015 augmentum. All rights reserved.
//



//    变换（transformation）修改了图形上下文中绘制图形的方式。可以通过移动、旋转或缩放实现变换。
//    Quartz提供了多种形式的变换，其中主要：CTM（当前变换矩阵）变换和仿射（affine）变换。
//    CTM（current transformation matrix）变换，这种变换比较简单，函数有：
//    CGContextRotateCTM，旋转坐标
//    CGContextScaleCTM，缩放坐标
//    CGContextTranslateCTM，移动原点
//    移动变换
//    CGContextTranslateCTM (myContext, 100, 50)

//    仿射（affine）变换也是一种直角坐标变换，重用变换，经过多次变换（多次的矩阵相乘），
//    每一种变换都可以用矩阵表示，通过多次矩阵相乘得到最后结果。仿射变换函数：
//    CGAffineMakeRotation，创建旋转矩阵仿射对象
//    CGAffineMakeScale，创建缩放矩阵仿射对象
//    CGAffineMakeTranslation，创建移动矩阵仿射对象
//    CGAffineTransformRotate，旋转矩阵仿射对象
//    CGAffineTransformScale，缩放矩阵仿射对象
//    CGAffineTransformTranslate，移动矩阵仿射对象
//    CGContextConcatCTM，连接到CTM变换


import Foundation
import UIKit
import XCPlayground

class DrawingTestView: UIView {
    
    private var type: Int = 0
    
    init(type: Int) {
        super.init(frame: CGRectMake(0, 0, 400, 600))
        
        self.backgroundColor = UIColor.clearColor()
        self.type = type
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /**
     *  drawRect方法是在viewdidLoad方法后调用,也在sizeToFit方法后调用,触发视图更新的动作有如下几种:
     *  1.手动调用 self.setNeedsDisplay()/setNeedsDisplayInRect() 方法后会调用drawRect方法
     *  2.自定义View第一次呈现时会调用drawRect方法
     *  3.对遮挡您的视图的其它视图进行移动或删除操作
     *  4.将视图的hidden属性声明设置为NO，使其从隐藏状态变为可见
     *  5.将视图滚出屏幕，然后再重新回到屏幕上
     */
    override func drawRect(rect: CGRect) {
        switch type {
        case 0:
            drawLine(rect)
            
        case 1:
            drawGrid(rect)
            
        case 2:
            drawGridII(rect)
            
        case 3:
            drawGridIII(rect)
            
        case 4:
            drawBézier(rect)
            
        case 5:
            drawSquareI(rect)
            
        case 6:
            drawSquareII(rect)
            
        case 7:
            drawTriangle(rect)
            
        case 8:
            drawArc(rect)
            
        case 9:
            drawSector(rect)
            
        case 10:
            drawCircle(rect)
            
        case 11:
            drawText(rect)
            
        case 12:
            drawImage(rect)
            
        case 13:
            drawRoundedPolygonal(rectToCoordinates(rect), 4)
            
        case 15:
            drawBezierRect(rect)
            
        case 16:
            drawBezierCircle(rect)
            
        case 16:
            drawMask(rect)
        
        default:
            break
        }
    }
    
    private func rectToCoordinates (rect: CGRect) -> [(CGFloat, CGFloat)] {
        let x = rect.origin.x
        let y = rect.origin.y
        let width = rect.size.width
        let height = rect.size.height
        let padding: CGFloat = 1
        
        return [
            (x + padding, y + padding),
            (x + width - padding * 2, y + padding),
            (x + width - padding * 2, y + height - padding * 2),
            (x + padding, y + height - padding * 2)
        ]
    }
    
    private func pathFromCoordinates(var coordinates: [(CGFloat, CGFloat)], radius: CGFloat) -> CGPath? {
        let currentContext:CGContextRef = UIGraphicsGetCurrentContext()!
        
        if coordinates.count < 3 {
            print("coordinates not enough")
            return nil
        }
        
        // 起点不设在coordinates[0]是考虑闭合路径时要留空间画弧
        let (endX, endY) = coordinates.removeAtIndex(0)
        var (startX, startY) = (endX, endY)
        var (x, y) = coordinates.removeAtIndex(0)
        
        if endY == y {
            startX = endX < x ? endX + radius : endX - radius
        } else if endX == x {
            startY = endY < y ? endY + radius : endY - radius
        } else {
            print("improper coordinates")
            return nil
        }
        
        CGContextMoveToPoint(currentContext, startX, startY)
        for (nextX, nextY) in coordinates {
            CGContextAddArcToPoint(currentContext, x, y, nextX, nextY, radius)
            (x, y) = (nextX, nextY)
        }
        CGContextAddArcToPoint(currentContext, x, y, endX, endY, radius)
        CGContextAddArcToPoint(currentContext, endX, endY, startX, startY, radius)
        CGContextClosePath(currentContext)
        
        return CGContextCopyPath(currentContext)
    }
    
    // MARK: - Test For Drawing Anything
    private func drawLine(rect: CGRect) {
        // 获取上下文, 一个不透明类型的Quartz 2D绘画环境, 相当于一个画布
        let currentContext:CGContextRef = UIGraphicsGetCurrentContext()!
        // 设置线宽(默认一个为1)
        CGContextSetLineWidth(currentContext, 8)
        // 设置线的头尾样式 Butt/Round/Square
        CGContextSetLineCap(currentContext, CGLineCap.Round)
        // 设置线线的连接点样式 Miter/Round/Bevel
        CGContextSetLineJoin(currentContext, CGLineJoin.Bevel)
        // 设置起始点
        CGContextMoveToPoint(currentContext, 120, 20)
        // 设置连接点
        CGContextAddLineToPoint(currentContext, 300, 80)
        CGContextAddLineToPoint(currentContext, 160, 180)
        CGContextAddLineToPoint(currentContext, 260, 220)
        CGContextAddLineToPoint(currentContext, 180, 340)
        CGContextAddLineToPoint(currentContext, 240, 460)
        // 设置颜色
        // UIColor.blackColor().setStroke()
        // UIColor.redColor().setFill()
        CGContextSetRGBStrokeColor(currentContext, 0.0, 0.6, 0.6, 0.9)
        
        // 绘制线
        CGContextStrokePath(currentContext)
    }
    
    private func drawGrid(rect: CGRect) {
        let gridWidth: CGFloat = 25
        let width: CGFloat = rect.size.width
        let height: CGFloat = rect.size.height
        let line: CGFloat = 1.0 / UIScreen.mainScreen().scale
        
        let path = UIBezierPath()
        for var i: CGFloat = 0; i <= width; i = i + gridWidth {
            path.appendPath(UIBezierPath(rect:CGRectMake(i, 0, line, height)))
        }
        for var i: CGFloat = 0; i <= height; i = i + gridWidth {
            path.appendPath(UIBezierPath(rect:CGRectMake(0, i, width, line)))
        }
        UIColor.lightGrayColor().setFill()
        path.fill()
    }
    
    private func drawGridII(rect: CGRect) {
        let gridWidth: CGFloat = 25
        let width: CGFloat = rect.size.width
        let height: CGFloat = rect.size.height
        let line: CGFloat = 1.0 / UIScreen.mainScreen().scale
        
        let currentContext:CGContextRef = UIGraphicsGetCurrentContext()!
        CGContextSetRGBFillColor(currentContext, 0.0, 0.0, 0.0, 0.5)
        for var i: CGFloat = 0; i <= width; i = i + gridWidth {
            CGContextAddRect(currentContext, CGRectMake(i, 0, line, height))
        }
        for var i: CGFloat = 0; i <= height; i = i + gridWidth {
            CGContextAddRect(currentContext, CGRectMake(0, i, width, line))
        }
        CGContextFillPath(currentContext)
    }
    
    private func drawGridIII(rect: CGRect){
        let gridWidth: CGFloat = 25
        let width: CGFloat = rect.size.width
        let height: CGFloat = rect.size.height
        
        UIColor.lightGrayColor().setStroke()
        let drawingPath: UIBezierPath = UIBezierPath()
        drawingPath.lineWidth = 1.0 / UIScreen.mainScreen().scale
        for var i: CGFloat = 0; i <= width; i = i + gridWidth {
            drawingPath.moveToPoint(CGPointMake(i, 0))
            drawingPath.addLineToPoint(CGPointMake(i, height))
        }
        for var i: CGFloat = 0; i <= height; i = i + gridWidth {
            drawingPath.moveToPoint(CGPointMake(0, i))
            drawingPath.addLineToPoint(CGPointMake(width, i))
        }
        drawingPath.stroke()
    }
    
    private func drawSquareI(rect: CGRect) {
        let currentContext:CGContextRef = UIGraphicsGetCurrentContext()!
        CGContextSetLineWidth(currentContext, 2)
        CGContextSetRGBStrokeColor(currentContext, 0.0, 1.0, 0.0, 0.7)
        CGContextMoveToPoint(currentContext, 10, 10)
        CGContextAddLineToPoint(currentContext, 80, 10)
        CGContextAddLineToPoint(currentContext, 80, 80)
        CGContextAddLineToPoint(currentContext, 10, 80)
        // 方式1 连接起始点
        // CGContextAddLineToPoint(currentContext, 10, 10);
        // 方式2 闭合路径
        CGContextClosePath(currentContext)
        // 绘制空心矩形
        CGContextStrokePath(currentContext)
    }
    
    private func drawSquareII(rect: CGRect) {
        let currentContext:CGContextRef = UIGraphicsGetCurrentContext()!
        CGContextSetLineWidth(currentContext, 4)
        CGContextSetRGBStrokeColor(currentContext, 0.0, 1.0, 0.0, 0.7)
        
        //CGContextSaveGState(currentContext)
        /*  CGContextSaveGState 函数的作用是将当前图形状态推入堆栈。
        之后，您对图形状态所做的修改会影响随后的描画操作，但不影响存储在堆栈中的拷贝。
        在修改完成后，您可以通过 CGContextRestoreGState 函数把堆栈顶部的状态弹出，返回到之前的图形状态。
        这种推入和弹出的方式是回到之前图形状态的快速方法，避免逐个撤消所有的状态修改；
        这也是将某些状态（比如裁剪路径）恢复到原有设置的唯一方式。
        */
        //CGContextRestoreGState(currentContext)
        
        CGContextAddRect(currentContext, CGRectMake(10, 105, 80, 60))
        // 绘制实心矩形
        //CGContextFillPath(currentContext)
        CGContextDrawPath(currentContext, CGPathDrawingMode.FillStroke) // Fill/EOFill/Stroke/FillStroke/EOFillStroke
    }
    
    /*贝塞尔曲线*/
    private func drawBézier(rect: CGRect) {
        let currentContext:CGContextRef = UIGraphicsGetCurrentContext()!
        //二次曲线
        CGContextMoveToPoint(currentContext, 320, 100)
        //设置贝塞尔曲线的控制点坐标和终点坐标
        CGContextAddQuadCurveToPoint(currentContext, 370, 260, 450, 130)
        CGContextStrokePath(currentContext)
        
        //三次曲线函数
        CGContextMoveToPoint(currentContext, 500, 100)
        //设置贝塞尔曲线的控制点坐标和控制点坐标终点坐标
        CGContextAddCurveToPoint(currentContext,550, 280, 600, 50, 650, 120)
        CGContextStrokePath(currentContext)
    }
    
    private func drawTriangle(rect: CGRect) {
        let currentContext:CGContextRef = UIGraphicsGetCurrentContext()!
        //只要三个点就行跟画一条线方式一样，把三点连接起来
        let points = [CGPointMake(10, 700), CGPointMake(40, 780), CGPointMake(130, 670)]
        CGContextAddLines(currentContext, points, 3)
        CGContextClosePath(currentContext)
        CGContextDrawPath(currentContext, CGPathDrawingMode.FillStroke)
    }
    
    private func drawArc(rect: CGRect) {
        let currentContext:CGContextRef = UIGraphicsGetCurrentContext()!
        /**
        *  x,y 圆心
        *  radius 半径
        *  startAngle 画弧的起始位置
        *  endAngel 画弧的结束位置
        *  clockwise 0 顺针 1 逆时针
        */
        CGContextAddArc(currentContext, 60, 200, 40, CGFloat(-M_PI_4), CGFloat(M_PI), 0)
        CGContextStrokePath(currentContext)
    }
    
    private func drawSector(rect: CGRect) {
        let currentContext:CGContextRef = UIGraphicsGetCurrentContext()!
        // 根据一个点->连接弧形起始点->再关闭路径
        CGContextMoveToPoint(currentContext, 60, 300)
        CGContextAddArc(currentContext, 60, 300, 40, CGFloat(-M_PI_4), CGFloat(M_PI_4 * 5), 0)
        CGContextClosePath(currentContext)
        CGContextFillPath(currentContext)
        // CGContextStrokePath(currentContext)
    }
    
    private func drawCircle(rect: CGRect) {
        let currentContext:CGContextRef = UIGraphicsGetCurrentContext()!
        // CGContextSetRGBStrokeColor(currentContext, 1.0, 0, 0, 0.7)
        CGContextSetRGBFillColor(currentContext, 0, 1.0, 0, 0.7)
        // 设置空心圆线的大小
        // CGContextSetLineWidth(currentContext, 3)
        // 画圆 根据Rect的大小画出的圆形可以是椭圆
        CGContextAddEllipseInRect(currentContext, CGRectMake(60, 380, 90, 80))
        // CGContextStrokePath(currentContext)
        CGContextFillPath(currentContext)
    }
    
    private func drawText(rect: CGRect) {
        let text: String = "Hello,🐮!"
        
        let shadow: NSShadow = NSShadow()
        shadow.shadowColor = UIColor.lightGrayColor()
        shadow.shadowBlurRadius = 1.0
        shadow.shadowOffset = CGSizeMake(2.0, 2.0)
        
        let attributes = [
            NSFontAttributeName: UIFont.systemFontOfSize(23),
            NSForegroundColorAttributeName: UIColor.blueColor(),
            NSVerticalGlyphFormAttributeName: 0,
            NSShadowAttributeName: shadow]
        text.drawInRect(rect, withAttributes: attributes)
        // text.drawAtPoint(CGPointMake(10, 500), withAttributes:attributes)
    }
    
    private func drawImage(rect: CGRect) {
        let image:UIImage = UIImage(named:"RoundTableForSix")!
        image.drawAsPatternInRect(rect) // draws the image as a CGPattern
        // image.drawInRect(CGRectMake(200, 100, image.size.width, image.size.width))
        // image.drawInRect(rect: CGRect, blendMode: CGBlendMode, alpha: CGFloat)
        // image.drawAtPoint(CGPointMake(200, 100))
        // image.drawAtPoint(point: CGPoint, blendMode: CGBlendMode, alpha: CGFloat)
    }
    
    private func drawRoundedPolygonal(coordinates: [(CGFloat, CGFloat)], _ radius: CGFloat) {
        let path = UIBezierPath(CGPath: self.pathFromCoordinates(coordinates, radius: radius)!)
        UIColor.lightGrayColor().setStroke()
        UIColor.clearColor().setFill()
        path.stroke()
        path.fill()
    }
    
    private func drawBezierRect(rect: CGRect) {
        let path = UIBezierPath(rect:rect)
        path.lineWidth = 6
        path.lineJoinStyle = CGLineJoin.Round
        UIColor.blueColor().setStroke()
        path.stroke()
    }
    
    private func drawBezierCircle(rect: CGRect) {
        let path = UIBezierPath()
        path.addArcWithCenter(self.center, radius: 100, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
        path.lineWidth = 12
        UIColor.blueColor().setStroke()
        UIColor.greenColor().setFill()
        path.stroke()
        path.fill()
    }
    
    private func drawMask(rect: CGRect) {
        let path = UIBezierPath(rect: rect)
        
        let circlePath = UIBezierPath()
        circlePath.addArcWithCenter(CGPointMake(100, 100), radius: 50, startAngle: 0, endAngle: CGFloat(M_PI * 2), clockwise: true)
        path.appendPath(circlePath)
        
        path.appendPath(UIBezierPath(roundedRect: CGRectMake(50,200,100,100), cornerRadius: 10))
        
        let coordinates: [(CGFloat, CGFloat)] = [
            (300, 300),
            (400, 300),
            (400, 400),
            (500, 400),
            (500, 500),
            (200, 500),
            (200, 100),
            (700, 100),
            (700, 400),
            (600, 400),
            (600, 200),
            (300, 200)
        ]
        path.appendPath(UIBezierPath(CGPath: pathFromCoordinates(coordinates, radius: 10)!))
        
        path.addClip()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = rect
        shapeLayer.path = path.CGPath
        shapeLayer.fillRule = kCAFillRuleEvenOdd
        //kCAFillRuleNonZero，非零。按该规则，要判断一个点是否在图形内，从该点作任意方向的一条射线，然后检测射线与图形路径的交点情况。从0开始计数，路径从左向右穿过射线则计数加1，从右向左穿过射线则计数减1。得出计数结果后，如果结果是0，则认为点在图形外部，否则认为在内部。
        //kCAFillRuleEvenOdd，奇偶。按该规则，要判断一个点是否在图形内，从该点作任意方向的一条射线，然后检测射线与图形路径的交点的数量。如果结果是奇数则认为点在内部，是偶数则认为点在外部。
        
        let maskLayer = CALayer()
        maskLayer.frame = rect
        maskLayer.backgroundColor = UIColor.blackColor().CGColor
        maskLayer.opacity = 0.3
        maskLayer.mask = shapeLayer
        self.layer.addSublayer(maskLayer)
    }
    
}

let containerView = UIView(frame: CGRectMake(0, 0, 400, 600))
containerView.backgroundColor = UIColor.whiteColor()
XCPlaygroundPage.currentPage.liveView = containerView

containerView.addSubview(DrawingTestView(type: 2))
