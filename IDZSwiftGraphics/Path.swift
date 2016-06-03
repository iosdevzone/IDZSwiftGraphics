//
//  Path.swift
//  IDZSwiftGraphics
//
//  Created by idz on 3/10/15.
//  Copyright (c) 2015 iOSDeveloperZone.com. All rights reserved.
//

import Foundation

public typealias Path = CoreGraphics.CGPath
public typealias MutablePath = CoreGraphics.CGMutablePath

extension CGMutablePath {

    public func moveTo(point: CGPoint) -> CGMutablePath {
        CGPathMoveToPoint(self, nil, point.x, point.y)
        return self
    }
    public func moveTo(x: CGFloat, y: CGFloat) -> CGMutablePath {
        CGPathMoveToPoint(self, nil, x, y)
        return self
    }
    public func lineTo(point: CGPoint) -> CGMutablePath {
        CGPathAddLineToPoint(self, nil, point.x, point.y)
        return self
    }
    public func lineTo(x: CGFloat, y: CGFloat)  -> CGMutablePath {
        CGPathAddLineToPoint(self, nil, x, y)
        return self
    }
    public func addEllipse(bounds: CGRect)  -> CGMutablePath {
        CGPathAddEllipseInRect(self, nil, bounds)
        return self
    }
    public func addRoundedRect(rect: CGRect, radius: CGFloat) -> CGMutablePath {
        CGPathAddRoundedRect(self, nil, rect, radius, radius)
        return self
    }
    public func addRect(rect: CGRect) -> CGMutablePath {
        CGPathAddRect(self, nil, rect)
        return self
    }
    public func addQuadCurveTo(point: CGPoint, controlPoint: CGPoint) -> CGMutablePath {
        CGPathAddQuadCurveToPoint(self, nil, controlPoint.x, controlPoint.y, point.x, point.y)
        return self
    }
    public func addCurveTo(point: CGPoint, controlPoint1: CGPoint, controlPoint2: CGPoint) -> CGMutablePath {
        CGPathAddCurveToPoint(self, nil, controlPoint1.x, controlPoint1.y, controlPoint2.x, controlPoint2.y, point.x, point.y)
        return self
    }
    public func copyWithTransform(t: CGAffineTransform) -> CGPath {
        var transform = t
        return CGPathCreateCopyByTransformingPath(self, &transform)!
    }
    
    
}
