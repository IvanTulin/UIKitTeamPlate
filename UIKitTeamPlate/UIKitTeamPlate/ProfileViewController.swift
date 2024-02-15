// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

// Наташа
import UIKit

/// Экран профиля
class ProfileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        view.backgroundColor = .systemBlue
        navigationItem.title = "Профиль"
    }
}
