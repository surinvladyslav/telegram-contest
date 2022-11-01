//
//  TextView.swift
//  TelegramContest
//
//  Created by Vladyslav Surin on 30.10.2022.
//

import SwiftUI

struct TextView: View {
    @EnvironmentObject var model: ViewModel
    @FocusState var isInputActive: Bool
    
    enum FocusField: Hashable {
      case field
    }

    @FocusState private var focusedField: FocusField?
    var body: some View {
        if model.addNewText {
            Color.black.opacity(0.75)
                .ignoresSafeArea()
//                                    .border(Color(hex: "#066892"), width: 2)
            
            TextField("", text: $model.texts[model.currentTextIndex].text)
                .onAppear {
                    self.focusedField = .field
                }
//                .toolbar {
//                    ToolbarItem(placement: .keyboard) {
//                        Button("Done") {
//                            focusedField = nil
//                        }
//                    }
//                }
                .colorScheme(.dark)
                .padding()
                .focused($focusedField, equals: .field)
                .font(.system(size: CGFloat(model.texts[model.currentTextIndex].size)))
                .font(.subheadline)
                .foregroundColor(model.texts[model.currentTextIndex].color)
            
            VStack {
                GeometryReader { geo in
                    VerticalSlider(
                        sliderHeight: geo.size.height
                    )
                }
            }
//
//            Slider(value: $model.texts[model.currentTextIndex].size, in: 20...60, step: 1)
//                .padding()
//                .accentColor(Color.green)
            
            HStack(spacing: 15) {
                Button {
                    model.canvasView.becomeFirstResponder()
                    
                    withAnimation {
                        model.addNewText = false
                    }
                    
                    if !model.texts[model.currentTextIndex].isAdded{
                        model.texts.removeLast()
                    }
                } label: {
                    Text("Cancel")
                }
            
                Spacer()
                
                Button {
                    model.texts[model.currentTextIndex].isAdded = true
                    model.canvasView.becomeFirstResponder()
                    withAnimation {
                        model.addNewText = false
                    }
                } label: {
                    Text("Done")
                }
                .disabled(model.texts[model.currentTextIndex].text != "" ? false : true)
            }
                .padding()
                .foregroundColor(.white)
                .frame(maxHeight: .infinity, alignment: .top)
        }
    }
}

struct VerticalSlider: View {
    @EnvironmentObject var model: ViewModel
    var sliderHeight: CGFloat

    var body: some View {
        Slider(
            value: $model.texts[model.currentTextIndex].size, in: 20...60, step: 1
        )
        .padding()
        .rotationEffect(.degrees(-90.0), anchor: .topLeading)
        .frame(maxHeight: .infinity, alignment: .top)
        .offset(y: sliderHeight)
    }
}
