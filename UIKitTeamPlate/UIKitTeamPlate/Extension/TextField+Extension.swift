// TextField+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширение для UITextField
extension UITextField {
    /// создание кастомного UITextField
    func createCustomUITextField(
        frame: CGRect,
        placeholder: String,
        fontName: String,
        fontSize: CGFloat
    ) -> UITextField {
        let textField = UITextField()
        textField.frame = frame
        textField.placeholder = placeholder
        textField.font = UIFont(name: fontName, size: fontSize)
        return textField
    }
}
