//
//  DrawingScreen.swift
//  TelegramContest
//
//  Created by Vladyslav Surin on 27.10.2022.
//

import SwiftUI
import PencilKit
import UIKit

struct DrawingScreenView: View {
    @EnvironmentObject var model: ViewModel
//    @Binding var image: ImageModel
    var height: CGFloat = 400
//    @State private var lines = [Line]()
//    @State private var deletedLines = [Line]()
    
//    @State private var selectedColor: Color = .black
//    @State private var selectedLineWidth: CGFloat = 1
    
//    let engine = DrawingEngine()
//    @State private var showConfirmation: Bool = false
    var body: some View {
        ZStack {
            NavigationBarView()
            
            GeometryReader{proxy -> AnyView in
//                let size = proxy.frame(in: .global).size
                let size = proxy.size
                return AnyView(
                    ZStack {
                        CanvasView(canvasView: $model.canvasView, imageData: $model.imageData, toolPicker: $model.toolPicker, rect: size)

                        ForEach($model.shapes){$shape in
                            DrawingScreenShapeSubView(shape: $shape){
                                switch shape.shape {
                                case "rectangle":
                                    Rectangle()
                                        .fill(shape.color)
                                case "ellipse":
                                    Circle()
                                        .fill(shape.color)
                                case "arrow":
                                    Arrow()
                                        .fill(shape.color)
                                case "bubble":
                                    Bubble()
                                        .fill(shape.color)
                                case "star":
                                    Star(corners: 5, smoothness: 0.45)
                                        .fill(shape.color)
                                default:
                                    Rectangle()
                                        .fill(shape.color)
                                }
                            } moveFront: {
                                moveViewShapeToFront(shape: shape)
                            }
                        }

                        ForEach($model.texts){$text in
                            let checkText = model.texts[model.currentTextIndex].id == text.id && model.addNewText ? "" : text.text
                            DrawingScreenTextSubView(text: $text){
                                switch text.effect {
                                case "default":
                                    Text(checkText)
                                case "filled":
                                    Text(checkText)
                                        .background(.black)
                                        .cornerRadius(10)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                        .padding(10)
                                case "semi":
                                    Text(checkText)
                                case "stroke":
                                    StrokeText(text: checkText, width: 1, color: .white)
                                        .foregroundColor(.black)
                                default:
                                    Text(checkText)
                                }
                            } moveFront: {
                                moveViewTextToFront(text: text)
                            }
                        }
                    }
                )
            }
            .frame(maxWidth: .infinity, maxHeight: height, alignment: .top)
//            .frame(height: height)
            .clipped()
            .border(.green)

            ToolsBarView()
            
            TextView()
        }
    }
    
    func getTextIndex(indexText: TextModel)->Int{
        let index = model.texts.firstIndex{(box) -> Bool in
            return indexText.id == box.id
        } ?? 0
        
        return index
    }
    
    func getShapeIndex(indexShape: ShapeModel)->Int{
        let index = model.shapes.firstIndex{(box) -> Bool in
            return indexShape.id == box.id
        } ?? 0
        
        return index
    }
    
    func moveViewTextToFront(text: TextModel){
        let currentIndex = getTextIndex(indexText: text)
        let lastIndex =  model.texts.count - 1
        
        model.texts.insert(model.texts.remove(at: currentIndex), at: lastIndex)
    }
    
    func moveViewShapeToFront(shape: ShapeModel){
        let currentIndex = getShapeIndex(indexShape: shape)
        let lastIndex =  model.shapes.count - 1
        
        model.shapes.insert(model.shapes.remove(at: currentIndex), at: lastIndex)
    }
}

struct DrawingScreen_Previews: PreviewProvider {
    static var previews: some View {
        AllowAccessView()
    }
}


struct DrawingScreenShapeSubView<Content: View>: View {
    var content: Content
    @Binding var shape: ShapeModel
    @EnvironmentObject var model: ViewModel
    @State var hapticScale: CGFloat = 1
    var moveFront: ()->()
    
    init(shape: Binding<ShapeModel>, @ViewBuilder content: @escaping ()->Content,moveFront: @escaping ()->()){
        self.content = content()
        self._shape = shape
        self.moveFront = moveFront
    }
    
