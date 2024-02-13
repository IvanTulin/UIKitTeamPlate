// AuthorizationViewController.swift
// Copyright © RoadMap. All rights reserved.

// Иван
import UIKit

/// Экран авторизации
final class AuthorizationViewController: UIViewController {
    // MARK: - Private Constants

    /// Логотип кофйени
    private let logoImageView: UIImageView = {
        let logoImageView = UIImageView()
        logoImageView.image = UIImage(named: "КофеиновЪ")
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

        authorizationView.loginButton.addTarget(self, action: #selector(goToMainController), for: .touchUpInside)
    }

    /// переход на экран MainMenuViewController
    @objc private func goToMainController() {
        let mainVC = MainMenuViewController()
        present(mainVC, animated: true)
    }
}
