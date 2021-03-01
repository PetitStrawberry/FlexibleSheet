//
//  BottomSheetStyle.swift
//  ControlAK
//
//  Created by プチいちご on 2021/02/14.
//
import SwiftUI

public struct BottomSheetStyle<Background: View>: FlexibleSheetStyle {

    public var minHeight: CGFloat = 0
    public var midHeight: CGFloat = 0
    public var maxHeight: CGFloat = .infinity
    public var corners: RoundedCorner = [.topLeft, .topRight]
    public var cornerRadius: CGFloat = 300
    public var animation: Animation = .interactiveSpring(response: 0.5, dampingFraction: 1.0, blendDuration: 1.0)
    public var background: Background
    public var isHalfMode: Bool = false

    // Normal Mode
    public init(minHeight: CGFloat = 0,
                maxHeight: CGFloat = .infinity,
                corners: RoundedCorner = [.topLeft, .topRight],
                cornerRadius: CGFloat = 30,
                animation: Animation = .interactiveSpring(response: 0.5, dampingFraction: 1.0, blendDuration: 1.0),
                background: @escaping () -> Background ) {

        self.minHeight = minHeight
        self.maxHeight = maxHeight
        self.corners = corners
        self.cornerRadius = cornerRadius
        self.animation = animation
        self.background = background()
        self.isHalfMode = false
    }

    public init(minHeight: CGFloat = 0,
                maxHeight: CGFloat = .infinity,
                corners: RoundedCorner = [.topLeft, .topRight],
                cornerRadius: CGFloat = 30,
                animation: Animation = .interactiveSpring(response: 0.5, dampingFraction: 1.0, blendDuration: 1.0),
                background: Background ) {

        self.minHeight = minHeight
        self.maxHeight = maxHeight
        self.corners = corners
        self.cornerRadius = cornerRadius
        self.animation = animation
        self.background = background
        self.isHalfMode = false
    }

    // Half Mode
    public init(minHeight: CGFloat = 0,
                midHeight: CGFloat,
                maxHeight: CGFloat = .infinity,
                corners: RoundedCorner = [.topLeft, .topRight],
                cornerRadius: CGFloat = 30,
                animation: Animation = .interactiveSpring(response: 0.5, dampingFraction: 1.0, blendDuration: 1.0),
                background: @escaping () -> Background ) {

        self.minHeight = minHeight
        self.midHeight = midHeight
        self.maxHeight = maxHeight
        self.corners = corners
        self.cornerRadius = cornerRadius
        self.animation = animation
        self.background = background()
        self.isHalfMode = true
    }

    public init(minHeight: CGFloat = 0,
                midHeight: CGFloat,
                maxHeight: CGFloat = .infinity,
                corners: RoundedCorner = [.topLeft, .topRight],
                cornerRadius: CGFloat = 30,
                animation: Animation = .interactiveSpring(response: 0.5, dampingFraction: 1.0, blendDuration: 1.0),
                background: Background ) {

        self.minHeight = minHeight
        self.midHeight = midHeight
        self.maxHeight = maxHeight
        self.corners = corners
        self.cornerRadius = cornerRadius
        self.animation = animation
        self.background = background
        self.isHalfMode = true
    }
}
