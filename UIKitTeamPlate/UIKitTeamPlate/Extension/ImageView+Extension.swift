// ImageView+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

extension UIImageView {
    /// создание кастомного UIImageView
    func createCustomUIImageView(
        imageName: String,
        frame: CGRect,
        clipsToBounds: Bool = false,
        contentMode: UIView.ContentMode = .scaleAspectFill,
        cornerRadius: CGFloat = 10,
        borderWidth: CGFloat = 0,
        borderColor: UIColor = .black
    ) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        imageView.frame = frame
        imageView.clipsToBounds = clipsToBounds
        imageView.contentMode = contentMode
        imageView.layer.cornerRadius = cornerRadius
        imageView.layer.borderWidth = borderWidth
        imageView.layer.borderColor = borderColor.cgColor
        return imageView
    }
}
