//
//  PencilKitDrawNavigationController.swift
//  TelegramContest
//
//  Created by Vladyslav Surin on 28.10.2022.
//

import UIKit

class PencilKitDrawNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        updateNavigationBarBackground()
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateNavigationBarBackground()
    }
    
    func updateNavigationBarBackground() {
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        UIColor.secondarySystemBackground.withAlphaComponent(0.95).set()
        UIBezierPath(rect: CGRect(x: 0, y: 0, width: 1, height: 1)).fill()
        navigationBar.setBackgroundImage(UIGraphicsGetImageFromCurrentImageContext(), for: .default)
        UIGraphicsEndImageContext()
    }
}
