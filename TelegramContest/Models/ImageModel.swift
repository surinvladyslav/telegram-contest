//
//  StackItem.swift
//  TelegramContest
//
//  Created by Vladyslav Surin on 28.10.2022.
//

import SwiftUI

struct ImageModel: Identifiable {
    var id = UUID().uuidString
    var view: AnyView
    var offset: CGSize = .zero
    var lastOffset: CGSize = .zero
    var scale: CGFloat = 1
    var lastScale: CGFloat = 1
    var rotation: Angle = .zero
    var lastRotation: Angle = .zero
}

