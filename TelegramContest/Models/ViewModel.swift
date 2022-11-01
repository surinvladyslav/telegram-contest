//
//  DrawingViewModel.swift
//  TelegramContest
//
//  Created by Vladyslav Surin on 27.10.2022.
//

import SwiftUI
import PencilKit

class ViewModel: ObservableObject {
    @Published var images: [ImageModel] = []

    @Published var fonts: [Font] = [
        Font(id: 0, title: "San Francisco", font: "SFNSDisplay-Regular"),
        Font(id: 1, title: "New York", font:"New-York"),
        Font(id: 2, title: "SF Mono", font:"Roboto-Regular"),
        Font(id: 3, title: "Monospace", font:"SFNSDisplay-Regular"),
    ]
    @Published var alignments: [TextAlignment] = [.leading, .center, .trailing]
    @Published var textEffects: [String] = ["default", "filled", "semi", "stroke"]
    @Published var shapeEffects: [String] = ["rectangle", "ellipse", "bubble", "star", "arrow"]
    @Published var showPicker: Bool = false
    @Published var addNewText: Bool = false
    @Published var imageData: Data = .init(count: 0)
    @Published var canvasView = PKCanvasView()
    @Published var toolPicker = PKToolPicker()
    @Published var drawToolsBar: Bool = true
    @Published var shapeToolsBar: Bool = false
    @Published var texts: [TextModel] = []
    @Published var shapes: [ShapeModel] = []
    @Published var preselectedIndex: Int = 0
    @Published var currentTextIndex: Int = 0
    @Published var currentShapeIndex: Int = 0
//    @Published var showError: Bool = false
//    @Published var errorMessage: String = ""

//    func addImageToStack(image: UIImage){
//        let imageView = Image(uiImage: image)
//            .resizable()
//            .aspectRatio(contentMode: .fit)
//
//        images.append(ImageModel(view: AnyView(imageView)))
//    }
    
//    func clearAll(){
//        canvas = PKCanvasView()
//    }
}
