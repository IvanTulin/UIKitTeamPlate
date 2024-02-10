// RegistrationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран регистрации
final class RegistrationViewController: UIViewController {
    // MARK: - Private Constants

    private let emailLine: CALayer = {
        let bottonLine = CALayer()
        bottonLine.frame = CGRect(x: 20, y: 372, width: 335, height: 1)
        bottonLine.backgroundColor = UIColor.systemGray4.cgColor
        return bottonLine
    }()

    private let paswordLine: CALayer = {
        let bottonLine = CALayer()
        bottonLine.frame = CGRect(x: 20, y: 448, width: 335, height: 1)
        bottonLine.backgroundColor = UIColor.systemGray4.cgColor
        return bottonLine
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "imageCalendar")
        imageView.frame = CGRect(x: 125, y: 70, width: 125, height: 125)
        return imageView
    }()

    private let birthdayLabel: UILabel = {
        let birthdayLabel = UILabel()
        birthdayLabel.frame = CGRect(x: 100, y: 200, width: 175, height: 44)
        birthdayLabel.numberOfLines = 0
        birthdayLabel.textAlignment = .center
        birthdayLabel.text = "Birthday\nReminder"
        birthdayLabel.textColor = .appViolet
        birthdayLabel.font = UIFont(name: "Verdana-Bold", size: 18)
        return birthdayLabel
    }()

    private let signInLabel: UILabel = {
        let signInLabel = UILabel()
        signInLabel.frame = CGRect(x: 20, y: 266, width: 175, height: 31)
        signInLabel.textAlignment = .left
        signInLabel.text = "Sign in"
        signInLabel.textColor = .appPurple
        signInLabel.font = UIFont(name: "Verdana-Bold", size: 26)
        return signInLabel
    }()

    private let emailLabel: UILabel = {
        let emailLabel = UILabel()
        emailLabel.frame = CGRect(x: 20, y: 318, width: 175, height: 19)
        emailLabel.textAlignment = .left
        emailLabel.text = "Email"
        emailLabel.textColor = .appPurple
        emailLabel.font = UIFont(name: "Verdana-Bold", size: 16)
        return emailLabel
    }()

    private let emailTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.frame = CGRect(x: 20, y: 347, width: 175, height: 20)
        emailTextField.placeholder = "Typing email"
        emailTextField.font = UIFont(name: "Verdana", size: 14)
        return emailTextField
    }()

    private let passwordLabel: UILabel = {
        let emailLabel = UILabel()
        emailLabel.frame = CGRect(x: 20, y: 393, width: 175, height: 19)
        emailLabel.textAlignment = .left
        emailLabel.text = "Password"
        emailLabel.textColor = .appPurple
        emailLabel.font = UIFont(name: "Verdana-Bold", size: 16)
        return emailLabel
    }()

    private let passwordTextField: UITextField = {
        let emailTextField = UITextField()
        emailTextField.frame = CGRect(x: 20, y: 422, width: 175, height: 20)
        emailTextField.placeholder = "Typing password"
        emailTextField.font = UIFont(name: "Verdana", size: 14)
        return emailTextField
    }()

    private let securityButton: UIButton = {
        let securityButton = UIButton()
        securityButton.frame = CGRect(x: 332, y: 419, width: 22, height: 19)
        let eyeImage = UIImage(
            systemName: "eye.slash.fill"
        )?.withRenderingMode(.alwaysTemplate)
        securityButton.setImage(eyeImage, for: .normal)
        securityButton.tintColor = UIColor.systemGray4
        return securityButton
    }()

    private let loginButton: UIButton = {
        let securityButton = UIButton()
        securityButton.frame = CGRect(x: 20, y: 671, width: 335, height: 44)
        securityButton.setTitle("Login", for: .normal)
        securityButton.titleLabel?.font = UIFont(name: "Verdana-Bold", size: 16)
        securityButton.backgroundColor = .appPurple
        securityButton.layer.cornerRadius = 10
        return securityButton
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
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

        view.layer.addSublayer(emailLine)
        view.layer.addSublayer(paswordLine)
    }
}
