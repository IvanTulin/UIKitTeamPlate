// MainMenuViewController.swift
// Copyright © RoadMap. All rights reserved.

// Иван
import UIKit

/// Главный контролер с меню
class MainMenuViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(type: .infoDark)
        button.frame = CGRect(x: 50, y: 200, width: 170, height: 30)
        button.addTarget(self, action: #selector(pop), for: .touchUpInside)
        view.addSubview(button)
    }

    @objc private func pop() {
        let vc = CoffeeMenuViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
