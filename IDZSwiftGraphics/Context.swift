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
        self.saveGState()
        return self
    }
    
    public func pop() -> CGContext {
        self.restoreGState()
        return self
    }
    
    // MARK: - Current Path
    public func addEllipse(_ rect: CGRect) -> CGContext {
        self.addEllipse(in: rect)
        return self
    }
    public func idz_strokePath() -> CGContext {
        self.strokePath()
        return self
    }
    public func idz_fillPath() -> CGContext {
        self.fillPath()
        return self
    }
    public func idz_addPath(_ path: CGPath) -> CGContext {
        self.addPath(path)
        return self
    }
    
    // MARK: - Clipping
    public func idz_clip() -> CGContext {
        self.clip()
        return self
    }
    
    public func idz_evenOddClip() -> CGContext {
        self.clip(using: .evenOdd)
        return self
    }
    
    public func clipToRect(_ rect: CGRect) -> CGContext {
        self.clip(to: rect)
        return self
    }
    
    // MARK: - Colors

    public func setStrokeColor(_ color: Color) -> CGContext {
        self.setStrokeColor(color.CGColor)
        return self
    }
    
    public func setFillColor(_ color: Color) -> CGContext {
        self.setFillColor(color.CGColor)
        return self
    }
    
    // MARK: - Transform
    public func scale(_ s:CGFloat) -> CGContext {
        self.scaleBy(x: s, y: s)
        return self
    }
    
    public func scale(_ sx: CGFloat, _ sy:CGFloat) -> CGContext {
        self.scaleBy(x: sx, y: sy)
        return self
    }
    
    public func translate(_ tx: CGFloat, _ ty: CGFloat) -> CGContext {
        self.translateBy(x: tx, y: ty)
        return self
    }
    
    // MARK: - Immediate drawing
    public func fillRect(_ r: CGRect) -> CGContext {
        self.fill(r)
        return self
    }
}

