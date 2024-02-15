// ShoppingCartViewController.swift
// Copyright © RoadMap. All rights reserved.

// Наташа
import UIKit

/// Экран корзины покупок
class ShoppingCartViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    private func configureUI() {
        view.backgroundColor = .orange
        navigationItem.title = "Корзина"
    }
}
