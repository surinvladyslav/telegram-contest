//
//  ToolBarTopView.swift
//  TelegramContest
//
//  Created by Vladyslav Surin on 30.10.2022.
//

import SwiftUI

struct NavigationBarView: View {
    @EnvironmentObject var model: ViewModel
    var body: some View {
        HStack(spacing: 15) {
            Button {
                
            } label: {
                Image("undo")
                    .resizable()
                    .frame(width: 25, height: 25, alignment: .center)
            }
            .buttonStyle(.plain)
            .disabled(true)
            
            Spacer()
            
            Button {
                
            } label: {
                Image("zoomOut")
                    .resizable()
                    .frame(width: 25, height: 25, alignment: .center)
                Text("Zoom Out")
            }
            .buttonStyle(.plain)
            .disabled(true)
            
            Spacer()
            
            Button {
                model.shapes = []
                model.texts = []
            } label: {
                Text("Clear All")
            }
            .buttonStyle(.plain)
            .disabled(model.texts.count != 0 ? false : true)
            
        }
            .padding(.horizontal, 10)
            .foregroundColor(.white)
            .frame(maxHeight: .infinity, alignment: .top)
    }
}
