// View+Extension.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

extension UIView {
    func createCustomView(
        viewBackgroundColor: UIColor = .white,
        viewFrame: CGRect,
        viewCornerRadius: CGFloat,
        title: String,
        titleFontName: String,
        titleFontSize: CGFloat,
        titleFrame: CGRect,
        text: String?,
        textColor: UIColor? = .black,
        textFontName: String?,
        textFontSize: CGFloat?,
        textFrame: CGRect?,
        imageName: String,
        imageFrame: CGRect
    ) -> UIView {
        let view = UIView()
        view.backgroundColor = viewBackgroundColor
        view.frame = viewFrame
        view.layer.cornerRadius = viewCornerRadius

        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.font = UIFont(name: titleFontName, size: titleFontSize)
        titleLabel.frame = titleFrame
        titleLabel.sizeToFit()

        let textLable = UILabel()
        textLable.text = text
        textLable.textColor = textColor
        textLable.font = UIFont(
            name: textFontName ?? "",
            size: textFontSize ?? 0
        )
        textLable.frame = textFrame ?? CGRect(
            x: 0,
            y: 0,
            width: 0,
            height: 0
        )
        textLable.numberOfLines = 0

        let imageView = UIImageView()
        imageView.image = UIImage(named: imageName)
        imageView.frame = imageFrame
        imageView.sizeToFit()

        view.addSubview(titleLabel)
        view.addSubview(textLable)
        view.addSubview(imageView)
        return view
    }
}
