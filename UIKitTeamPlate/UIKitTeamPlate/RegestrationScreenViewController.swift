// RegestrationScreenViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран регистрации
final class RegestrationScreenViewController: UIViewController {
    // MARK: - Private Properties

    private let segueIdentifier = "goToCafe"
    private var isSecureTextEntry = false

    // MARK: - @IBOutlets

    @IBOutlet var imageViewLabel: UIImageView!
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    @IBOutlet var securityButton: UIButton!

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        checkText()
        configureUIElements()
    }

    // MARK: - Private Method

    private func checkText() {
        loginButton.isEnabled = false
        loginButton.alpha = 0.5
        loginTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }

    private func configureUIElements() {
        // убираем клавиатуру при нажатии на любую часть экрана
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(hideScreen))
        view.addGestureRecognizer(tapGR)
    }

    @objc private func textFieldDidChange() {
        if let login = loginTextField.text, let password = passwordTextField.text, !login.isEmpty, !password.isEmpty {
            loginButton.isEnabled = true
            loginButton.alpha = 1.0
        } else {
            loginButton.isEnabled = false
            loginButton.alpha = 0.5
        }
    }

    // метод, который убирает клавиатуру при отработке
    @objc private func hideScreen() {
        view.endEditing(true)
    }

    @IBAction func securityButton(_ sender: UIButton) {
        if isSecureTextEntry {
            securityButton.setImage(UIImage(systemName: "eye.slash.fill"), for: .normal)
            passwordTextField.isSecureTextEntry = true
            isSecureTextEntry = false
        } else {
            securityButton.setImage(UIImage(systemName: "eye"), for: .normal)
            passwordTextField.isSecureTextEntry = false
            isSecureTextEntry = true
        }
    }

    @IBAction func loginButton(_ sender: Any) {
        if loginTextField.text == "example@mail.ru", passwordTextField.text == "Qwerty1234" {
            performSegue(withIdentifier: segueIdentifier, sender: nil)
        }
    }
}
