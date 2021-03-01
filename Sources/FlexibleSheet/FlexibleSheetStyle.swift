//
//  FlexibleSheetStyle.swift
//  ControlAK
//
//  Created by プチいちご on 2021/02/12.
//

import SwiftUI

public protocol FlexibleSheetStyle {
    associatedtype Background: View
    var minHeight: CGFloat { get set }
    var midHeight: CGFloat { get set }
    var maxHeight: CGFloat { get set }
    var corners: RoundedCorner { get set }
    var cornerRadius: CGFloat { get set }
    var background: Background { get set }
    var animation: Animation { get set }
    var isHalfMode: Bool { get set }
}
