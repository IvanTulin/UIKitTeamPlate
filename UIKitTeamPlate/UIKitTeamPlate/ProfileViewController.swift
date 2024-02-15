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
        view.backgroundColor = .white
        navigationItem.title = "Профиль"
        configureTabBar()
    }

    private func configureTabBar() {
        let tabBarItem = UITabBarItem(
            title: "Профиль",
            image: UIImage(named: "profileImage"),
            selectedImage: nil
        )
        self.tabBarItem = tabBarItem
    }
}
