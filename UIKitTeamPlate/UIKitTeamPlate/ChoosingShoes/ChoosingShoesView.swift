// ChoosingShoesView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью выбора обуви
final class ChoosingShoesView: UIView {
    // MARK: - Constants

    enum Constant {
        static let nameForLabelText = ""
        static let nameFontBold = "Verdana-Bold"
    }

    // MARK: - Visual Components

    let shoesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let costLabel: UILabel = {
        let label = UILabel()
        label.text = Constant.nameForLabelText
        label.textAlignment = .right
        label.font = UIFont(name: Constant.nameFontBold, size: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let shoppingCartButton: UIButton = {
        let buttom = UIButton()
        buttom.setImage(.shoppinCart, for: .normal)
        buttom.sizeToFit()
        buttom.translatesAutoresizingMaskIntoConstraints = false
        return buttom
    }()

    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    private func configureUI() {
        addSubview(shoesImageView)
        addSubview(costLabel)
        addSubview(shoppingCartButton)
    }

    private func configureConstraints() {
        NSLayoutConstraint.activate([
            shoesImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            shoesImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            shoesImageView.widthAnchor.constraint(equalToConstant: 100),
            shoesImageView.heightAnchor.constraint(equalToConstant: 100),

            costLabel.leftAnchor.constraint(
                equalTo: leftAnchor,
                constant: 85
            ),
            costLabel.topAnchor.constraint(
                equalTo: shoesImageView.bottomAnchor,
                constant: 6
            ),
            costLabel.widthAnchor.constraint(equalToConstant: 63),
            costLabel.heightAnchor.constraint(equalToConstant: 12),

            shoppingCartButton.leftAnchor.constraint(equalTo: leftAnchor, constant: 129),
            shoppingCartButton.topAnchor.constraint(equalTo: topAnchor, constant: 12)
        ])
    }
}
