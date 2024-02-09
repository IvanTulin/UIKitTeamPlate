// RegistrationViewController.swift
// Copyright © RoadMap. All rights reserved.

import UIKit

/// Экран регистрации
final class RegistrationViewController: UIViewController {
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "imageCalendar")
        imageView.frame = CGRect(x: 125, y: 70, width: 125, height: 125)
        imageView.backgroundColor = .red
        imageView.layer.borderColor = UIColor.blue.cgColor
        imageView.layer.borderWidth = 2
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        congigure()
    }

    func congigure() {
        view.addSubview(imageView)
    }
}
