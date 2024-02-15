// AuthorizationView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Вью авторизации для AuthorizationViewController
final class AuthorizationView: UIView {
    // MARK: - Constants

    enum Constants {
        static let nameFontName = "Verdana"
        static let nameFontBold = "Verdana-Bold"
        static let namePlaceholderLogin = "Введите почту"
        static let namePlaceholderPassword = "Введите парол"
        static let titleButton = "Войти"
        static let textForLabelAuthorization = "Авторизация"
        static let textForLoginLabel = "Логин"
        static let textForPasswordLabel = "Пароль"
        static let nameImageSecurityButton = "eye"
        static let nameImageSlashSecurityButton = "eye.slash.fill"
    }

    // MARK: - Visual Components

    let loginTextField: UITextField = {
        let loginTextField = UITextField()
        return loginTextField.creatCustomTextField(
            fontName: Constants.nameFontName,
            fontSize: 14,
            frame: CGRect(x: 20, y: 113, width: 175, height: 17),
            placeholder: Constants.namePlaceholderLogin
        )
    }()

    let passwordTextField: UITextField = {
        let loginTextField = UITextField()
        return loginTextField.creatCustomTextField(
            fontName: Constants.nameFontName,
            fontSize: 14,
            frame: CGRect(x: 20, y: 188, width: 175, height: 17),
            placeholder: Constants.namePlaceholderPassword
        )
    }()

    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle(Constants.titleButton, for: .normal)
        button.titleLabel?.font = UIFont(
            name: Constants.nameFontBold,
            size: 16
        )
        button.tintColor = .white
        button.backgroundColor = .appTurquoise
        button.frame = CGRect(x: 20, y: 416, width: 335, height: 44)
        button.layer.cornerRadius = 10
        return button
    }()

    private let authorizationLabel: UILabel = {
        let authorizationLabel = UILabel()
        return authorizationLabel.createCustomLabel(
            text: Constants.textForLabelAuthorization,
            fontName: Constants.nameFontBold,
            fontSize: 26,
            frame: CGRect(x: 20, y: 32, width: 195, height: 31)
        )
    }()

    private let loginLabel: UILabel = {
        let loginLabel = UILabel()
        return loginLabel.createCustomLabel(
            text: Constants.textForLoginLabel,
            fontName: Constants.nameFontBold,
            fontSize: 16,
            frame: CGRect(x: 20, y: 84, width: 175, height: 19)
        )
    }()

    private let passwordLabel: UILabel = {
        let passwordLabel = UILabel()
        return passwordLabel.createCustomLabel(
            text: Constants.textForPasswordLabel,
            fontName: Constants.nameFontBold,
            fontSize: 16,
            frame: CGRect(x: 20, y: 159, width: 175, height: 19)
        )
    }()

    private lazy var securityButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: Constants.nameImageSecurityButton), for: .normal)
        button.frame = CGRect(x: 333, y: 185, width: 0, height: 0)
        button.tintColor = .systemGray4
        button.sizeToFit()
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(hideText), for: .touchUpInside)
        return button
    }()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        checkText()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Private Methods

    /// добавляем и конфигурируем UI элементы на вью
    private func configureUI() {
        addSubview(authorizationLabel)
        addSubview(loginLabel)
        addSubview(passwordLabel)
        addSubview(loginTextField)
        addSubview(passwordTextField)
        addSubview(securityButton)
        addSubview(loginButton)
    }

    /// Делаем проверку на пустоту текстфилдов
    private func checkText() {
        loginButton.isEnabled = false
        loginButton.alpha = 0.5
        loginTextField.addTarget(self, action: #selector(activateButton), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(activateButton), for: .editingChanged)
    }

    /// скрываем/показываем пароль
    @objc private func hideText() {
        if passwordTextField.isSecureTextEntry == false {
            passwordTextField.isSecureTextEntry = true
            securityButton.setImage(
                UIImage(
                    systemName: Constants.nameImageSlashSecurityButton
                ),
                for: .normal
            )
        } else {
            passwordTextField.isSecureTextEntry = false
            securityButton.setImage(UIImage(systemName: Constants.nameImageSecurityButton), for: .normal)
        }
    }

    /// Активируем кнопку
    @objc private func activateButton() {
        if let login = loginTextField.text, let password = passwordTextField.text, !login.isEmpty, !password.isEmpty {
            loginButton.isEnabled = true
            loginButton.alpha = 1.0
        } else {
            loginButton.isEnabled = false
            loginButton.alpha = 0.5
        }
    }
}
