//
//  Geometry.swift
//  IDZSwiftGraphics
//
//  Created by idz on 3/9/15.
//  Copyright (c) 2015 iOSDeveloperZone.com. All rights reserved.
//

import Foundation

/*
 * Calculates the scale and translation required to map from [x0,x1] onto [x2,x3]
 */
func scaleAndTranslation(x0:CGFloat, x1: CGFloat, x2: CGFloat, x3: CGFloat) -> (CGFloat, CGFloat) {
    let s = (x3 - x2) / (x1 - x0)
    let t = x2 - x0 * s;
    return (s,t)
}

extension CGRect {
    public init(center: CGPoint, size: CGSize) {
        self.origin = CGPointMake(center.x - size.width / 2.0, center.y - size.height / 2.0)
        self.size = size
    }
}

extension CGAffineTransform {
    public init(from: CGRect, to: CGRect)
    {
        let (sx, tx) = scaleAndTranslation(from.origin.x, from.origin.x + from.size.width, to.origin.x, to.origin.x + to.size.width)
        let (sy, ty) = scaleAndTranslation(from.origin.y, from.origin.y + from.size.height, to.origin.y, to.origin.y + to.size.height)
        self.init(a:sx, b:0.0, c:0.0, d:sy, tx:tx, ty:ty)
    }
}