//
//  DrawingViewController.swift
//  TelegramContest
//
//  Created by Vladyslav Surin on 28.10.2022.
//

import UIKit
import PencilKit

class DrawingViewController: UIViewController, PKCanvasViewDelegate, PKToolPickerObserver, UIScreenshotServiceDelegate {
    
    @IBOutlet weak var canvasView: PKCanvasView!
    @IBOutlet var undoBarButtonitem: UIBarButtonItem!
    @IBOutlet var redoBarButtonItem: UIBarButtonItem!
    
    var toolPicker: PKToolPicker!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        canvasView.delegate = self
        canvasView.alwaysBounceVertical = true
        
        if #available(iOS 14.0, *) {
            toolPicker = PKToolPicker()
        } else {
            let window = parent?.view.window
            toolPicker = PKToolPicker.shared(for: window!)
        }
        
        toolPicker.setVisible(true, forFirstResponder: canvasView)
        toolPicker.addObserver(canvasView)
        toolPicker.addObserver(self)
        canvasView.becomeFirstResponder()
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let canvasScale = canvasView.bounds.width
        canvasView.minimumZoomScale = canvasScale
        canvasView.maximumZoomScale = canvasScale
        canvasView.zoomScale = canvasScale
        
        // Scroll to the top.
        updateContentSizeForDrawing()
        canvasView.contentOffset = CGPoint(x: 0, y: -canvasView.adjustedContentInset.top)
    }
    
    func updateContentSizeForDrawing() {
        let drawing = canvasView.drawing
        let contentHeight: CGFloat
        

        contentHeight = canvasView.bounds.height
        canvasView.contentSize = CGSize(width: canvasView.zoomScale, height: contentHeight)
    }
    
}
