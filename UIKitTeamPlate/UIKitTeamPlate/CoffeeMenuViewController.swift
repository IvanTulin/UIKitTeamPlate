// CoffeeMenuViewController.swift
// Copyright © RoadMap. All rights reserved.

// Наташа
import UIKit

/// Экран кофейнного меню
final class CoffeeMenuViewController: UIViewController {
    // MARK: - Visual Components

    lazy var switchOrderListButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 20, y: 516, width: 335, height: 80)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.red.cgColor
        button.addTarget(
            self,
            action: #selector(showOrderListViewController),
            for: .touchUpInside
        )
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Private Methods

    private func configureUI() {
        view.backgroundColor = .systemBlue
        view.addSubview(switchOrderListButton)
    }

    /// Переходим на OrderListViewController
    @objc private func showOrderListViewController() {
        let orderContoller = OrderListViewController()
        navigationController?.pushViewController(
            orderContoller,
            animated: true
        )
    }
}
