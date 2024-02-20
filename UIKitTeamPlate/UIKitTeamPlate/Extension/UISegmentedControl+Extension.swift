// UISegmentedControl+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

extension UISegmentedControl {
    /// Устанавливаем жирный шрифт для титла у UISegmentedControl
    func setBolbFont(name: String?, size: CGFloat?) {
        guard let name = name, let size = size else { return }
        let attributedSegmentFont = NSDictionary(
            object: UIFont(name: name, size: size) ?? "",
            forKey: NSAttributedString.Key.font as NSCopying
        )

        setTitleTextAttributes(
            attributedSegmentFont as [NSObject: AnyObject] as [NSObject: AnyObject] as? [NSAttributedString.Key: Any],
            for: .normal
        )
    }
}
