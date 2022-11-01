//
//  TextToolsBarView.swift
//  TelegramContest
//
//  Created by Vladyslav Surin on 30.10.2022.
//

import SwiftUI

struct TextToolsBarView: View {
    @EnvironmentObject var model: ViewModel
    @State var selected = 0


    var body: some View {
        HStack {
            ColorPicker("", selection: $model.texts[model.currentTextIndex].color)
                .frame(width: 35, height: 35)
                .labelsHidden()

            Button {
                let currentIndex = model.textEffects.firstIndex(of: model.texts[model.currentTextIndex].effect) ?? 0
                var nextIndex = currentIndex + 1
                nextIndex = model.textEffects.indices.contains(nextIndex) ? nextIndex : 0
                model.texts[model.currentTextIndex].effect = model.textEffects[nextIndex]
            } label: {
                switch model.texts[model.currentTextIndex].effect {
                case "default":
                    Image("default")
                        .resizable()
                        .frame(width: 30, height: 30)
                case "filled":
                    Image("filled")
                        .resizable()
                        .frame(width: 30, height: 30)
                case "semi":
                    Image("semi")
                        .resizable()
                        .frame(width: 30, height: 30)
                case "stroke":
                    Image("stroke")
                        .resizable()
                        .frame(width: 30, height: 30)
                default:
                    Image("default")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            }
            
            Button {
                let currentIndex = model.alignments.firstIndex(of: model.texts[model.currentTextIndex].alignment) ?? 0
                var nextIndex = currentIndex + 1
                nextIndex = model.alignments.indices.contains(nextIndex) ? nextIndex : 0
                model.texts[model.currentTextIndex].alignment = model.alignments[nextIndex]
            } label: {
                switch model.texts[model.currentTextIndex].alignment {
                case .leading:
                    Image("textLeft")
                        .resizable()
                        .frame(width: 30, height: 30)
                case .center:
                     Image("textCenter")
                         .resizable()
                         .frame(width: 30, height: 30)
                case .trailing:
                    Image("textRight")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
            }
            
            VStack {
                ScrollView(.horizontal,showsIndicators: false){
                  HStack{
                      ForEach(model.fonts, id: \.id) { font in
                      FontView(font: font, selectedBtn: self.$selected)
                    }
                  }
                }
            }
            
            Button {
                
            } label: {
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
}

struct FontView: View {
    @EnvironmentObject var model: ViewModel
    var font: Font
    @Binding var selectedBtn: Int
    var body: some View{
        Button(action: {
            self.selectedBtn = self.font.id
            model.texts[model.currentTextIndex].font = model.fonts[selectedBtn]
        }){
            Text(font.title)
                .foregroundColor(.white)
                .font(.custom(font.font, size: 16))
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding(7)
                .foregroundColor(.white)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(self.selectedBtn == self.font.id ? Color.white : Color.white.opacity(0.3), lineWidth: 2)
                    )

        }
            .cornerRadius(10)
    }
}

struct Font: Identifiable  {
    var id: Int
    var title: String
    var font: String
}
