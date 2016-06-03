// Playground - noun: a place where people can play

import UIKit
import IDZSwiftGraphics

let dpi = 326
let dpmm = 326 / 25.4
let h = 42 * dpmm


let image = renderImage(CGSizeMake(552.0,950.0), opaque:false, scale:CGFloat(2.0)) { ctx, bounds, scale in
    // Move origin to center
    CGContextTranslateCTM(ctx, bounds.size.width/2.0, bounds.size.height/2.0)
    
    // Some basic geometry
    let outerBezelSize = CGSize(width: 460, height: 540)
    let bezelLowlightSize  = CGSize(width: 440, height: 525)
    let innerBezelSize = CGSize(width: 420, height: 500)
    let screenSize     = CGSize(width: 312, height: 390)
    
    let outerBezelRect = CGRect(center:CGPointZero, size:outerBezelSize)
    let bezelLowlightRect = CGRect(center: CGPointMake(0,0), size: bezelLowlightSize)
    let innerBezelRect = CGRect(center:CGPointZero, size:innerBezelSize)
    let screenRect     = CGRect(center:CGPointZero, size:screenSize)
    
    let strapStart = CGPointMake(-312/2.0-20.0, outerBezelRect.origin.y + 6.0)
    let strapMiddle = CGPointMake(strapStart.x + 30.0, strapStart.y - 50)
    let strapEnd = CGPointMake(0, -430)
    let control0 = CGPointMake(strapMiddle.x, strapMiddle.y + 30)
    let control1 = CGPointMake(strapMiddle.x, strapEnd.y)
    let control2 = CGPointMake(strapMiddle.x, strapEnd.y)
    
    // Body path
    var path = CGPathCreateMutable()
    path.addRoundedRect(outerBezelRect, radius: 87.0)
    path.addRoundedRect(innerBezelRect, radius: 67.0)
    path.addRect(screenRect)
    
    // Strap top left (we'll just use symmetry later)
    var strap = CGPathCreateMutable()
    strap.moveTo(strapStart)
    strap.addQuadCurveTo(strapMiddle, controlPoint: control0)
    strap.addCurveTo(strapEnd, controlPoint1: control1, controlPoint2: control2)
    
    let reflectX = CGAffineTransformMakeScale(-1.0, 1.0)
    let reflectY = CGAffineTransformMakeScale(1.0, -1.0)
    let reflectXY = CGAffineTransformMakeScale(-1.0, -1.0)
    
    var lowlight = CGPathCreateMutable()
    lowlight.addRoundedRect(bezelLowlightRect, radius: 77.0)
    
    ctx.setStrokeColor(Color.red())
    ctx.addPath(path)
    ctx.addPath(strap)
    ctx.addPath(strap.copyWithTransform(reflectX))
    ctx.addPath(strap.copyWithTransform(reflectY))
    ctx.addPath(strap.copyWithTransform(reflectXY))
    ctx.strokePath()
    
//    ctx.addPath(lowlight)
//    var components : [CGFloat] = [1.0, 0.0, 0.0, 1.0]
//    CGContextSetRGBStrokeColor(ctx, 0.75, 0.75, 0.75, 1.0)
//    CGContextSetLineWidth(ctx, 5.0)
//    ctx.strokePath()
    
}
image
image
print(NSDate())




