//
//  CameraPreview.swift
//  Campus
//
//  Created by Rolando Rodriguez on 12/17/19.
//  Copyright © 2019 Rolando Rodriguez. All rights reserved.
//

import UIKit
import AVFoundation
import SwiftUI

public struct CameraPreview: UIViewRepresentable {
    public class VideoPreviewView: UIView {
        public override class var layerClass: AnyClass {
            AVCaptureVideoPreviewLayer.self
        }
        
        var videoPreviewLayer: AVCaptureVideoPreviewLayer {
            return layer as! AVCaptureVideoPreviewLayer
        }
        
        
        public override func layoutSubviews() {
            super.layoutSubviews()
            /* No need to focus on external camera
            self.layer.addSublayer(focusView.layer)
            
            let gRecognizer = UITapGestureRecognizer(target: self, action: #selector(VideoPreviewView.focusAndExposeTap(gestureRecognizer:)))
            self.addGestureRecognizer(gRecognizer)
             */
        }
    }
    
    public let session: AVCaptureSession
    
    public init(session: AVCaptureSession) {
        self.session = session
    }
    
    public func makeUIView(context: Context) -> VideoPreviewView {
        let viewFinder = VideoPreviewView()
        viewFinder.backgroundColor = .black
        viewFinder.videoPreviewLayer.cornerRadius = 0
        viewFinder.videoPreviewLayer.session = session
        viewFinder.videoPreviewLayer.connection?.videoOrientation = .portrait
        return viewFinder
    }
    
    public func updateUIView(_ uiView: VideoPreviewView, context: Context) {
        DispatchQueue.main.async {
            let size = uiView.frame.size
            print("CameraPreview size: \(size)")
        }
    }

}

struct CameraPreview_Previews: PreviewProvider {
    static var previews: some View {
        CameraPreview(session: AVCaptureSession())
            .frame(height: 300)
    }
}
