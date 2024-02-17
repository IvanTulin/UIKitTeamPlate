// ProfileViewController.swift
// Copyright © RoadMap. All rights reserved.

// Наташа
import UIKit

/// Экран профиля
final class ProfileViewController: UIViewController {
    // MARK: - Constants

    enum Constant {
        static let nameForTitle = "Профиль"
    }

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Private Methods

    private func configureUI() {
        view.backgroundColor = .systemBlue
        navigationItem.title = Constant.nameForTitle
    }
}
