//
//  ShapeToolsBarView.swift
//  TelegramContest
//
//  Created by Vladyslav Surin on 31.10.2022.
//

import SwiftUI

struct ShapeToolsBarView: View {
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        VStack {
            HStack {
                ColorPicker("", selection: $model.shapes[model.currentShapeIndex].color)
                    .frame(width: 35, height: 35)
                    .labelsHidden()
//                @State private var currentLine = Line(color: .red)
//                  @State private var drawedLines = [Line]()
//                  @State private var selectedColor: Color = .red
//                  @State private var selectedSize = 1.0
//                  private var colors:[Color] = [.red, .green, .blue, .black, .orange, .yellow, .brown, .pink, .purple, .indigo, .cyan, .mint]
//
//                  var canvasPallete: some View {
//                      return Canvas { context, size in
//                          for line in drawedLines {
//                              var path = Path()
//                              path.addLines(line.points)
//                              context.stroke(path, with: .color(line.color), lineWidth: line.size)
//                          }
//
//                      }.gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
//                          .onChanged({ value in
//                              let point = value.location
//                              currentLine.points.append(point)
//                              currentLine.color = selectedColor
//                              currentLine.size = selectedSize
//                              drawedLines.append(currentLine)
//                          })
//                          .onEnded({ value in
//                              currentLine = Line(color: selectedColor)
//                           })
//                      )
//                  }
//
//                  var body: some View {
//                      VStack {
//                          canvasPallete
//                              .frame(width: 300, height: 300)
//                          Divider()
//                          HStack(alignment: .bottom ) {
//                              VStack{
//                                  Button {
//                                      print("Will save draw image")
//                                      let image = canvasPallete.snapshot()
//
//                                      UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
//                                  } label: {
//                                      Text("Save")
//                                  }
//                                  .padding([.bottom], 25)
//
//                                  Button {
//                                      drawedLines.removeAll()
//                                  } label: {
//                                      Image(systemName: "trash.circle.fill")
//                                          .font(.system(size: 40))
//                                          .foregroundColor(.red)
//                                  }.frame(width: 70, height: 50, alignment: .center)
//                              }
//                              VStack(alignment: .leading) {
//                                  Text("Colors:")
//                                  ScrollView(.horizontal, showsIndicators: false) {
//                                      HStack(spacing: 4) {
//                                          ForEach(colors, id:\.self){color in
//                                              ColoredCircleButton(color: color, selected: color == selectedColor) {
//                                                  selectedColor = color
//                                              }
//                                          }
//
//                                      }
//                                      .padding(.all, 5)
//
//                                  }
//                                  Text("Size:")
//                                  Slider(value: $selectedSize, in: 0.2...8)
//                                      .padding([.leading,.trailing], 20)
//                                      .tint(selectedColor)
//                              }
//                              .padding([.bottom], 10)
//
//                          }
//
//
//                      }.frame(minWidth: 400, minHeight: 400)
//                  }
//              }
//
//
//                  struct ColoredCircleButton: View {
//                      let color: Color
//                      var selected = false
//                      let onTap: (() -> Void)
//
//                      var body: some View {
//                          Circle()
//                              .frame(width: 25, height: 25)
//                              .foregroundColor(color)
//                              .overlay(content: {
//                                  if selected {
//                                      Circle().stroke(.gray, lineWidth: 3)
//                                  }
//                              })
//                              .onTapGesture {
//                                  onTap()
//                              }
//                      }
            }
            HStack {
                Button {
                    withAnimation {
                        model.shapeToolsBar = false
                    }
                } label: {
                    Image("back")
                        .resizable()
                        .frame(width: 25, height: 25, alignment: .center)
                }
                
    
                Slider(value: $model.shapes[model.currentShapeIndex].size, in: 50...200, step: 1)
                    .padding()
                            
            }
            

        }
        .padding(.horizontal, 5)
        .foregroundColor(.white)
    }
}
