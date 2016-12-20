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

    public func idz_moveTo(_ point: CGPoint) -> CGMutablePath {
        self.move(to: point)
        return self
    }
    public func idz_moveTo(_ x: CGFloat, y: CGFloat) -> CGMutablePath {
        self.move(to: CGPoint(x: x, y: y))
        return self
    }
    public func idz_lineTo(_ point: CGPoint) -> CGMutablePath {
        self.addLine(to: point)
        return self
    }
    public func idz_lineTo(_ x: CGFloat, y: CGFloat)  -> CGMutablePath {
        self.addLine(to: CGPoint(x: x, y: y))
        return self
    }
    
    public func idz_addEllipse(_ bounds: CGRect)  -> CGMutablePath {
        self.addEllipse(in: bounds)
        return self
    }
    public func idz_addRoundedRect(_ rect: CGRect, radius: CGFloat) -> CGMutablePath {
        self.__addRoundedRect(transform: nil, rect: rect, cornerWidth: radius, cornerHeight: radius)
        return self
    }
    
    public func idz_addRect(_ rect: CGRect) -> CGMutablePath {
        self.addRect(rect)
        return self
    }
    
    public func idz_addQuadCurveTo(_ point: CGPoint, controlPoint: CGPoint) -> CGMutablePath {
        self.addQuadCurve(to: point, control: controlPoint)
        return self
    }
    public func idz_addCurveTo(_ point: CGPoint, controlPoint1: CGPoint, controlPoint2: CGPoint) -> CGMutablePath {
        self.addCurve(to: point, control1: controlPoint1, control2: controlPoint2)
        return self
    }
    public func idz_copyWithTransform(_ t: CGAffineTransform) -> CGPath {
        var transform = t
        return self.copy(using: &transform)!
    }
    
    
}
