// RoastingOptionViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран выбора обжарки
final class RoastingOptionViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        /// Строки для лейблов
        static let roastLabelText = "Уточните обжарку зеренъ"
        static let darkRoastText = "Темная обжарка"
        static let lightRoastText = "Свѣтлая обжарка"

        /// Названия изображений типов обжарки
        static let darkRoastImage = "dark roast"
        static let lightRoastImage = "light roast"

        /// Название изображения для кнопки "Назад"
        static let closeImage = "close"

        /// Шрифты
        static let verdanaFont = "Verdana"
        static let verdanaBoldFont = "Verdana-Bold"
    }

    // MARK: - Private Properties

    /// Экземпляр модели
    var coffeeItem = Coffee()

    /// Экземпляр делегата для обмена экземпляром модели между контроллерами
    weak var delegate: TransferCoffeeOptionsDelegate?

    // MARK: - Visual Components

    /// Кнопка закрытия экрана
    private lazy var cancelButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 20, y: 26, width: 14, height: 14)
        button.setImage(UIImage(named: Constants.closeImage), for: .normal)
        button.addTarget(self, action: #selector(closeView), for: .touchUpInside)
        return button
    }()

    /// Заголовок страницы выбора обжарки
    private lazy var roastOptionLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 50, y: 53, width: 294, height: 30)
        label.text = Constants.roastLabelText
        label.textAlignment = .center
        label.font = UIFont(name: Constants.verdanaBoldFont, size: 18)
        return label
    }()

    /// Кнопка выбора темной обжарки
    private lazy var darkRoastButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 15, y: 102, width: 165, height: 165)
        button.configuration = .plain()
        button.configuration?.imagePlacement = .top
        button.configuration?.titlePadding = 20
        button.configuration?.image = UIImage(named: Constants.darkRoastImage)
        button.setTitle(Constants.darkRoastText, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.titleLabel?.font = UIFont(name: Constants.verdanaFont, size: 18)
        button.backgroundColor = .customGray
        button.layer.cornerRadius = 12
        button.layer.borderWidth = 1
        button.addTarget(self, action: #selector(chooseRoast(sender:)), for: .touchUpInside)
        return button
    }()

    /// Кнопка выбора светлой обжарки
    private lazy var lightRoastButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 195, y: 102, width: 165, height: 165)
        button.configuration = .plain()
        button.configuration?.imagePlacement = .top
        button.configuration?.imagePlacement = .top
        button.configuration?.titlePadding = 20
        button.configuration?.image = UIImage(named: Constants.lightRoastImage)
        button.setTitle(Constants.lightRoastText, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.gray, for: .highlighted)
        button.titleLabel?.font = UIFont(name: Constants.verdanaBoldFont, size: 18)
        button.backgroundColor = .customGray
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(chooseRoast), for: .touchUpInside)
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - Private Methods

    /// Установка вью
    private func setupUI() {
        view.backgroundColor = .white
        [roastOptionLabel, darkRoastButton, lightRoastButton, cancelButton].forEach { view.addSubview($0) }
        if coffeeItem.roast == .dark {
            darkRoastButton.layer.borderColor = UIColor.seaGreen.cgColor
            lightRoastButton.layer.borderColor = UIColor.customGray.cgColor
        } else {
            darkRoastButton.layer.borderColor = UIColor.customGray.cgColor
            lightRoastButton.layer.borderColor = UIColor.seaGreen.cgColor
        }
    }

    /// Метод выбора и сохранения обжарки
    @objc private func chooseRoast(sender: UIButton) {
        darkRoastButton.layer.borderColor = UIColor.customGray.cgColor
        lightRoastButton.layer.borderColor = UIColor.customGray.cgColor
        sender.layer.borderColor = UIColor.seaGreen.cgColor
        sender == darkRoastButton ? (coffeeItem.roast = .dark) : (coffeeItem.roast = .light)
    }

    /// Метод закрытия экрана
    @objc private func closeView() {
        delegate?.transferCoffeeOptions(item: coffeeItem)
        dismiss(animated: true)
    }
}
