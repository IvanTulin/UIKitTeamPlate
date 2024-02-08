// RegestrationScreenViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран регистрации
class RegestrationScreenViewController: UIViewController {
    private let loginLine = CALayer()
    private let passwordLine = CALayer()

    @IBOutlet var imageViewLabel: UIImageView!
    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUIElements()
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
}
