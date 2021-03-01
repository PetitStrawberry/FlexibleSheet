//
//  RoundedCorner.swift
//
//
//  Created by プチいちご on 2021/02/27.
//

import SwiftUI

public struct RoundedCorner: OptionSet {
    public let rawValue: UInt

    public static var topLeft = RoundedCorner(rawValue: 1 << 0)
    public static var topRight = RoundedCorner(rawValue: 1 << 2)
    public static var bottomLeft = RoundedCorner(rawValue: 1 << 2)
    public static var bottomRight = RoundedCorner(rawValue: 1 << 3)
    public static var allCorners: RoundedCorner {
        return [.topLeft, .topRight, .bottomLeft, .bottomRight]
    }

    public init(rawValue: UInt) {
        self.rawValue = rawValue
    }
}

struct RoundedCornerShape: Shape {

    var corner: RoundedCorner
    var radius: CGFloat
    func path(in rect: CGRect) -> Path {
        var path = Path()

        let width = rect.size.width
        let height = rect.size.height

        let topRight = min(min(radius, height/2), width/2) * (corner.contains(.topRight) ? 1 : 0)
        let topLeft = min(min(radius, height/2), width/2) * (corner.contains(.topLeft) ? 1 : 0)
        let bottomLeft = min(min(radius, height/2), width/2) * (corner.contains(.bottomLeft) ? 1 : 0)
        let bottomRight = min(min(radius, height/2), width/2) * (corner.contains(.bottomLeft) ? 1 : 0)

        path.move(to: CGPoint(x: width / 2.0, y: 0))
        // TopRight
        path.addLine(to: CGPoint(x: width - topRight, y: 0))
        path.addArc(center: CGPoint(x: width - topRight, y: topRight), radius: topRight,
                    startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
        // TopLeft
        path.addLine(to: CGPoint(x: width, y: height - bottomRight))
        path.addArc(center: CGPoint(x: width - bottomRight, y: height - bottomRight), radius: bottomRight,
                    startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
        // BottomLeft
        path.addLine(to: CGPoint(x: bottomLeft, y: height))
        path.addArc(center: CGPoint(x: bottomLeft, y: height - bottomLeft), radius: bottomLeft,
                    startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
        // BottomRight
        path.addLine(to: CGPoint(x: 0, y: topLeft))
        path.addArc(center: CGPoint(x: topLeft, y: topLeft), radius: topLeft,
                    startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)

        return path
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: RoundedCorner) -> some View {
        clipShape( RoundedCornerShape(corner: corners, radius: radius) )
    }
}
