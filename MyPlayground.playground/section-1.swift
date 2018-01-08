// Playground - noun: a place where people can play

import UIKit
import IDZSwiftGraphics

let dpi = 326
let dpmm = 326 / 25.4
let h = 42 * dpmm


let image = renderImage(CGSize(width:552.0,height:950.0), opaque:false, scale:CGFloat(2.0)) { ctx, bounds, scale in
    // Move origin to center
    ctx.translateBy(x: bounds.size.width/2.0, y: bounds.size.height/2.0)

    
    // Some basic geometry
    let outerBezelSize = CGSize(width: 460, height: 540)
    let bezelLowlightSize  = CGSize(width: 440, height: 525)
    let innerBezelSize = CGSize(width: 420, height: 500)
    let screenSize     = CGSize(width: 312, height: 390)
    
    let outerBezelRect = CGRect(center:CGPoint(), size:outerBezelSize)
    let bezelLowlightRect = CGRect(center: CGPoint(), size: bezelLowlightSize)
    let innerBezelRect = CGRect(center:CGPoint(), size:innerBezelSize)
    let screenRect     = CGRect(center:CGPoint(), size:screenSize)
    
    let strapStart = CGPoint(x:-312/2.0-20.0, y:outerBezelRect.origin.y + 6.0)
    let strapMiddle = CGPoint(x:strapStart.x + 30.0, y:strapStart.y - 50)
    let strapEnd = CGPoint(x: 0, y: -430)
    let control0 = CGPoint(x: strapMiddle.x, y: strapMiddle.y + 30)
    let control1 = CGPoint(x: strapMiddle.x, y: strapEnd.y)
    let control2 = CGPoint(x: strapMiddle.x, y: strapEnd.y)
    
    // Body path
    var path = CGMutablePath()
    path.idz_addRoundedRect(outerBezelRect, radius: 87.0)
    path.idz_addRoundedRect(innerBezelRect, radius: 67.0)
    path.idz_addRect(screenRect)
    
    // Strap top left (we'll just use symmetry later)
    var strap = CGMutablePath()
    strap.idz_moveTo(strapStart)
    strap.idz_addQuadCurveTo(strapMiddle, controlPoint: control0)
    strap.idz_addCurveTo(strapEnd, controlPoint1: control1, controlPoint2: control2)
    
    let reflectX = CGAffineTransform(scaleX: -1.0, y: 1.0)
    let reflectY = CGAffineTransform(scaleX: 1.0, y: -1.0)
    let reflectXY = CGAffineTransform(scaleX: -1.0, y: -1.0)
    
    var lowlight = CGMutablePath()
    lowlight.idz_addRoundedRect(bezelLowlightRect, radius: 77.0)
    
    ctx.setStrokeColor(Color.red())
    ctx.idz_addPath(path)
    ctx.idz_addPath(strap)
    ctx.idz_addPath(strap.idz_copyWithTransform(reflectX))
    ctx.idz_addPath(strap.idz_copyWithTransform(reflectY))
    ctx.idz_addPath(strap.idz_copyWithTransform(reflectXY))
    ctx.idz_strokePath()
    
//    ctx.addPath(lowlight)
//    var components : [CGFloat] = [1.0, 0.0, 0.0, 1.0]
//    CGContextSetRGBStrokeColor(ctx, 0.75, 0.75, 0.75, 1.0)
//    CGContextSetLineWidth(ctx, 5.0)
//    ctx.strokePath()
    
}
image




