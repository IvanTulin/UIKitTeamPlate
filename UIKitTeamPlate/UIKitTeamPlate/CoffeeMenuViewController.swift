// CoffeeMenuViewController.swift
// Copyright © RoadMap. All rights reserved.

// Наташа
import UIKit

/// Контролер кофейнного меню
class CoffeeMenuViewController: UIViewController {
    // MARK: - Visual Components

    /// Кнопка перехода OrderListViewController
    lazy var switchOrderListButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 20, y: 516, width: 335, height: 80)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.red.cgColor
        button.addTarget(self, action: #selector(pressedButton), for: .touchUpInside)
        return button
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    // MARK: - Private Methods

    /// добавляем и конфигурируем UI элементы на контроллер
    private func configureUI() {
        view.backgroundColor = .systemBlue
        view.addSubview(switchOrderListButton)
    }

    /// Переходим на OrderListViewController
    @objc private func pressedButton() {
        let orderContoller = OrderListViewController()
        navigationController?.pushViewController(
            orderContoller,
            animated: true
        )
    }
}
