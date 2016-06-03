//
//  Image.swift
//  IDZSwiftGraphics
//
//  Created by idz on 3/9/15.
//  Copyright (c) 2015 iOSDeveloperZone.com. All rights reserved.
//

import Foundation

#if os(OSX)
public typealias Image = AppKit.NSImage
#else
public typealias Image = UIKit.UIImage
#endif

#if os(OSX)
extension NSImage {
    var CGImage: CGImageRef? {
        return self.CGImageForProposedRect(nil, context: nil, hints: nil)
    }
    
    var PNGData: NSData? {
        guard let cgImage = self.CGImage else { return nil }
        let rep = NSBitmapImageRep(CGImage: cgImage)
        rep.size = self.size
        return rep.representationUsingType(.NSPNGFileType, properties: [:])
    }
}
    
func renderImage(size: CGSize, opaque: Bool, scale: CGFloat, render : (context: CGContext, bounds: CGRect, scale: CGFloat) -> ()) -> NSImage {
    let image = NSImage(size: size)
    image.lockFocus()
    let nsContext = NSGraphicsContext.currentContext()!
    let ctx = nsContext.CGContext
    let bounds = CGRect(origin: CGPointZero, size: size)
    render(context:ctx, bounds:bounds, scale:scale)
    image.unlockFocus()
    return image
}
#else
public func renderImage(size: CGSize, opaque: Bool, scale: CGFloat, render : (context: CGContext, bounds: CGRect, scale: CGFloat) -> ()) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(size, opaque, scale)
    let ctx = UIGraphicsGetCurrentContext()
    let bounds = CGRect(origin: CGPointZero, size: size)
    render(context:ctx!, bounds:bounds, scale:scale)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
}
#endif
