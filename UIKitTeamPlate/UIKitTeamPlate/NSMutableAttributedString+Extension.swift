//
//  NSMutableAttributedString+Extension.swift
//  UIKitTeamPlate
//
//  Created by Наталья Владимировна Пофтальная on 14.02.2024.
//

import UIKit

/// Расширение добавляет к типу функцию, позволяющую красить строку в несколько цветов
extension NSMutableAttributedString {
    func setColor(color: UIColor, forText stringValue: String) {
        let range: NSRange = mutableString.range(of: stringValue, options: .caseInsensitive)
        addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    }
}
