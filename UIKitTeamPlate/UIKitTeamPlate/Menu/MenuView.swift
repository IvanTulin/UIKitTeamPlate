// MenuView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью меню для контроллера
class MenuView: UIView {
    // MARK: - Private Constants

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
//        view.backgroundColor = .appLightBlue
//        view.frame = CGRect(x: 20, y: 40, width: 335, height: 70)
//        view.layer.cornerRadius = 20
//
//        let titleLabel = UILabel()
//        titleLabel.text = "Адреса кофеен"
//        titleLabel.font = UIFont(name: "Verdana-Bold", size: 12)
//        titleLabel.frame = CGRect(x: 15, y: 12, width: 0, height: 0)
//        titleLabel.sizeToFit()
//
//        let textLable = UILabel()
//        textLable.text = "Разрѣшите доступъ къ ​геолокаціи для поиска ближайшей кофейни "
//        textLable.textColor = .systemGray
//        textLable.font = UIFont(name: "Verdana", size: 12)
//        textLable.frame = CGRect(x: 15, y: 30, width: 260, height: 30)
//        textLable.numberOfLines = 0
//
//        let imageView = UIImageView()
//        imageView.image = UIImage(named: "mappinPlace")
//        imageView.frame = CGRect(x: 290, y: 20, width: 0, height: 0)
//        imageView.sizeToFit()
//
//        view.addSubview(titleLabel)
//        view.addSubview(textLable)
//        view.addSubview(imageView)
//        return view
    }()

    private let logoMenuImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "menu")
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

    private let coffeeSelectionView: UIView = {
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

    private func configureUI() {
        addSubview(addressesCoffeeShopsView)
        addSubview(logoMenuImageView)
        addSubview(pieSelectionView)
        addSubview(viewOfTheSelectionHotDrinks)
        addSubview(coffeeSelectionView)
    }
}
