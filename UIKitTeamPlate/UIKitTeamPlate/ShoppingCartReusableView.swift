// ShoppingCartReusableView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Ячейка корзины
final class ShoppingCartReusableView: UIView {
    // MARK: - Constants

    enum Constants {
        static let cartButtonImage = UIImage.card
        static let sizes = [35, 36, 37, 38, 39]
    }

    // MARK: - Public Properties

    var increasingCompletion: (() -> ())?
    var decreasingCompletion: (() -> ())?

    // MARK: - Visual Components

    lazy var itemImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage.shoe
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(imageView)
        imageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 80).isActive = true
        return imageView
    }()

    lazy var imageBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.2)
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(itemImageView)
        view.addSubview(cartButton)
        addSubview(view)
        return view
    }()

    lazy var cartButton: UIButton = {
        let button = UIButton()
        button.setImage(.card, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var itemNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        return label
    }()

    private lazy var quantityTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Количество"
        label.font = UIFont(name: "Verdana", size: 12)

        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        return label
    }()

    lazy var minusItemButton: UIButton = {
        let button = UIButton()
        button.setTitle("-", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 12)
        button.backgroundColor = .lightPink
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.customMagenta, for: .highlighted)
        button.layer.cornerRadius = 7
        button.contentVerticalAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(deleteOneItem), for: .touchUpInside)
        addSubview(button)
        return button
    }()

    lazy var quantityLabel: UILabel = {
        let label = UILabel()
        label.text = "2"
        label.font = UIFont(name: "Verdana", size: 12)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        return label
    }()

    lazy var plusItemButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 12)
        button.backgroundColor = .lightPink
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.customMagenta, for: .highlighted)
        button.layer.cornerRadius = 7
        button.contentVerticalAlignment = .center
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(addOneMoreItem), for: .touchUpInside)
        addSubview(button)
        return button
    }()

    private lazy var sizeLabel: UILabel = {
        let label = UILabel()
        label.text = "Размер"
        label.font = UIFont(name: "Verdana", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        return label
    }()

    private lazy var priceTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Цена"
        label.font = UIFont(name: "Verdana", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        return label
    }()

    lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Verdana-Bold", size: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        addSubview(label)
        return label
    }()

    private lazy var button35: UIButton = {
        let button = createSizeButton(size: 35)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 10)
        return button
    }()

    private lazy var button36: UIButton = {
        let button = createSizeButton(size: 36)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 10)
        return button
    }()

    private lazy var button37: UIButton = {
        let button = createSizeButton(size: 37)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 10)
        return button
    }()

    private lazy var button38: UIButton = {
        let button = createSizeButton(size: 38)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 10)
        return button
    }()

    private lazy var button39: UIButton = {
        let button = createSizeButton(size: 39)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.titleLabel?.font = UIFont(name: "Verdana", size: 10)
        return button
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    // MARK: - Public Methods

    func highlightSizeButton(size: Shoes.ShoeSize) {
        switch size {
        case .thirtyFive:
            button35.layer.borderColor = UIColor.red.cgColor
            button35.layer.borderWidth = 1
        case .thirtySix:
            button36.layer.borderColor = UIColor.red.cgColor
            button36.layer.borderWidth = 1
        case .thirtySeven:
            button37.layer.borderColor = UIColor.red.cgColor
            button37.layer.borderWidth = 1
        case .thirtyEight:
            button38.layer.borderColor = UIColor.red.cgColor
            button38.layer.borderWidth = 1
        case .thirtyNine:
            button39.layer.borderColor = UIColor.red.cgColor
            button39.layer.borderWidth = 1
        }
    }

    // MARK: - Private Methods

    private func setupView() {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: 157).isActive = true

        addSubview(button35)
        addSubview(button36)
        addSubview(button37)
        addSubview(button38)
        addSubview(button39)

        itemImageView.centerXAnchor.constraint(equalTo: imageBackgroundView.centerXAnchor).isActive = true
        itemImageView.centerYAnchor.constraint(equalTo: imageBackgroundView.centerYAnchor).isActive = true

        imageBackgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        imageBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        imageBackgroundView.heightAnchor.constraint(equalToConstant: 157).isActive = true
        imageBackgroundView.widthAnchor.constraint(equalToConstant: 157).isActive = true

        cartButton.topAnchor.constraint(equalTo: imageBackgroundView.topAnchor, constant: 16).isActive = true
        cartButton.trailingAnchor.constraint(equalTo: imageBackgroundView.trailingAnchor, constant: -16).isActive = true

        itemNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        itemNameLabel.leadingAnchor.constraint(equalTo: imageBackgroundView.trailingAnchor, constant: 20)
            .isActive = true
        itemNameLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        itemNameLabel.widthAnchor.constraint(equalToConstant: 110).isActive = true

        quantityTitleLabel.topAnchor.constraint(equalTo: itemNameLabel.bottomAnchor, constant: 10).isActive = true
        quantityTitleLabel.leadingAnchor.constraint(equalTo: imageBackgroundView.trailingAnchor, constant: 20)
            .isActive = true
        quantityTitleLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        quantityTitleLabel.widthAnchor.constraint(equalToConstant: 72).isActive = true

        minusItemButton.topAnchor.constraint(equalTo: quantityTitleLabel.topAnchor).isActive = true
        minusItemButton.leadingAnchor.constraint(equalTo: quantityTitleLabel.trailingAnchor, constant: 24)
            .isActive = true
        minusItemButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
        minusItemButton.widthAnchor.constraint(equalToConstant: 15).isActive = true

        quantityLabel.topAnchor.constraint(equalTo: quantityTitleLabel.topAnchor).isActive = true
        quantityLabel.leadingAnchor.constraint(equalTo: minusItemButton.trailingAnchor, constant: 4)
            .isActive = true
        quantityLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        quantityLabel.widthAnchor.constraint(equalToConstant: 15).isActive = true

        plusItemButton.topAnchor.constraint(equalTo: quantityTitleLabel.topAnchor).isActive = true
        plusItemButton.leadingAnchor.constraint(equalTo: quantityLabel.trailingAnchor, constant: 4)
            .isActive = true
        plusItemButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
        plusItemButton.widthAnchor.constraint(equalToConstant: 15).isActive = true

        sizeLabel.topAnchor.constraint(equalTo: quantityTitleLabel.bottomAnchor, constant: 10).isActive = true
        sizeLabel.leadingAnchor.constraint(equalTo: imageBackgroundView.trailingAnchor, constant: 20).isActive = true
        sizeLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        sizeLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true

        [
            button35,
            button36,
            button37,
            button38,
            button39
        ].forEach {
            $0.widthAnchor.constraint(equalToConstant: 31).isActive = true
            $0.heightAnchor.constraint(equalToConstant: 17).isActive = true
        }

        button35.topAnchor.constraint(equalTo: sizeLabel.bottomAnchor, constant: 10).isActive = true
        button36.topAnchor.constraint(equalTo: button35.topAnchor).isActive = true
        button37.topAnchor.constraint(equalTo: button35.topAnchor).isActive = true
        button38.topAnchor.constraint(equalTo: button35.topAnchor).isActive = true
        button39.topAnchor.constraint(equalTo: button35.bottomAnchor, constant: 4).isActive = true
        button35.leadingAnchor.constraint(equalTo: imageBackgroundView.trailingAnchor, constant: 20).isActive = true
        button36.leadingAnchor.constraint(equalTo: button35.trailingAnchor, constant: 4).isActive = true
        button37.leadingAnchor.constraint(equalTo: button36.trailingAnchor, constant: 4).isActive = true
        button38.leadingAnchor.constraint(equalTo: button37.trailingAnchor, constant: 4).isActive = true
        button39.leadingAnchor.constraint(equalTo: imageBackgroundView.trailingAnchor, constant: 20).isActive = true

        priceTitleLabel.topAnchor.constraint(equalTo: button39.bottomAnchor, constant: 10).isActive = true
        priceTitleLabel.leadingAnchor.constraint(equalTo: imageBackgroundView.trailingAnchor, constant: 20)
            .isActive = true
        priceTitleLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        priceTitleLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true

        priceLabel.topAnchor.constraint(equalTo: priceTitleLabel.topAnchor).isActive = true
        priceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
        priceLabel.widthAnchor.constraint(equalToConstant: 60).isActive = true
    }

    private func createSizeButton(size: Int) -> UIButton {
        let button = UIButton()
        button.backgroundColor = UIColor.lightPink
        button.setTitle("\(size)", for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = size
        addSubview(button)
        return button
    }

    @objc private func addOneMoreItem() {
        increasingCompletion?()
    }

    @objc private func deleteOneItem() {
        decreasingCompletion?()
    }
}
