// Label+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

extension UILabel {
    /// создание кастомного Лейбла
    func createCustomLabel(
        text: String,
        fontName: String,
        fontsize: CGFloat,
        frame: CGRect,
        numberOfLine: Int = 0,
        textAligment: NSTextAlignment = .center,
        textColor: UIColor = .black
    ) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont(name: fontName, size: fontsize)
        label.numberOfLines = numberOfLine
        label.textAlignment = textAligment
        label.textColor = textColor
        label.frame = frame
        return label
    }
}