    var body: some View {
        content
//            .frame(width: 300, height: 80)
            .frame(width: CGFloat(shape.size), height: CGFloat(shape.size))
            .cornerRadius(5)
            .rotationEffect(shape.rotation)
            .scaleEffect(shape.scale < 0.4 ? 0.4 : shape.scale)
            .scaleEffect(hapticScale)
            .offset(shape.offset)
//            .shadow(color: .black, radius: 5)
            .onLongPressGesture(minimumDuration: 0.3){
                model.currentShapeIndex = getIndex(indexShape: shape)
//                withAnimation(
                model.shapeToolsBar = true
//                )
                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                withAnimation(.easeInOut){
                    hapticScale = 1.2
                }
                withAnimation(.easeInOut.delay(0.1)){
                    hapticScale = 1
                }

                moveFront()
            }
            .gesture(
                DragGesture()
                    .onChanged({(value) in
                            let current = value.translation
                            let lastOffset = shape.lastOffset
                            let newTranslation = CGSize(width: lastOffset.width + current.width, height: lastOffset.height + current.height)
                        shape.offset = newTranslation
                    }).onEnded({(value) in
                        shape.lastOffset = value.translation
                    })
            )
            .gesture(
                MagnificationGesture()
                    .onChanged({(value) in
                        shape.scale = shape.lastScale + (value - 1)
                    }).onEnded({(value) in
                        shape.lastScale = shape.scale
                    })
                    .simultaneously(with:
                        RotationGesture()
                        .onChanged({value in
                            shape.rotation = shape.lastRotation + value
                        })
                        .onEnded({value in
                            shape.lastRotation = shape.rotation
                        })

                   )
            )
    }
    
    func getIndex(indexShape: ShapeModel)->Int{
        let index = model.shapes.firstIndex{(box) -> Bool in
            return indexShape.id == box.id
        } ?? 0
        
        return index
    }
    
}

struct DrawingScreenTextSubView<Content: View>: View {
    var content: Content
    @Binding var text: TextModel
    @EnvironmentObject var model: ViewModel
    @State var hapticScale: CGFloat = 1
    var moveFront: ()->()
    
    init(text: Binding<TextModel>, @ViewBuilder content: @escaping ()->Content,moveFront: @escaping ()->()){
        self.content = content()
        self._text = text
        self.moveFront = moveFront
    }
    
    var body: some View {
        content
            .font(.custom(text.font.font, size: CGFloat(text.size)))
//            .font(.subheadline)
            .foregroundColor(text.color)
            .frame(maxWidth: .infinity)
            .multilineTextAlignment(text.alignment)
            .rotationEffect(text.rotation)
            .scaleEffect(text.scale < 0.4 ? 0.4 : text.scale)
            .scaleEffect(hapticScale)
            .offset(text.offset)
            .onLongPressGesture(minimumDuration: 0.3){
                model.currentTextIndex = getIndex(indexText: text)
//                withAnimation(
                    model.addNewText = true
//                )
                UIImpactFeedbackGenerator(style: .medium).impactOccurred()
                withAnimation(.easeInOut){
                    hapticScale = 1.2
                }
                withAnimation(.easeInOut.delay(0.1)){
                    hapticScale = 1
                }
                
                moveFront()
            }
            .gesture(
                DragGesture()
                    .onChanged({(value) in
                            let current = value.translation
                            let lastOffset = text.lastOffset
                            let newTranslation = CGSize(width: lastOffset.width + current.width, height: lastOffset.height + current.height)
                        text.offset = newTranslation
                    }).onEnded({(value) in
                        text.lastOffset = value.translation
                    })
            )
            .gesture(
                MagnificationGesture()
                    .onChanged({(value) in
                        text.scale = text.lastScale + (value - 1)
                    }).onEnded({(value) in
                        text.lastScale = text.scale
                    })
                    .simultaneously(with:
                        RotationGesture()
                        .onChanged({value in
                            text.rotation = text.lastRotation + value
                        })
                        .onEnded({value in
                            text.lastRotation = text.rotation
                        })
                                   
                   )
            )
    }
    
    func getIndex(indexText: TextModel)->Int{
        let index = model.texts.firstIndex{(box) -> Bool in
            return indexText.id == box.id
        } ?? 0
        
        return index
    }
    
}

struct Star: Shape {
    let corners: Int
    let smoothness: Double

    func path(in rect: CGRect) -> Path {
        guard corners >= 2 else { return Path() }

        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)

        var currentAngle = -CGFloat.pi / 2

        let angleAdjustment = .pi * 2 / Double(corners * 2)

        let innerX = center.x * smoothness
        let innerY = center.y * smoothness

        var path = Path()

        path.move(to: CGPoint(x: center.x * cos(currentAngle), y: center.y * sin(currentAngle)))

        var bottomEdge: Double = 0

