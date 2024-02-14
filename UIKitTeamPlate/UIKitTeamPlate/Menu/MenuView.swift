// MenuView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью меню для контроллера
class MenuView: UIView {
    // MARK: - Visual Components

    /// вью адресов кофеен
    private let addressesCoffeeShopsView: UIView = {
        let view = UIView()
        return view.createCustomView(
            viewBackgroundColor: .appLightBlue,
            viewFrame: CGRect(x: 20, y: 40, width: 335, height: 70),
            viewCornerRadius: 20,
            title: "Адреса кофеен",
            titleFontName: "Verdana-Bold",
            titleFontSize: 12,
            titleFrame: CGRect(x: 15, y: 12, width: 0, height: 0),
            text: "Разрѣшите доступъ къ ​геолокаціи для поиска ближайшей кофейни",
            textColor: .systemGray,
            textFontName: "Verdana",
            textFontSize: 12,
            textFrame: CGRect(x: 15, y: 30, width: 260, height: 30),
            imageName: "mappinPlace",
            imageFrame: CGRect(x: 290, y: 20, width: 0, height: 0)
        )
    }()

    /// Логотип меню
    private let logoMenuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "menu")
        imageView.frame = CGRect(x: 125, y: 122, width: 0, height: 0)
        imageView.sizeToFit()
        return imageView
    }()

    /// Вью для меню выбора пирогов
    private let pieSelectionView: UIView = {
        let view = UIView()
        return view.createCustomView(
            viewBackgroundColor: .appLightBrown,
            viewFrame: CGRect(x: 20, y: 216, width: 335, height: 80),
            viewCornerRadius: 20,
            title: "Пти пате аля «РюсЪ»",
            titleFontName: "Verdana-Bold",
            titleFontSize: 16,
            titleFrame: CGRect(x: 25, y: 30, width: 0, height: 0),
            text: nil,
            textFontName: nil,
            textFontSize: nil,
            textFrame: nil,
            imageName: "pieImage",
            imageFrame: CGRect(x: 252, y: 5, width: 0, height: 0)
        )
    }()

    /// Вью для меню горячих напитков
    private let viewOfTheSelectionHotDrinks: UIView = {
        let view = UIView()
        return view.createCustomView(
            viewBackgroundColor: .appLightBrown,
            viewFrame: CGRect(x: 20, y: 316, width: 335, height: 80),
            viewCornerRadius: 20,
            title: "Горячiя напитки»",
            titleFontName: "Verdana-Bold",
            titleFontSize: 16,
            titleFrame: CGRect(x: 25, y: 30, width: 0, height: 0),
            text: nil,
            textFontName: nil,
            textFontSize: nil,
            textFrame: nil,
            imageName: "hotDrinksImage",
            imageFrame: CGRect(x: 252, y: 20, width: 0, height: 0)
        )
    }()

    /// Вью для меню выбора кофе
    let coffeeSelectionView: UIView = {
        let view = UIView()
        return view.createCustomView(
            viewBackgroundColor: .appLightBrown,
            viewFrame: CGRect(x: 20, y: 416, width: 335, height: 80),
            viewCornerRadius: 20,
            title: "Кофий",
            titleFontName: "Verdana-Bold",
            titleFontSize: 16,
            titleFrame: CGRect(x: 25, y: 30, width: 0, height: 0),
            text: nil,
            textFontName: nil,
            textFontSize: nil,
            textFrame: nil,
            imageName: "coffeeImage",
            imageFrame: CGRect(x: 252, y: 5, width: 0, height: 0)
        )
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

    private func configureUI() {
        addSubview(addressesCoffeeShopsView)
        addSubview(logoMenuImageView)
        addSubview(pieSelectionView)
        addSubview(viewOfTheSelectionHotDrinks)
        addSubview(coffeeSelectionView)
    }
}
