// MainMenuViewController.swift
// Copyright © RoadMap. All rights reserved.

// Иван
import UIKit

/// Главный контролер с меню
final class MainMenuViewController: UIViewController {
    // MARK: - Visual Components

    /// Логотип кофйени
    private let logoImageView: UIImageView = {
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "КофеиновЪ")
        logoImageView.frame = CGRect(x: 100, y: 49, width: 0, height: 0)
        logoImageView.sizeToFit()
        return logoImageView
    }()

    /// Лейбл приветствия
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        return label.createCustomLabel(
            text: "Добро пожаловать,\nГость",
            color: .systemGray4,
            fontName: "Verdana-Bold",
            fontSize: 16,
            frame: CGRect(x: 20, y: 147, width: 185, height: 44)
        )
    }()

    /// Кнопка-лейбл гостя
    private let guestButton: UIButton = {
        let button = UIButton()
        button.setTitle("Г", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 16)
        button.backgroundColor = .appTurquoise
        button.frame = CGRect(x: 311, y: 147, width: 44, height: 44)
        button.layer.cornerRadius = 22
        return button
    }()

    /// Вью для меню
    private let menuView: MenuView = {
        let view = MenuView()
        view.frame = CGRect(
            x: 0,
            y: 248,
            width: 375,
            height: 564
        )
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [
            .layerMinXMinYCorner,
            .layerMaxXMinYCorner
        ]
        return view
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }

    // MARK: - Private Methods

    /// добавляем и конфигурируем UI элементы на контроллер
    private func configure() {
        view.backgroundColor = .appBrown
        view.addSubview(logoImageView)
        view.addSubview(welcomeLabel)
        view.addSubview(guestButton)
        view.addSubview(menuView)

        menuView.switchCoffeeMenu.addTarget(self, action: #selector(pressedButton), for: .touchUpInside)
    }

    /// переход на экран CoffeeMenuViewController
    @objc private func pressedButton() {
        print("go to coffee vc")
        let cofeeMenuVC = CoffeeMenuViewController()
        navigationController?.pushViewController(cofeeMenuVC, animated: true)
    }
}
