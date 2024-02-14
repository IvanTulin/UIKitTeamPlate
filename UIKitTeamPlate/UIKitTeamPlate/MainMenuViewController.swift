// MainMenuViewController.swift
// Copyright © RoadMap. All rights reserved.

// Иван
import UIKit

/// Экран меню
final class MainMenuViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let nameImageForlogo = "КофеиновЪ"
        static let textForWelcomeLabel = "Добро пожаловать,\nГость"
        static let nameFontBold = "Verdana-Bold"
        static let titleForGuestButton = "Г"
    }

    // MARK: - Visual Components

    private let logoImageView: UIImageView = {
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: Constants.nameImageForlogo)
        logoImageView.frame = CGRect(x: 100, y: 49, width: 0, height: 0)
        logoImageView.sizeToFit()
        return logoImageView
    }()

    private let welcomeLabel: UILabel = {
        let label = UILabel()
        return label.createCustomLabel(
            text: Constants.textForWelcomeLabel,
            color: .systemGray4,
            fontName: Constants.nameFontBold,
            fontSize: 16,
            frame: CGRect(x: 20, y: 147, width: 185, height: 44)
        )
    }()

    private let guestButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.titleForGuestButton, for: .normal)
        button.titleLabel?.font = UIFont(
            name: Constants.nameFontBold,
            size: 16
        )
        button.backgroundColor = .appTurquoise
        button.frame = CGRect(x: 311, y: 147, width: 44, height: 44)
        button.layer.cornerRadius = 22
        return button
    }()

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
        let cofeeMenuVC = CoffeeMenuViewController()
        navigationController?.pushViewController(cofeeMenuVC, animated: true)
    }
}
