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
    
    // MARK: - Colors

    public func setStrokeColor(color: Color) -> CGContext {
        CGContextSetStrokeColorWithColor(self, color.CGColor)
        return self
    }
    
    public func setFillColor(color: Color) -> CGContext {
        CGContextSetFillColorWithColor(self, color.CGColor)
        return self
    }
    
    // MARK: - Transform
    public func scale(s:CGFloat) -> CGContext {
        CGContextScaleCTM(self, s, s)
        return self
    }
    
    public func scale(sx: CGFloat, _ sy:CGFloat) -> CGContext {
        CGContextScaleCTM(self, sx, sy)
        return self
    }
    
    public func translate(tx: CGFloat, _ ty: CGFloat) -> CGContext {
        CGContextTranslateCTM(self, tx, ty)
        return self
    }
    
    // MARK: - Immediate drawing
    public func fillRect(r: CGRect) -> CGContext {
        CGContextFillRect(self, r)
        return self
    }
}

