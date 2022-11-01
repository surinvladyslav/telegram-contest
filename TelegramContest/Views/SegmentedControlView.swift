//
//  SegmentControl.swift
//  TelegramContest
//
//  Created by Vladyslav Surin on 29.10.2022.
//

import SwiftUI
    
struct SegmentedControlView: View {
    @EnvironmentObject var model: ViewModel

    var options: [String]
    let color = Color.gray.opacity(0.6)
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(options.indices, id:\.self) { index in
                let isSelected = model.preselectedIndex == index
                ZStack {
                    Rectangle()
                        .fill(color.opacity(0.4))
                    
                    Rectangle()
                        .fill(color)
                        .cornerRadius(20)
                        .padding(2)
                        .opacity(isSelected ? 1 : 0.01)
                        .onTapGesture {
                            withAnimation(.interactiveSpring(response: 0.2,
                                                             dampingFraction: 2,
                                                             blendDuration: 0.5)) {
                                model.preselectedIndex = index
                            }
                        }
                }
                .overlay(
                    Text(options[index])
                        .foregroundColor(.white)
                        .fontWeight(.medium)
                        .font(.system(size: 13))
                )
            }
        }
        .frame(height: 35)
        .cornerRadius(20)
    }
}

