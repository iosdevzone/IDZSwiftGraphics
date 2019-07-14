//
//  Color.swift
//  IDZSwiftGraphics
//
//  Created by idz on 3/10/15.
//  Copyright (c) 2015 iOSDeveloperZone.com. All rights reserved.
//

import Foundation
#if os(OSX)
import AppKit
#else
import UIKit
#endif

private func normalize(_ component: UInt8) -> CGFloat {
    return CGFloat(component) / 255.0
}

open class Color {
    #if os(OSX)
    public typealias NativeColor = NSColor
    #else
    public typealias NativeColor = UIColor
    #endif
    
    public let nativeColor: NativeColor
    
    public static func red() -> Color { return Color(nativeColor: NativeColor.red) }
    public static func white() -> Color { return Color(nativeColor: NativeColor.white) }
    public static func black() -> Color { return Color(nativeColor: NativeColor.black) }
    public static func green() -> Color { return Color(nativeColor: NativeColor.green) }
    public static func lightGray() -> Color { return Color(nativeColor: NativeColor.lightGray) }
    
    public init(nativeColor: NativeColor) {
        self.nativeColor = nativeColor
    }
    
    open var CGColor: CGColor { return nativeColor.cgColor }
    
    public init(r: UInt8, g: UInt8, b: UInt8, a: UInt8 = 255) {
        nativeColor = NativeColor(red: normalize(r), green: normalize(g), blue: normalize(b), alpha: normalize(a))
    }
    
    public convenience init(r: Int, g: Int, b: Int, a: Int = 255) {
        self.init(r: UInt8(r), g: UInt8(g), b: UInt8(b), a: UInt8(a))
    }
    #if os(macOS)
    open var rgba : [CGFloat] {
        let colorspace = CGColorSpaceCreateDeviceRGB()
        var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
        nativeColor.usingColorSpace(NSColorSpace(cgColorSpace:colorspace)!)?.getRed(&r, green: &g, blue: &b, alpha: &a)
        return [r, g, b, a]
    }
    #else
    open var rgba : [CGFloat] {
        var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
        nativeColor.getRed(&r, green: &g, blue: &b, alpha: &a)
        return [r, g, b, a]
    }
    #endif
    
}
