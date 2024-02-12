// RegistrationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран регистрации
final class RegistrationViewController: UIViewController {
    // MARK: - Private Constants

    private let faceIDLabel: UILabel = {
        let faceIDLabel = UILabel()
        faceIDLabel.text = "Use FaceID"
        faceIDLabel.font = UIFont(name: "Verdana-Bold", size: 16)
        faceIDLabel.frame = CGRect(x: 86, y: 544, width: 0, height: 0)
        faceIDLabel.sizeToFit()
        return faceIDLabel
    }()

    private let faceIDSwitch: UISwitch = {
        let faceIDSwitch = UISwitch()
        faceIDSwitch.isOn = true
        faceIDSwitch.frame = CGRect(x: 230, y: 538, width: 0, height: 0)
        return faceIDSwitch
    }()

    private let emailLine: CALayer = {
        let emailLine = CALayer()
        return emailLine.createCustomCALayer(
            frame: CGRect(x: 20, y: 372, width: 335, height: 1),
            backgroundColor: .systemGray4
        )
    }()

    private let paswordLine: CALayer = {
        let paswordLine = CALayer()
        return paswordLine.createCustomCALayer(
            frame: CGRect(x: 20, y: 448, width: 335, height: 1),
            backgroundColor: .systemGray4
        )
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        return imageView.createCustomUIImageView(
            imageName: "imageCalendar",
            frame: CGRect(x: 125, y: 70, width: 125, height: 125)
        )
    }()

    private let birthdayLabel: UILabel = {
        let birthdayLabel = UILabel()
        return birthdayLabel.createCustomLabel(
            text: "Birthday\nReminder",
            fontName: "Verdana-Bold",
            fontsize: 18,
            frame: CGRect(x: 100, y: 200, width: 175, height: 44),
            textAligment: .center,
            textColor: .appViolet
        )
    }()

    private let signInLabel: UILabel = {
        let signInLabel = UILabel()
        return signInLabel.createCustomLabel(
            text: "Sign in",
            fontName: "Verdana-Bold",
            fontsize: 26,
            frame: CGRect(x: 20, y: 266, width: 175, height: 31),
            textAligment: .left,
            textColor: .appPurple
        )
    }()

    private let emailLabel: UILabel = {
        let emailLabel = UILabel()
        return emailLabel.createCustomLabel(
            text: "Email",
            fontName: "Verdana-Bold",
            fontsize: 16,
            frame: CGRect(x: 20, y: 318, width: 175, height: 19),
            textAligment: .left,
            textColor: .appPurple
        )
    }()

    private let emailTextField: UITextField = {
        let emailTextField = UITextField()
        return emailTextField.createCustomUITextField(
            frame: CGRect(x: 20, y: 347, width: 175, height: 20),
            placeholder: "Typing email",
            fontName: "Verdana",
            fontSize: 14
        )
    }()

    private let passwordLabel: UILabel = {
        let passwordLabel = UILabel()
        return passwordLabel.createCustomLabel(
            text: "Password",
            fontName: "Verdana-Bold",
            fontsize: 16,
            frame: CGRect(x: 20, y: 393, width: 175, height: 19),
            textAligment: .left,
            textColor: .appPurple
        )
    }()

    private let passwordTextField: UITextField = {
        let emailTextField = UITextField()
        return emailTextField.createCustomUITextField(
            frame: CGRect(x: 20, y: 422, width: 175, height: 20),
            placeholder: "Typing password",
            fontName: "Verdana",
            fontSize: 14
        )
    }()

    // MARK: - Private Properties

    private lazy var securityButton: UIButton = {
        let securityButton = UIButton()
        securityButton.frame = CGRect(x: 332, y: 419, width: 22, height: 19)
        let eyeImage = UIImage(
            systemName: "eye"
        )?.withRenderingMode(.alwaysTemplate)
        securityButton.setImage(eyeImage, for: .normal)
        securityButton.tintColor = UIColor.systemGray4
        securityButton.addTarget(
            self,
            action: #selector(hidePasword),
            for: .touchUpInside
        )
        return securityButton
    }()

    private lazy var loginButton: UIButton = {
        let loginButton = UIButton()
        loginButton.frame = CGRect(x: 20, y: 671, width: 335, height: 44)
        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 16)
        loginButton.backgroundColor = .appPurple
        loginButton.layer.cornerRadius = 10
        loginButton.addTarget(self, action: #selector(switchToTheNextController), for: .touchUpInside)
        return loginButton
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
        checkText()
    }

    // MARK: - Private Methods

    private func setupUI() {
        view.addSubview(imageView)
        view.addSubview(birthdayLabel)
        view.addSubview(signInLabel)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(securityButton)
        view.addSubview(loginButton)
        view.addSubview(faceIDLabel)
        view.addSubview(faceIDSwitch)

        view.layer.addSublayer(emailLine)
        view.layer.addSublayer(paswordLine)

        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(removeKeyboard)
        )
        view.addGestureRecognizer(tapGesture)
    }

    /// проверяем на пустоту текста эмейл и пароль
    private func checkText() {
        faceIDLabel.isHidden = true
        faceIDSwitch.isHidden = true

        loginButton.isEnabled = false
        loginButton.alpha = 0.5
        emailTextField.addTarget(self, action: #selector(activateLoginButton), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(activateLoginButton), for: .editingChanged)
    }

    /// активация кнопки loginButton
    @objc private func activateLoginButton() {
        if let login = emailTextField.text, let password = passwordTextField.text, !login.isEmpty, !password.isEmpty {
            loginButton.isEnabled = true
            loginButton.alpha = 1.0
            faceIDLabel.isHidden = false
            faceIDSwitch.isHidden = false
        } else {
            loginButton.isEnabled = false
            loginButton.alpha = 0.5
            faceIDLabel.isHidden = true
            faceIDSwitch.isHidden = true
        }
    }

    /// скрывать клавиатуру
    @objc private func removeKeyboard() {
        view.endEditing(true)
    }

    /// скрыть пароль
    @objc private func hidePasword() {
        if passwordTextField.isSecureTextEntry == false {
            passwordTextField.isSecureTextEntry = true
            securityButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
        } else {
            passwordTextField.isSecureTextEntry = false
            securityButton.setImage(UIImage(systemName: "eye"), for: .normal)
        }
    }

    /// метод для перехода на экран BirthdayReminderViewController
    @objc private func switchToTheNextController() {
        if emailTextField.text == "example@mail.ru", passwordTextField.text == "Qwerty1234" {
            let birthdayVC = BirthdayReminderViewController()
            navigationController?.pushViewController(birthdayVC, animated: true)
        }
    }
}
