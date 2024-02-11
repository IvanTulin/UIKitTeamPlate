// ImageView+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Расширение для UIImageView
extension UIImageView {
    /// создание кастомного UIImageView
    func createCustomUIImageView(
        imageName: String,
        frame: CGRect
    ) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        imageView.frame = frame
        return imageView
    }
}