        for corner in 0..<corners * 2  {
            let sinAngle = sin(currentAngle)
            let cosAngle = cos(currentAngle)
            let bottom: Double
            if corner.isMultiple(of: 2) {
                bottom = center.y * sinAngle

                path.addLine(to: CGPoint(x: center.x * cosAngle, y: bottom))
            } else {

                bottom = innerY * sinAngle

                path.addLine(to: CGPoint(x: innerX * cosAngle, y: bottom))
            }

            if bottom > bottomEdge {
                bottomEdge = bottom
            }

            currentAngle += angleAdjustment
        }
        let unusedSpace = (rect.height / 2 - bottomEdge) / 2

        let transform = CGAffineTransform(translationX: center.x, y: center.y + unusedSpace)
        return path.applying(transform)
    }
}

struct Arrow: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let width = rect.width
            let height = rect.height
            
            path.addLines( [
                CGPoint(x: width * 0.4, y: height),
                CGPoint(x: width * 0.4, y: height * 0.4),
                CGPoint(x: width * 0.2, y: height * 0.4),
                CGPoint(x: width * 0.5, y: height * 0.1),
                CGPoint(x: width * 0.8, y: height * 0.4),
                CGPoint(x: width * 0.6, y: height * 0.4),
                CGPoint(x: width * 0.6, y: height)
                
            ])
            path.closeSubpath()
        }
    }
}

//import Foundation
//import SwiftUI
//
//class DrawingEngine {
//
//    func createPath(for points: [CGPoint]) -> Path {
//        var path = Path()
//
//        if let firstPoint = points.first {
//            path.move(to: firstPoint)
//        }
//
//        for index in 1..<points.count {
//            let mid = calculateMidPoint(points[index - 1], points[index])
//            path.addQuadCurve(to: mid, control: points[index - 1])
//        }
//
//        if let last = points.last {
//            path.addLine(to: last)
//        }
//
//        return path
//    }
//
//
//
//    func calculateMidPoint(_ point1: CGPoint, _ point2: CGPoint) -> CGPoint {
//        let newMidPoint = CGPoint(x: (point1.x + point2.x)/2, y: (point1.y + point2.y)/2)
//        return newMidPoint
//    }
//}
//
//struct DrawingShape: Shape {
//    let points: [CGPoint]
//    let engine = DrawingEngine()
//    func path(in rect: CGRect) -> Path {
//        engine.createPath(for: points)
//    }
//}
//
//struct Line: Identifiable {
//
//    var points: [CGPoint]
//    var color: Color
//    var lineWidth: CGFloat
//
//    let id = UUID()
//}

struct StrokeText: View {
    let text: String
    let width: CGFloat
    let color: Color

    var body: some View {
        ZStack{
            ZStack{
                Text(text).offset(x:  width, y:  width)
                Text(text).offset(x: -width, y: -width)
                Text(text).offset(x: -width, y:  width)
                Text(text).offset(x:  width, y: -width)
            }
            .foregroundColor(color)
            Text(text)
        }
    }
}

struct Bubble: Shape {
    func path(in rect: CGRect) -> Path {
        getRightBubblePath(in: rect)
    }
    
    private func getRightBubblePath(in rect: CGRect) -> Path {
        let width = rect.width
        let height = rect.height
        let path = Path { p in
            p.move(to: CGPoint(x: 25, y: height))
            p.addLine(to: CGPoint(x:  20, y: height))
            p.addCurve(to: CGPoint(x: 0, y: height - 20),
                       control1: CGPoint(x: 8, y: height),
                       control2: CGPoint(x: 0, y: height - 8))
            p.addLine(to: CGPoint(x: 0, y: 20))
            p.addCurve(to: CGPoint(x: 20, y: 0),
                       control1: CGPoint(x: 0, y: 8),
                       control2: CGPoint(x: 8, y: 0))
            p.addLine(to: CGPoint(x: width - 21, y: 0))
            p.addCurve(to: CGPoint(x: width - 4, y: 20),
                       control1: CGPoint(x: width - 12, y: 0),
                       control2: CGPoint(x: width - 4, y: 8))
            p.addLine(to: CGPoint(x: width - 4, y: height - 11))
            p.addCurve(to: CGPoint(x: width, y: height),
                       control1: CGPoint(x: width - 4, y: height - 1),
                       control2: CGPoint(x: width, y: height))
            p.addLine(to: CGPoint(x: width + 0.05, y: height - 0.01))
            p.addCurve(to: CGPoint(x: width - 11, y: height - 4),
                       control1: CGPoint(x: width - 4, y: height + 0.5),
                       control2: CGPoint(x: width - 8, y: height - 1))
            p.addCurve(to: CGPoint(x: width - 25, y: height),
                       control1: CGPoint(x: width - 16, y: height),
                       control2: CGPoint(x: width - 20, y: height))
            
        }
        return path
    }
}
