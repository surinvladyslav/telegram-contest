//
//  TextModel.swift
//  TelegramContest
//
//  Created by Vladyslav Surin on 29.10.2022.
//

import SwiftUI

struct TextModel: Identifiable {
    var id = UUID().uuidString
    var text: String = ""
    var font: Font = Font(id: 0, title: "San Francisco", font: "")
    var effect: String = "default"
    var alignment: TextAlignment = .leading
    var size: CGFloat = 36.0
    var color: Color = .white
    var offset: CGSize = .zero
    var lastOffset: CGSize = .zero
    var scale: CGFloat = 1
    var lastScale: CGFloat = 1
    var rotation: Angle = .zero
    var lastRotation: Angle = .zero
    var isAdded: Bool = false
}

