//
//  Color.swift
//  IDZSwiftGraphics
//
//  Created by idz on 3/10/15.
//  Copyright (c) 2015 iOSDeveloperZone.com. All rights reserved.
//

import Foundation

open class Color {
#if os(OSX)
public typealias NativeColor = NSColor
#else
public typealias NativeColor = UIColor
#endif
    
    open let nativeColor: NativeColor
    
    open static func red() -> Color { return Color(nativeColor: NativeColor.red) }
    open static func white() -> Color { return Color(nativeColor: NativeColor.white) }
    open static func black() -> Color { return Color(nativeColor: NativeColor.black) }
    open static func green() -> Color { return Color(nativeColor: NativeColor.green) }
    open static func lightGray() -> Color { return Color(nativeColor: NativeColor.lightGray) }
    
    public init(nativeColor: NativeColor) {
        self.nativeColor = nativeColor
    }
    
    open var CGColor: CGColor { return nativeColor.cgColor }
    
    
}
