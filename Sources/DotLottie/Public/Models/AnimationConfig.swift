//
//  File.swift
//
//
//  Created by Sam on 31/01/2024.
//

import CoreImage
import Foundation

public struct AnimationConfig {
    public var autoplay: Bool? = false
    public var loop: Bool? = false
    public var mode: Mode? = .forward
    public var speed: Float? = 1
    public var useFrameInterpolation: Bool? = false
    public var segments: (Float, Float)? = nil
    public var backgroundColor: CIImage? = .clear
    public var width: Int? = 512
    public var height: Int? = 512
    public var layout: Layout? = Layout(fit: Fit.contain, align: [0.0, 0.0])
    
    public init(
        autoplay: Bool? = false,
        loop: Bool? = false,
        mode: Mode? = .forward,
        speed: Float? = 1,
        useFrameInterpolation: Bool? = true,
        segments: (Float, Float)? = nil,
        backgroundColor: CIImage? = .clear,
        width: Int? = nil,
        height: Int? = nil,
        layout: Layout? = Layout(fit: Fit.contain, align: [0.0, 0.0])
    ) {
        self.autoplay = autoplay
        self.loop = loop
        self.mode = mode
        self.speed = speed
        self.useFrameInterpolation = useFrameInterpolation
        self.segments = segments
        self.backgroundColor = backgroundColor
        self.width = width
        self.height = height
        self.layout = layout
    }
}
