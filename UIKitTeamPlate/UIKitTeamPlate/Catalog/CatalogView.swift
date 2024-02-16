// CatalogView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью каталога
class CatalogView: UIView {
    // MARK: - Constants

    enum Constants {
        static let nameFontBold = "Verdana-Bold"
        static let textForLableBrend = "Бренд"
        static let textForLableShoes = "Обувь"
        static let textForLableBags = "Сумки"
        static let textForLabelNewProduct = "Новинки"
        static let textForLabelSale = "Распродажа"
    }

    // MARK: - Visual Components

    let newProductImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage()
        imageView.backgroundColor = .systemBlue
        imageView.layer.cornerRadius = 12
        imageView.addShadow()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let newProductLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.textForLabelNewProduct
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: Constants.nameFontBold, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let saleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage()
        imageView.backgroundColor = .orange
        imageView.layer.cornerRadius = 12
        imageView.addShadow()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let saleLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.textForLabelSale
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: Constants.nameFontBold, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let brendView: UIView = {
        let view = UIView()
        view.backgroundColor = .appLightGray
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let shoesView: UIView = {
        let view = UIView()
        view.backgroundColor = .appLightGray
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let showChoosingShoesButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private let bagsView: UIView = {
        let view = UIView()
        view.backgroundColor = .appLightGray
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let brendLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.textForLableBrend
        label.font = UIFont(name: Constants.nameFontBold, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let shoesLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.textForLableShoes
        label.font = UIFont(name: Constants.nameFontBold, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let bagsLabel: UILabel = {
        let label = UILabel()
        label.text = Constants.textForLableBags
        label.font = UIFont(name: Constants.nameFontBold, size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Properties

    var brendImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    var shoesImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    var bagsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureConstraintsForViews()
        configureConstraintsForLabels()
        configureConstraintsForButton()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    /// Конфигурируем все элементы UI
    private func configureUI() {
        addSubview(newProductImageView)
        addSubview(newProductLabel)
        addSubview(saleImageView)
        addSubview(saleLabel)
        addSubview(brendView)
        addSubview(shoesView)
        addSubview(bagsView)
        addSubview(brendLabel)
        addSubview(shoesLabel)
        addSubview(bagsLabel)
        addSubview(brendImageView)
        addSubview(shoesImageView)
        addSubview(bagsImageView)
        addSubview(showChoosingShoesButton)
    }

    /// Конфигурируем констрейнты для вью
    private func configureConstraintsForViews() {
        NSLayoutConstraint.activate([
            // Configure newProductImageView
            newProductImageView.leftAnchor.constraint(
                equalTo: leftAnchor,
                constant: 20
            ),
            newProductImageView.topAnchor.constraint(
                equalTo: topAnchor
            ),
            newProductImageView.widthAnchor.constraint(equalToConstant: 160),
            newProductImageView.heightAnchor.constraint(equalToConstant: 120),

            // Configure saleImageView
            saleImageView.leftAnchor.constraint(
                equalTo: newProductImageView.rightAnchor,
                constant: 15
            ),
            saleImageView.topAnchor.constraint(
                equalTo: topAnchor
            ),
            saleImageView.widthAnchor.constraint(equalToConstant: 160),
            saleImageView.heightAnchor.constraint(equalToConstant: 120),

            // Configure brendView
            brendView.leftAnchor.constraint(
                equalTo: leftAnchor, constant: 20
            ),
            brendView.topAnchor.constraint(
                equalTo: saleImageView.bottomAnchor, constant: 20
            ),
            brendView.widthAnchor.constraint(equalToConstant: 335),
            brendView.heightAnchor.constraint(equalToConstant: 80),

            brendImageView.rightAnchor.constraint(
                equalTo: brendView.rightAnchor
            ),
            brendImageView.topAnchor.constraint(
                equalTo: brendView.topAnchor
            ),
            brendImageView.widthAnchor.constraint(equalToConstant: 99),
            brendImageView.heightAnchor.constraint(
                equalTo: brendView.heightAnchor
            ),

            // Configure shoesView
            shoesView.leftAnchor.constraint(
                equalTo: leftAnchor, constant: 20
            ),
            shoesView.topAnchor.constraint(
                equalTo: brendView.bottomAnchor, constant: 20
            ),
            shoesView.widthAnchor.constraint(equalToConstant: 335),
            shoesView.heightAnchor.constraint(equalToConstant: 80),

            shoesImageView.rightAnchor.constraint(
                equalTo: shoesView.rightAnchor
            ),
            shoesImageView.topAnchor.constraint(
                equalTo: shoesView.topAnchor
            ),
            shoesImageView.widthAnchor.constraint(equalToConstant: 99),
            shoesImageView.heightAnchor.constraint(
                equalTo: shoesView.heightAnchor
            ),

            // Configure bagsView
            bagsView.leftAnchor.constraint(
                equalTo: leftAnchor, constant: 20
            ),
            bagsView.topAnchor.constraint(
                equalTo: shoesView.bottomAnchor, constant: 20
            ),
            bagsView.widthAnchor.constraint(equalToConstant: 335),
            bagsView.heightAnchor.constraint(equalToConstant: 80),

            bagsImageView.rightAnchor.constraint(
                equalTo: bagsView.rightAnchor
            ),
            bagsImageView.topAnchor.constraint(
                equalTo: bagsView.topAnchor
            ),
            bagsImageView.widthAnchor.constraint(equalToConstant: 99),
            bagsImageView.heightAnchor.constraint(
                equalTo: bagsView.heightAnchor
            ),
        ])
    }

    /// Конфигурируем констрейнты для Лейблов
    private func configureConstraintsForLabels() {
        NSLayoutConstraint.activate([
            newProductLabel.leftAnchor.constraint(
                equalTo: newProductImageView.leftAnchor,
                constant: 2
            ),
            newProductLabel.topAnchor.constraint(
                equalTo: newProductImageView.topAnchor
            ),
            newProductLabel.widthAnchor.constraint(
                equalTo: newProductImageView.widthAnchor
            ),
            newProductLabel.heightAnchor.constraint(
                equalToConstant: 17
            ),

            saleLabel.leftAnchor.constraint(
                equalTo: saleImageView.leftAnchor,
                constant: 2
            ),
            saleLabel.bottomAnchor.constraint(
                equalTo: saleImageView.bottomAnchor
            ),
            saleLabel.widthAnchor.constraint(
                equalTo: saleImageView.widthAnchor
            ),
            saleLabel.heightAnchor.constraint(
                equalToConstant: 17
            ),

            brendLabel.leftAnchor.constraint(
                equalTo: brendView.leftAnchor,
                constant: 20
            ),
            brendLabel.topAnchor.constraint(
                equalTo: brendView.topAnchor,
                constant: 31
            ),
            brendLabel.widthAnchor.constraint(equalToConstant: 100),
            brendLabel.heightAnchor.constraint(equalToConstant: 17),

            shoesLabel.leftAnchor.constraint(
                equalTo: shoesView.leftAnchor,
                constant: 20
            ),
            shoesLabel.topAnchor.constraint(
                equalTo: shoesView.topAnchor,
                constant: 31
            ),
            shoesLabel.widthAnchor.constraint(equalToConstant: 100),
            shoesLabel.heightAnchor.constraint(equalToConstant: 17),

            bagsLabel.leftAnchor.constraint(
                equalTo: bagsView.leftAnchor,
                constant: 20
            ),
            bagsLabel.topAnchor.constraint(
                equalTo: bagsView.topAnchor,
                constant: 31
            ),
            bagsLabel.widthAnchor.constraint(equalToConstant: 100),
            bagsLabel.heightAnchor.constraint(equalToConstant: 17)
        ])
    }

    /// Конфигурируем констрейнты для кнопки
    private func configureConstraintsForButton() {
        NSLayoutConstraint.activate([
            showChoosingShoesButton.leftAnchor.constraint(
                equalTo: shoesView.leftAnchor
            ),
            showChoosingShoesButton.topAnchor.constraint(
                equalTo: shoesView.topAnchor
            ),
            showChoosingShoesButton.widthAnchor.constraint(equalTo: shoesView.widthAnchor),
            showChoosingShoesButton.heightAnchor.constraint(equalTo: shoesView.heightAnchor),
        ])
    }
}
