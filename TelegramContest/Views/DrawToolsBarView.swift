//
//  DrawToolsBarView.swift
//  TelegramContest
//
//  Created by Vladyslav Surin on 30.10.2022.
//

import SwiftUI

struct DrawToolsBarView: View {
    @EnvironmentObject var model: ViewModel
    @State private var color = Color.white
    
    var body: some View {
        HStack {
            ColorPicker("", selection: $color)
                .frame(width: 35, height: 35)
            .labelsHidden()
            
            ToolsView()
            
            Menu(content: {
                Button(action: {
                    createShape()
//                    model.shapes[model.currentShapeIndex].isAdded = true
//                    withAnimation {
//                        model.addNewText.toggle()
//                    }
                    
//                    model.drawToolsBar = false
                    model.shapes[model.currentShapeIndex].shape = "rectangle"
                }) {
                    Label("Rectangle", image: "shapeRectangle")
                }
                  
                Button(action: {
                    createShape()
                    model.shapes[model.currentShapeIndex].shape = "ellipse"
                }) {
                    Label("Ellipse", image: "shapeEllipse")
                }
                
                Button(action: {
                    createShape()
                    model.shapes[model.currentShapeIndex].shape = "bubble"
                }) {
                    Label("Bubble", image: "shapeBubble")
                }

                Button(action: {
                    createShape()
                    model.shapes[model.currentShapeIndex].shape = "star"
                }) {
                    Label("Star", image: "shapeStar")
                }

                Button(action: {
                    createShape()
                    model.shapes[model.currentShapeIndex].shape = "arrow"
                }) {
                    Label("Arrow", image: "shapeArrow")
                }
            }) {
                Image("add")
                .resizable()
                .frame(width: 35, height: 35)
            }
                .background(.gray.opacity(0.2))
                .cornerRadius(50)
        }
        .padding(.horizontal, 5)
        .foregroundColor(.white)
    }
    
    func createShape(){
        model.canvasView.resignFirstResponder()
        model.shapes.append(ShapeModel())
        model.currentShapeIndex = model.shapes.count - 1
    }
}
