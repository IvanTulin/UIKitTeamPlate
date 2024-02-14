// Label+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

extension UILabel {
    func createCustomLabel(
        text: String,
        color: UIColor = .black,
        fontName: String,
        fontSize: CGFloat,
        frame: CGRect,
        numberOfLines: Int = 0,
        textAlignment: NSTextAlignment = .left
    ) -> UILabel {
        let label = UILabel()
        label.text = text
        label.textColor = color
        label.font = UIFont(name: fontName, size: fontSize)
        label.frame = frame
        label.numberOfLines = numberOfLines
        label.textAlignment = textAlignment
        return label
    }
}

// private let authorizationLabel: UILabel = {
//    let authorizationLabel = UILabel()
//    authorizationLabel.text = "Авторизация"
//    authorizationLabel.font = UIFont(name: "Verdana-Bold", size: 26)
//    authorizationLabel.frame = CGRect(x: 20, y: 32, width: 0, height: 0)
//    authorizationLabel.sizeToFit()
//    return authorizationLabel
// }()
