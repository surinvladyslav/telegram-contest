//
//  ToolBarView.swift
//  TelegramContest
//
//  Created by Vladyslav Surin on 30.10.2022.
//

import SwiftUI

struct ToolsBarView: View {
    @EnvironmentObject var model: ViewModel
    
    var body: some View {
        VStack {
            if !model.shapeToolsBar {
                if model.drawToolsBar {
                    DrawToolsBarView()
                } else {
                    TextToolsBarView()
                }
            } else {
                ShapeToolsBarView()
            }
            
            HStack(spacing: 15) {
                Button {
                    withAnimation {
                        model.addNewText = false
                        model.drawToolsBar = true
                    }
                } label: {
                    Image("cancel")
                        .resizable()
                        .frame(width: 35, height: 35)
                }
                
                SegmentedControlView(options: ["Draw", "Text"])
                
                Button {
                    model.canvasView.resignFirstResponder()
                    model.texts.append(TextModel())
                    model.currentTextIndex = model.texts.count - 1
                    model.texts[model.currentTextIndex].isAdded = true
                    withAnimation {
                        model.addNewText.toggle()
                    }
                    
                    model.drawToolsBar = false
                } label: {
                    Image("download")
                        .resizable()
                        .frame(width: 35, height: 35)
                }
//                .buttonStyle(.plain)
//                .disabled(true)
            }
                .padding(.horizontal, 5)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
    
    }
}
