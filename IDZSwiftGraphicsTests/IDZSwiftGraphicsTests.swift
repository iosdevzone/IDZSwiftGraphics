//
//  IDZSwiftGraphicsTests.swift
//  IDZSwiftGraphicsTests
//
//  Created by idz on 3/9/15.
//  Copyright (c) 2015 iOSDeveloperZone.com. All rights reserved.
//

import UIKit
import XCTest
import IDZSwiftGraphics

class IDZSwiftGraphicsTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testColorInit() {
        // This is an example of a functional test case.
        var color = Color.red()
        XCTAssertEqual(color.nativeColor, UIColor.red)
        color = Color.green()
        XCTAssertEqual(color.nativeColor, UIColor.green)
        color = Color.black()
        XCTAssertEqual(color.nativeColor, UIColor.black)
    }
    
    func testRenderImage() {
        let size = CGSize(width: 100.0, height: 100.0)
        let image = renderImage(size, opaque:true, scale:1.0) {
            ctx, bounds, scale in
            
        }
        XCTAssertEqual(size, image.size)
        
    }
    
    func testContext() {
        UIGraphicsBeginImageContext(CGSize(width: 10.0, height: 10.0))
        let ctx = UIGraphicsGetCurrentContext()!
        ctx.scale(10.0)
        var p: Path = CGMutablePath()
        var mp: MutablePath = CGMutablePath()
        UIGraphicsEndImageContext()
    }
    
    func testImage() {
        
        var image: Image? = nil
    }
    

    
}
