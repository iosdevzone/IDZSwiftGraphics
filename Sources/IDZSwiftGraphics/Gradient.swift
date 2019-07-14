//
//  Gradient.swift
//  IDZSwiftGraphicsPackageDescription
//
//  Created by Danny Keogan on 1/7/18.
//

import Foundation
#if os(OSX)
    import AppKit
#else
    import UIKit
#endif

public func GradientFill(ctx: CGContext, rect: CGRect, startColor: Color, endColor: Color)
{
    
    let colorspace = CGColorSpaceCreateDeviceRGB()
    let locations : [CGFloat] = [ 0.0, 1.0]
    var components : [CGFloat] = Array()
    components.append(contentsOf: startColor.rgba)
    components.append(contentsOf: endColor.rgba)
    
    //let count : UInt = 2
    guard let gradient = CGGradient(colorSpace: colorspace, colorComponents: components, locations: locations, count: locations.count) else {
        fatalError("Failed to create gradient.")
    }
    
    let startPoint = CGPoint(x: rect.midX, y: rect.minY)
    let endPoint = CGPoint(x: rect.midX, y: rect.maxY)
    ctx.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: CGGradientDrawingOptions(rawValue: 0))
}

#if os(OSX)

#else

    
    extension UIImage {
        var PNGData: Data? { return self.pngData() }
    }
#endif
