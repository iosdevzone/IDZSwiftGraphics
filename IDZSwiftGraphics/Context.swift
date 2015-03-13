//
//  Context.swift
//  IDZSwiftGraphics
//
//  Created by idz on 3/10/15.
//  Copyright (c) 2015 iOSDeveloperZone.com. All rights reserved.
//

import Foundation

extension CGContext {
    // MARK: - save/restore
    public func push() -> CGContext {
        CGContextSaveGState(self)
        return self
    }
    
    public func pop() -> CGContext {
        CGContextRestoreGState(self)
        return self
    }
    
    // MARK: - Current Path
    public func addEllipse(rect: CGRect) -> CGContext {
        CGContextAddEllipseInRect(self, rect)
        return self
    }
    public func strokePath() -> CGContext {
        CGContextStrokePath(self)
        return self
    }
    public func fillPath() -> CGContext {
        CGContextFillPath(self)
        return self
    }
    public func addPath(path: CGPath) -> CGContext {
        CGContextAddPath(self, path)
        return self
    }
    
    // MARK: - Clipping
    public func clip() -> CGContext {
        CGContextClip(self)
        return self
    }
    
    public func evenOddClip() -> CGContext {
        CGContextEOClip(self)
        return self
    }
    
    public func clipToRect(rect: CGRect) -> CGContext {
        CGContextClipToRect(self, rect)
        return self
    }
}

