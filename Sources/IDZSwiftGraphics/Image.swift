//
//  Image.swift
//  IDZSwiftGraphics
//
//  Created by idz on 3/9/15.
//  Copyright (c) 2015 iOSDeveloperZone.com. All rights reserved.
//

import Foundation
import CoreServices // needed for kUTTypePNG

#if os(OSX)
import AppKit
public typealias Image = AppKit.NSImage
#else
import UIKit
public typealias Image = UIKit.UIImage
#endif
extension CGImage {
    public var PNGData: Data? {
        let mutableData = NSMutableData()
        guard let imageDestination = CGImageDestinationCreateWithData(mutableData, kUTTypePNG, 1, nil) else {
            return nil
        }
        CGImageDestinationAddImage(imageDestination, self, nil)
        CGImageDestinationFinalize(imageDestination)
        return mutableData as Data
    }
    
    public var size: CGSize { return CGSize(width: self.width, height: self.height)}
}

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
    
public func renderCGImage(size: CGSize, opaque: Bool, scale: CGFloat, render : (_ context: CGContext, _ bounds: CGRect, _ scale: CGFloat) -> ()) -> CGImage {
    
    guard let context = CGContext(data: nil,
                                  width: Int(size.width * scale),
                                  height: Int(size.height * scale),
                                  bitsPerComponent: 8, // bitsPerPixel
        bytesPerRow: 0,
        space: CGColorSpaceCreateDeviceRGB(),
        bitmapInfo: CGImageAlphaInfo.premultipliedFirst.rawValue) else {
            fatalError("Failed to created graphics context")
    }
    context.scaleBy(x: scale, y: scale)
    NSGraphicsContext.saveGraphicsState()
    NSGraphicsContext.current = NSGraphicsContext(cgContext: context, flipped: false)
    let bounds = CGRect(origin: CGPoint.zero, size: size)
    render(context, bounds, scale)
    NSGraphicsContext.restoreGraphicsState()
    
    guard let image = context.makeImage() else {
        fatalError("Failed to create image from context.")
    }
    return image
}
    
public func renderImage(size: CGSize, opaque: Bool, scale: CGFloat, render : (_ context: CGContext, _ bounds: CGRect, _ scale: CGFloat) -> ()) -> NSImage {
    let image = NSImage(size: size)
    image.lockFocus()
    guard let nsContext = NSGraphicsContext.current else {
        fatalError("Failed to get NSGraphicsContext")
    }
    let ctx = nsContext.cgContext
    let bounds = CGRect(origin: CGPoint(), size: size)
    render(ctx, bounds, scale)
    image.unlockFocus()
    return image
}
#else
public func renderImage(size: CGSize, opaque: Bool, scale: CGFloat, render : (_ context: CGContext, _ bounds: CGRect, _ scale: CGFloat) -> ()) -> UIImage {
    UIGraphicsBeginImageContextWithOptions(size, opaque, scale)
    let ctx = UIGraphicsGetCurrentContext()
    let bounds = CGRect(origin: CGPoint.zero, size: size)
    render(ctx!, bounds, scale)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image!
}
#endif
