//
//  Image.swift
//  IDZSwiftGraphics
//
//  Created by idz on 3/9/15.
//  Copyright (c) 2015 iOSDeveloperZone.com. All rights reserved.
//

import Foundation

#if os(OSX)
func renderImage(size: CGSize, opaque: Bool, scale: CGFloat, render : (context: CGContext, bounds: CGRect, scale: CGFloat) -> ()) -> NSImage {
    
    UIGraphicsBeginImageContextWithOptions(size, opaque, scale)
    let ctx = UIGraphicsGetCurrentContext()
    let bounds = CGRect(origin: CGPointZero, size: size)
    render(context:ctx, bounds:bounds, scale:scale)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
    }
#else
public func renderImage(size: CGSize, opaque: Bool, scale: CGFloat, render : (context: CGContext, bounds: CGRect, scale: CGFloat) -> ()) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(size, opaque, scale)
    let ctx = UIGraphicsGetCurrentContext()
    let bounds = CGRect(origin: CGPointZero, size: size)
    render(context:ctx, bounds:bounds, scale:scale)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
}
#endif
