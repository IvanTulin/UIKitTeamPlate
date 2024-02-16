// CatalogViewController.swift
// Copyright © RoadMap. All rights reserved.

// Иван
import UIKit

/// Экран католога
class CatalogViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        view.backgroundColor = .white
        navigationItem.title = "Каталог"
        configureTabBar()
    }

    private func configureTabBar() {
        let tabBarItem = UITabBarItem(
            title: "Каталог",
            image: .catalog,
            selectedImage: nil
        )
        self.tabBarItem = tabBarItem
    }
}
