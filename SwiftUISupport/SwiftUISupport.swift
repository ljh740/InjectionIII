//
//  SwiftUISupport.swift
//  SwiftUISupport
//
//  Created by John Holdsworth on 25/09/2020.
//  Copyright © 2020 John Holdsworth. All rights reserved.
//
//  $Id: //depot/ResidentEval/SwiftUISupport/SwiftUISupport.swift#13 $
//

import SwiftUI
import SwiftTrace

extension SwiftUI.EdgeInsets: SwiftTraceFloatArg {}
extension SwiftUI.UnitPoint: SwiftTraceFloatArg {}

@objc (SwiftUISupport)
class SwiftUISupport: NSObject {

    @objc class func setup(pointer: UnsafeMutableRawPointer?) {
        print("💉 Installed SwiftUI type handlers")
        SwiftTrace.makeTraceable(types: [SwiftUI.Edge.Set.self,
                                         SwiftUI.Binding<Swift.Bool>.self])
    }
}
