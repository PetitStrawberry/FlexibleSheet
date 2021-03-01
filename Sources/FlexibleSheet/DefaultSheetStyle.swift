//
//  DefaultSheetStyle.swift
//
//
//  Created by プチいちご on 2021/02/18.
//

import SwiftUI

public struct DefaultSheetStyle {
    public static func bottom() -> some FlexibleSheetStyle {
        BottomSheetStyle {
            Color.white
        }
    }
}
