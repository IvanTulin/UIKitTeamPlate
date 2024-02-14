// AuthorizationView.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// вья авторизации для AuthorizationViewController
final class AuthorizationView: UIView {
    // MARK: - Constants
    
    /// Текстфилд логина
    let loginTextField: UITextField = {
        let loginTextField = UITextField()
        return loginTextField.creatCustomTextField(
            fontName: "Verdana",
            fontSize: 14,
            frame: CGRect(x: 20, y: 113, width: 175, height: 17),
            placeholder: "Введите почту"
        )
    }()

    /// Текстфилд пароля
     let passwordTextField: UITextField = {
        let loginTextField = UITextField()
        return loginTextField.creatCustomTextField(
            fontName: "Verdana",
            fontSize: 14,
            frame: CGRect(x: 20, y: 188, width: 175, height: 17),
            placeholder: "Введите пароль"
        )
    }()
    
    // MARK: - Visual Components

    /// Кнопка перехода на экран MainMenuViewController
    lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 16)
        button.tintColor = .white
        button.backgroundColor = .appTurquoise
        button.frame = CGRect(x: 20, y: 416, width: 335, height: 44)
        button.layer.cornerRadius = 10
        return button
    }()

    /// Лейбл авторизации
    private let authorizationLabel: UILabel = {
        let authorizationLabel = UILabel()
        return authorizationLabel.createCustomLabel(
            text: "Авторизация",
            fontName: "Verdana-Bold",
            fontSize: 26,
            frame: CGRect(x: 20, y: 32, width: 195, height: 31)
        )
    }()

    /// Лейбл логина
    private let loginLabel: UILabel = {
        let loginLabel = UILabel()
        return loginLabel.createCustomLabel(
            text: "Логин",
            fontName: "Verdana-Bold",
            fontSize: 16,
            frame: CGRect(x: 20, y: 84, width: 175, height: 19)
        )
    }()

    /// Лейбл пароля
    private let passwordLabel: UILabel = {
        let passwordLabel = UILabel()
        return passwordLabel.createCustomLabel(
            text: "Пароль",
            fontName: "Verdana-Bold",
            fontSize: 16,
            frame: CGRect(x: 20, y: 159, width: 175, height: 19)
        )
    }()

    /// Кнопка скрывающая пароля
    private lazy var securityButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "eye"), for: .normal)
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
            securityButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        } else {
            passwordTextField.isSecureTextEntry = false
            securityButton.setImage(UIImage(systemName: "eye"), for: .normal)
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
