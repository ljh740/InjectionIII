//
//  SwiftUISupport.swift
//  SwiftUISupport
//
//  Created by John Holdsworth on 25/09/2020.
//  Copyright © 2020 John Holdsworth. All rights reserved.
//
//  $Id: //depot/ResidentEval/SwiftUISupport/SwiftUISupport.swift#17 $
//

import SwiftUI
import SwiftTrace

/// Add conformances for types that contain floats
extension SwiftUI.EdgeInsets: SwiftTraceFloatArg {}
extension SwiftUI.UnitPoint: SwiftTraceFloatArg {}
extension SwiftUI.Angle: SwiftTraceFloatArg {}
    
/// generic function to find the Binding type for a wrapped type
public func getBindingType<Type>(value: Type, out: inout Any.Type?) {
    out = SwiftUI.Binding<Type>.self
}

@objc (SwiftUISupport)
class SwiftUISupport: NSObject {

    @objc class func setup(pointer: UnsafeMutableRawPointer?) {
        SwiftMeta.wrapperHandlers["SwiftUI.Binding<"] =
            SwiftMeta.bindGeneric(name: "getBindingType", owner: Self.self)
        print("💉 Installed SwiftUI type handlers")
    }
}