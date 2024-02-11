// CALayer+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

extension CALayer {
    /// создание кастомного CALayer
    func createCustomCALayer(
        frame: CGRect,
        backgroundColor: UIColor
    ) -> CALayer {
        let layer = CALayer()
        layer.frame = frame
        layer.backgroundColor = backgroundColor.cgColor
        return layer
    }
}
