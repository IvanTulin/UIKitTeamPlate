// AuthorizationViewController.swift
// Copyright © RoadMap. All rights reserved.

// Иван
import UIKit

/// Экран авторизации
final class AuthorizationViewController: UIViewController {
    // MARK: - Constants

    enum Constants {
        static let imageNameLogo = "КофеиновЪ"
    }

    // MARK: - Visual Components

    /// Логотип кофйени
    private let logoImageView: UIImageView = {
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: Constants.imageNameLogo)
        logoImageView.frame = CGRect(x: 100, y: 103, width: 0, height: 0)
        logoImageView.sizeToFit()
        return logoImageView
    }()

    /// Вью авторизации
    private let authorizationView: AuthorizationView = {
        let authorizationView = AuthorizationView()
        authorizationView.frame = CGRect(
            x: 0,
            y: 248,
            width: 375,
            height: 564
        )
        authorizationView.backgroundColor = .white
        authorizationView.layer.cornerRadius = 20
        authorizationView.layer.maskedCorners = [
            .layerMinXMinYCorner,
            .layerMaxXMinYCorner
        ]
        return authorizationView
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Private Methods

    /// добавляем и конфигурируем UI элементы на контроллер
    private func configureUI() {
        view.backgroundColor = .appBrown
        view.addSubview(logoImageView)
        view.addSubview(authorizationView)

        let tapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(removeKeyboard)
        )
        view.addGestureRecognizer(tapGestureRecognizer)

        authorizationView.loginButton.addTarget(
            self,
            action: #selector(goToMainController),
            for: .touchUpInside
        )
    }

    /// Убираем клавиатуру
    @objc private func removeKeyboard() {
        view.endEditing(true)
    }

    /// переход на экран MainMenuViewController
    @objc private func goToMainController() {
        let mainMenuVC = MainMenuViewController()
        let navigationVC = UINavigationController(
            rootViewController: mainMenuVC
        )
        navigationVC.modalPresentationStyle = .fullScreen
        present(navigationVC, animated: true)
    }
}
