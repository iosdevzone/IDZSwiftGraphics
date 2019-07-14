//
//  Font.swift
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

#if os(OSX)
    public typealias Font = NSFont
#else
    public typealias Font = UIFont
#endif


