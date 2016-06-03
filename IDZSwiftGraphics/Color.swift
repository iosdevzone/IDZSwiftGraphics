//
//  Color.swift
//  IDZSwiftGraphics
//
//  Created by idz on 3/10/15.
//  Copyright (c) 2015 iOSDeveloperZone.com. All rights reserved.
//

import Foundation

public class Color {
#if os(OSX)
public typealias NativeColor = NSColor
#else
public typealias NativeColor = UIColor
#endif
    
    public let nativeColor: NativeColor
    
    public static func red() -> Color { return Color(nativeColor: NativeColor.redColor()) }
    public static func white() -> Color { return Color(nativeColor: NativeColor.whiteColor()) }
    public static func black() -> Color { return Color(nativeColor: NativeColor.blackColor()) }
    public static func green() -> Color { return Color(nativeColor: NativeColor.greenColor()) }
    public static func lightGray() -> Color { return Color(nativeColor: NativeColor.lightGrayColor()) }
    
    public init(nativeColor: NativeColor) {
        self.nativeColor = nativeColor
    }
    
    public var CGColor: CGColorRef { return nativeColor.CGColor }
    
    
}
