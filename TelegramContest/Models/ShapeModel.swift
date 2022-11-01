//
//  ShapeModel.swift
//  TelegramContest
//
//  Created by Vladyslav Surin on 31.10.2022.
//

import SwiftUI

struct ShapeModel: Identifiable {
    var id = UUID().uuidString
    var shape: String = ""
    var size: CGFloat = 100
    var color: Color = .white
    var offset: CGSize = .zero
    var lastOffset: CGSize = .zero
    var scale: CGFloat = 1
    var lastScale: CGFloat = 1
    var rotation: Angle = .zero
    var lastRotation: Angle = .zero
    var isAdded: Bool = false
}

