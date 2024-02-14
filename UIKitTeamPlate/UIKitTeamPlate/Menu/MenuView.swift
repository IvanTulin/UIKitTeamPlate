// MenuView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью меню
class MenuView: UIView {
    // MARK: - Constants

    enum Constants {
        static let titleForAddressesCoffeeShopsText = "Адреса кофеен"
        static let textForAddressesCoffeeShops = "Разрѣшите доступъ къ ​геолокаціи для поиска ближайшей кофейни"
        static let nameImageAddressesCoffeeShops = "mappinPlace"
        static let textForWelcomeLabel = "Добро пожаловать,\nГость"
        static let nameFontName = "Verdana"
        static let nameFontBold = "Verdana-Bold"
        static let nameImageForLogoMenu = "menu"

        static let titleForPieSelection = "Пти пате аля «РюсЪ»"
        static let nameImageForPieSelection = "pieImage"

        static let titleForSelectionHotDrinks = "Горячiя напитки»"
        static let nameImageForSelectionHotDrinks = "hotDrinksImage"

        static let titleForCoffeeSelection = "Кофий"
        static let nameImageForCoffeeSelection = "coffeeImage"
    }

    // MARK: - Visual Components

    private let addressesCoffeeShopsView: UIView = {
        let view = UIView()
        return view.createCustomView(
            viewBackgroundColor: .appLightBlue,
            viewFrame: CGRect(x: 20, y: 40, width: 335, height: 70),
            viewCornerRadius: 20,
            title: Constants.titleForAddressesCoffeeShopsText,
            titleFontName: Constants.nameFontBold,
            titleFontSize: 12,
            titleFrame: CGRect(x: 15, y: 12, width: 0, height: 0),
            text: Constants.textForAddressesCoffeeShops,
            textColor: .systemGray,
            textFontName: Constants.nameFontName,
            textFontSize: 12,
            textFrame: CGRect(x: 15, y: 30, width: 260, height: 30),
            imageName: Constants.nameImageAddressesCoffeeShops,
            imageFrame: CGRect(x: 290, y: 20, width: 0, height: 0)
        )
    }()

    private let logoMenuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: Constants.nameImageForLogoMenu)
        imageView.frame = CGRect(x: 125, y: 122, width: 0, height: 0)
        imageView.sizeToFit()
        return imageView
    }()

    private let pieSelectionView: UIView = {
        let view = UIView()
        return view.createCustomView(
            viewBackgroundColor: .appLightBrown,
            viewFrame: CGRect(x: 20, y: 216, width: 335, height: 80),
            viewCornerRadius: 20,
            title: Constants.titleForPieSelection,
            titleFontName: Constants.nameFontBold,
            titleFontSize: 16,
            titleFrame: CGRect(x: 25, y: 30, width: 0, height: 0),
            text: nil,
            textFontName: nil,
            textFontSize: nil,
            textFrame: nil,
            imageName: Constants.nameImageForPieSelection,
            imageFrame: CGRect(x: 252, y: 5, width: 0, height: 0)
        )
    }()

    private let viewOfTheSelectionHotDrinks: UIView = {
        let view = UIView()
        return view.createCustomView(
            viewBackgroundColor: .appLightBrown,
            viewFrame: CGRect(x: 20, y: 316, width: 335, height: 80),
            viewCornerRadius: 20,
            title: Constants.titleForSelectionHotDrinks,
            titleFontName: Constants.nameFontBold,
            titleFontSize: 16,
            titleFrame: CGRect(x: 25, y: 30, width: 0, height: 0),
            text: nil,
            textFontName: nil,
            textFontSize: nil,
            textFrame: nil,
            imageName: Constants.nameImageForSelectionHotDrinks,
            imageFrame: CGRect(x: 252, y: 20, width: 0, height: 0)
        )
    }()

    let coffeeSelectionView: UIView = {
        let view = UIView()
        return view.createCustomView(
            viewBackgroundColor: .appLightBrown,
            viewFrame: CGRect(x: 20, y: 416, width: 335, height: 80),
            viewCornerRadius: 20,
            title: Constants.titleForCoffeeSelection,
            titleFontName: Constants.nameFontBold,
            titleFontSize: 16,
            titleFrame: CGRect(x: 25, y: 30, width: 0, height: 0),
            text: nil,
            textFontName: nil,
            textFontSize: nil,
            textFrame: nil,
            imageName: Constants.nameImageForCoffeeSelection,
            imageFrame: CGRect(x: 252, y: 5, width: 0, height: 0)
        )
    }()

    let switchCoffeeMenu: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 20, y: 416, width: 335, height: 80)
        button.layer.cornerRadius = 10
        return button
    }()

    // MARK: - Life Cycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    /// добавляем и конфигурируем UI элементы на контроллер
    private func configureUI() {
        addSubview(addressesCoffeeShopsView)
        addSubview(logoMenuImageView)
        addSubview(pieSelectionView)
        addSubview(viewOfTheSelectionHotDrinks)
        addSubview(coffeeSelectionView)
        addSubview(switchCoffeeMenu)
    }
}
