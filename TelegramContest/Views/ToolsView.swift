//
//  Tools.swift
//  TelegramContest
//
//  Created by Vladyslav Surin on 30.10.2022.
//

import SwiftUI

struct ToolsView: View {
    var body: some View {
        HStack {
            //            neon
            Button {
                print("china")
            } label: {
                ZStack {
                    Image("tipNeon")
                        .resizable()
                        .frame(width: 9, height: 95)
                        .colorMultiply(.cyan)
                    Image("baseNeon")
                        .resizable()
                        .frame(width: 17, height: 95)
                    RoundedRectangle(cornerRadius: 2, style: .continuous)
                        .fill(.cyan)
                        .frame(width: 17, height: 10)
                        .offset(x: 0, y: 0)
                }
            }
            
//            Spacer()
            
            Button {
                print("china")
            } label: {
                ZStack {
                    Image("tipNeon")
                        .resizable()
                        .frame(width: 9, height: 95)
                        .colorMultiply(.cyan)
                    Image("baseNeon")
                        .resizable()
                        .frame(width: 17, height: 95)
                    RoundedRectangle(cornerRadius: 2, style: .continuous)
                        .fill(.cyan)
                        .frame(width: 17, height: 10)
                        .offset(x: 0, y: 0)
                }
            }
            
//            Spacer()
            
            Button {
                print("china")
            } label: {
                ZStack {
                    Image("tipNeon")
                        .resizable()
                        .frame(width: 9, height: 95)
                        .colorMultiply(.cyan)
                    Image("baseNeon")
                        .resizable()
                        .frame(width: 17, height: 95)
                    RoundedRectangle(cornerRadius: 2, style: .continuous)
                        .fill(.cyan)
                        .frame(width: 17, height: 10)
                        .offset(x: 0, y: 0)
                }
            }
//            Spacer()
            Button {
                print("china")
            } label: {
                ZStack {
                    Image("tipNeon")
                        .resizable()
                        .frame(width: 9, height: 95)
                        .colorMultiply(.cyan)
                    Image("baseNeon")
                        .resizable()
                        .frame(width: 17, height: 95)
                    RoundedRectangle(cornerRadius: 2, style: .continuous)
                        .fill(.cyan)
                        .frame(width: 17, height: 10)
                        .offset(x: 0, y: 0)
                }
            }
//            Spacer()
            Button {
                print("china")
            } label: {
                ZStack {
                    Image("tipNeon")
                        .resizable()
                        .frame(width: 9, height: 95)
                        .colorMultiply(.cyan)
                    Image("baseNeon")
                        .resizable()
                        .frame(width: 17, height: 95)
                    RoundedRectangle(cornerRadius: 2, style: .continuous)
                        .fill(.cyan)
                        .frame(width: 17, height: 10)
                        .offset(x: 0, y: 0)
                }
            }
            
//            Spacer()
            
            Button {
                print("china")
            } label: {
                ZStack {
                    Image("tipNeon")
                        .resizable()
                        .frame(width: 9, height: 95)
                        .colorMultiply(.cyan)
                    Image("baseNeon")
                        .resizable()
                        .frame(width: 17, height: 95)
                    RoundedRectangle(cornerRadius: 2, style: .continuous)
                        .fill(.cyan)
                        .frame(width: 17, height: 10)
                        .offset(x: 0, y: 0)
                }
            }
            ////            marker
            //            ZStack {
            //                Image("tipBrush")
            //                    .colorMultiply(.cyan)
            //                Image("baseBrush")
            //                RoundedRectangle(cornerRadius: 6, style: .continuous)
            //                    .fill(.cyan)
            //                    .frame(width: 102, height: 84)
            //                    .offset(x: 0, y: -24)
            //            }
            //
            ////            pencil
            //            ZStack {
            //                Image("tipPencil")
            //                    .colorMultiply(.cyan)
            //                Image("basePencil")
            //                RoundedRectangle(cornerRadius: 6, style: .continuous)
            //                    .fill(.cyan)
            //                    .frame(width: 102, height: 84)
            //                    .offset(x: 0, y: -24)
            //            }
            //
            ////            pen
            //            ZStack {
            //                Image("tipPen")
            //                    .colorMultiply(.cyan)
            //                Image("basePen")
            //                RoundedRectangle(cornerRadius: 6, style: .continuous)
            //                    .fill(.cyan)
            //                    .frame(width: 102, height: 84)
            //                    .offset(x: 0, y: -24)
            //            }
            //
            ////          eraser
            //            ZStack {
            //                Image("baseEraser")
            //            }
        }
            .padding(.horizontal, 40)
            .frame(maxWidth: .infinity)
    }
}
