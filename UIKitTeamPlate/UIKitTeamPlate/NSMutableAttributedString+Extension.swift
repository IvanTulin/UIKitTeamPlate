// NSMutableAttributedString+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширение добавляет к типу функцию, позволяющую красить строку в несколько цветов
extension NSMutableAttributedString {
    /// Функция расширения, позволяющая красить строку в несколько цветов
    func setColor(color: UIColor, forText stringValue: String) {
        let range: NSRange = mutableString.range(of: stringValue, options: .caseInsensitive)
        addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
}
