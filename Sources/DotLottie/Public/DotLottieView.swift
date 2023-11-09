////
////  DotLottieView.swift
////
////
////  Created by Sam on 25/10/2023.
////
//
import Metal
import MetalKit
import CoreImage
import SwiftUI

public struct DotLottieView: ViewRepresentable {
    public typealias UIViewType = MTKView
    private var mtkView: MTKView = MTKView()
    public var opaqueBackground: CIImage
    
    // Playback settings
    let framerate: Int = 60
    
    @ObservedObject internal var dotLottie: DotLottieViewModel

    public init(dotLottie: DotLottieViewModel) {
        self.dotLottie = dotLottie

        self.opaqueBackground = CIImage.white
//            self.framerate = framerate
//            self.dotLottie.autoplay(autoplay: autoplay)
//            self.dotLottie.loop(loop: loop)
//            self.dotLottie.direction(direction: direction)
        }
    
    public func makeCoordinator() -> Coordinator {
        Coordinator(self, mtkView: self.mtkView)
    }
    
    public func makeView(context: Context) -> MTKView {
#if os(iOS)
        self.mtkView.isOpaque = false
#endif
        
        self.mtkView.framebufferOnly = false
        
        self.mtkView.delegate = context.coordinator
        
        self.mtkView.preferredFramesPerSecond = self.framerate * self.dotLottie.getSpeed()
        
        self.mtkView.clearColor = MTLClearColor(red: 0, green: 0, blue: 0, alpha: 0)
        
        self.mtkView.enableSetNeedsDisplay = true
        
        self.mtkView.isPaused = !self.dotLottie.playing()
        
        return mtkView
    }
    
    public func updateView(_ uiView: MTKView, context: Context) {
        uiView.isPaused = !self.dotLottie.playing()
    }
    
    public func pause() {
        self.dotLottie.pause()
    }
    
    public func play() {
        self.dotLottie.play()
    }
    
    public func stop() {
        self.dotLottie.stop()
    }
    
    public func duration() -> Float32 {
        return self.dotLottie.duration()
    }
    
    public func speed() -> Int {
        self.dotLottie.getSpeed()
    }
    
    public func loop() -> Bool {
        return self.dotLottie.getLoop()
    }
    
    public func on(event: AnimationEvent, callback: @escaping () -> Void) {
        self.dotLottie.on(event: event, callback: callback)
    }

    // Speed is actually the preffered frame rate
    public func setSpeed(speed: Int) {
        if (speed > 0) {
                self.dotLottie.speed(speed: speed)
        }
    }
}
