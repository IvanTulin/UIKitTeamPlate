// TextField+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

extension UITextField {
    func creatCustomTextField(
        fontName: String,
        fontSize: CGFloat,
        frame: CGRect,
        placeholder: String
    ) -> UITextField {
        let textField = UITextField()
        textField.font = UIFont(name: fontName, size: fontSize)
        textField.frame = frame
        textField.placeholder = placeholder
        return textField
    }
}
