//
//  Image.swift
//  IDZSwiftGraphics
//
//  Created by idz on 3/9/15.
//  Copyright (c) 2015 iOSDeveloperZone.com. All rights reserved.
//

import Foundation

#if os(OSX)
import AppKit
public typealias Image = AppKit.NSImage
#else
import UIKit
public typealias Image = UIKit.UIImage
#endif

#if os(OSX)
extension NSImage {
    var CGImage: CGImage? {
        return self.cgImage(forProposedRect: nil, context: nil, hints: nil)
    }
    
    var PNGData: Data? {
        guard let cgImage = self.CGImage else { return nil }
        let rep = NSBitmapImageRep(cgImage: cgImage)
        rep.size = self.size        
        return rep.representation(using: .png, properties: [:])
    }
}
    
public func renderImage(size: CGSize, opaque: Bool, scale: CGFloat, render : (_ context: CGContext, _ bounds: CGRect, _ scale: CGFloat) -> ()) -> NSImage {
    let image = NSImage(size: size)
    image.lockFocus()
    let nsContext = NSGraphicsContext.current
    let ctx = nsContext.cgContext
    let bounds = CGRect(origin: CGPoint(), size: size)
    render(ctx, bounds, scale)
    image.unlockFocus()
    return image
}
#else
public func renderImage(_ size: CGSize, opaque: Bool, scale: CGFloat, render : (_ context: CGContext, _ bounds: CGRect, _ scale: CGFloat) -> ()) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(size, opaque, scale)
    let ctx = UIGraphicsGetCurrentContext()
    let bounds = CGRect(origin: CGPoint.zero, size: size)
    render(ctx!, bounds, scale)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image!
}
#endif
