// RegestrationScreenViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран регистрации
class RegestrationScreenViewController: UIViewController {
    // MARK: - Constants

    let segueIdentifier = "goToCafe"
    private let loginLine = CALayer()
    private let passwordLine = CALayer()

    // MARK: - Properties

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

        // убираем клавиатуру при нажатии на любую часть экрана
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(hideScreen))
        view.addGestureRecognizer(tapGR)
    }

    // MARK: - Methods

    func checkText() {
        loginButton.isEnabled = false
        loginButton.alpha = 0.5
        loginTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }

    func configureUIElements() {
        imageViewLabel.frame = CGRect(x: 110, y: 72, width: 175, height: 165)

        loginLine.frame = CGRect(x: 17, y: 417, width: 335, height: 1)
        loginLine.backgroundColor = UIColor.systemGray4.cgColor
        view.layer.addSublayer(loginLine)

        passwordLine.frame = CGRect(x: 17, y: 496, width: 335, height: 1)
        passwordLine.backgroundColor = UIColor.systemGray4.cgColor
        view.layer.addSublayer(passwordLine)

        loginButton.layer.cornerRadius = 10
    }

    @objc func textFieldDidChange() {
        if let login = loginTextField.text, let password = passwordTextField.text, !login.isEmpty, !password.isEmpty {
            loginButton.isEnabled = true
            loginButton.alpha = 1.0
        } else {
            loginButton.isEnabled = false
            loginButton.alpha = 0.5
        }
    }

    // метод, который убирает клавиатуру при отработке
    @objc func hideScreen() {
        view.endEditing(true)
    }

    @IBAction func securityButton(_ sender: UIButton) {
        isSecureTextEntry.toggle()
        if isSecureTextEntry {
            securityButton.setImage(UIImage(named: "eye.slash"), for: .normal)
            passwordTextField.isSecureTextEntry = false
        } else {
            securityButton.setImage(UIImage(named: "eye"), for: .normal)
            passwordTextField.isSecureTextEntry = true
        }
    }

    @IBAction func loginButton(_ sender: Any) {
        if loginTextField.text == "example@mail.ru", passwordTextField.text == "Qwerty1234" {
            performSegue(withIdentifier: segueIdentifier, sender: nil)
        }
    }
}
