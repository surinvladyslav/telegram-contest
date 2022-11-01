//
//  CanvasView.swift
//  TelegramContest
//
//  Created by Vladyslav Surin on 29.10.2022.
//

import SwiftUI
import PencilKit

struct CanvasView: UIViewRepresentable {
    @Binding var canvasView: PKCanvasView
    @Binding var imageData: Data
    @Binding var toolPicker: PKToolPicker
    
    var rect: CGSize
    
    func makeUIView(context: Context) -> PKCanvasView {
        canvasView.isOpaque = false
        canvasView.backgroundColor = .clear
        canvasView.drawingPolicy = .anyInput

        if let image = UIImage(data: imageData){
            let imageView = UIImageView(image: image)
            imageView.frame = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)
            imageView.contentMode = .scaleAspectFit
            imageView.clipsToBounds = true

//            imageView.layer.shadowPath = UIBezierPath(rect: imageView.bounds).cgPath
//            imageView.layer.shadowOpacity = 0.2
//            imageView.layer.shadowOffset = CGSize(width: 0, height: 3)

            
            let subView = canvasView.subviews[0]
            subView.addSubview(imageView)
            subView.sendSubviewToBack(imageView)
            
//            toolPicker.setVisible(true, forFirstResponder: canvasView)
//            toolPicker.addObserver(canvasView)
            canvasView.becomeFirstResponder()
        }

        return canvasView
    }

    func updateUIView(_ uiView: PKCanvasView, context: Context) {
    }
}
