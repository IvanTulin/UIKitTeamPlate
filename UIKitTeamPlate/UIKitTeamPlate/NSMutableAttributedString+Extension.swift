// NSMutableAttributedString+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширение добавляет к типу функцию, позволяющую красить строку в несколько цветов
extension NSMutableAttributedString {
    /// Окрашивание части строки в выбранный текст
    /// - Parameter color: цвет, в который будет окрашен выбранный текст.
    /// - Parameter forText: часть исходной строки, к которой применяется цвет.
    func setColor(color: UIColor, forText stringValue: String) {
        let range: NSRange = mutableString.range(of: stringValue, options: .caseInsensitive)
        addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
}
